// Copyright 2026 The ChromiumOS Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//
// ash-set-display-size <width> <height>   resize the Ash host window
// ash-set-display-size --list             dump the X window tree (diagnostic)
//
// Ash's WindowTreeHost treats a host-window resize as a display change
// (OnHostResized -> UpdateDisplayBounds, gated on the change_display_upon_
// host_resize chrome patch), so resizing its X window makes Ash reconfigure
// its display to that size. With no window manager and a single Ash client,
// the host window is the largest viewable top-level child of the root.
//
// Exit status (resize mode):
//   0  found a viewable top-level window and the server applied the new size
//   1  no viewable top-level window yet (caller should retry), or resize did
//      not take
//   2  usage error
// The caller retries on 1 to ride out Chrome still starting up.

#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static Window largest_viewable_toplevel(Display* dpy, Window root,
                                        int* out_w, int* out_h) {
  Window r, parent, *kids = NULL;
  unsigned int nk = 0;
  if (!XQueryTree(dpy, root, &r, &parent, &kids, &nk)) {
    return 0;
  }
  Window best = 0;
  unsigned long best_area = 0;
  for (unsigned int i = 0; i < nk; i++) {
    XWindowAttributes a;
    if (XGetWindowAttributes(dpy, kids[i], &a) && a.map_state == IsViewable &&
        a.class == InputOutput) {
      unsigned long area = (unsigned long)a.width * (unsigned long)a.height;
      if (area > best_area) {
        best_area = area;
        best = kids[i];
        if (out_w) *out_w = a.width;
        if (out_h) *out_h = a.height;
      }
    }
  }
  if (kids) XFree(kids);
  return best;
}

static void describe(Display* dpy, Window w, const char* indent) {
  XWindowAttributes a;
  if (!XGetWindowAttributes(dpy, w, &a)) return;
  char* name = NULL;
  XFetchName(dpy, w, &name);
  XClassHint ch = {NULL, NULL};
  XGetClassHint(dpy, w, &ch);
  printf("%s0x%lx %dx%d+%d+%d %s %s class=[%s,%s] name=\"%s\"\n", indent, w,
         a.width, a.height, a.x, a.y,
         a.map_state == IsViewable ? "viewable" : "hidden",
         a.override_redirect ? "override" : "managed",
         ch.res_name ? ch.res_name : "", ch.res_class ? ch.res_class : "",
         name ? name : "");
  if (name) XFree(name);
  if (ch.res_name) XFree(ch.res_name);
  if (ch.res_class) XFree(ch.res_class);
}

int main(int argc, char** argv) {
  Display* dpy = XOpenDisplay(NULL);
  if (!dpy) {
    fprintf(stderr, "cannot open display\n");
    return 1;
  }
  Window root = DefaultRootWindow(dpy);

  if (argc == 2 && strcmp(argv[1], "--list") == 0) {
    Window r, parent, *kids = NULL;
    unsigned int nk = 0;
    XQueryTree(dpy, root, &r, &parent, &kids, &nk);
    printf("root 0x%lx has %u top-level children:\n", root, nk);
    for (unsigned int i = 0; i < nk; i++) {
      describe(dpy, kids[i], "  ");
    }
    if (kids) XFree(kids);
    XCloseDisplay(dpy);
    return 0;
  }

  if (argc != 3) {
    fprintf(stderr, "usage: %s <w> <h> | --list\n", argv[0]);
    XCloseDisplay(dpy);
    return 2;
  }
  int w = atoi(argv[1]), h = atoi(argv[2]);
  if (w <= 0 || h <= 0) {
    XCloseDisplay(dpy);
    return 2;
  }

  int cur_w = 0, cur_h = 0;
  Window target = largest_viewable_toplevel(dpy, root, &cur_w, &cur_h);
  if (!target) {
    XCloseDisplay(dpy);
    return 1;  // no window yet -> retry
  }

  XMoveResizeWindow(dpy, target, 0, 0, (unsigned int)w, (unsigned int)h);
  XSync(dpy, False);

  XWindowAttributes after;
  int ok = XGetWindowAttributes(dpy, target, &after) && after.width == w &&
           after.height == h;

  if (ok) {
    // After a host resize Ash defers its relayout/repaint until an input event
    // arrives -- on a normally-running desktop the cursor/animations drive
    // frames, but at a headless boot nothing does, so the new layout sits
    // half-applied until the user moves the mouse. Synthesize that wake-up with
    // a net-zero pointer nudge.
    XWarpPointer(dpy, None, None, 0, 0, 0, 0, 1, 0);
    XWarpPointer(dpy, None, None, 0, 0, 0, 0, -1, 0);
    XSync(dpy, False);
  }

  XCloseDisplay(dpy);
  return ok ? 0 : 1;  // 1 if the resize didn't take -> retry
}
