#include "lib/cros_config_struct.h"

static struct config_map all_configs[] = {
    {.platform_name = "dedede",
     .firmware_name_match = "Waddledoo",
     .sku_id = 2147483647,
     .customization_id = "",
     .whitelabel_tag = "",
     .info = {.brand = "",
              .model = "waddledoo",
              .customization = "waddledoo",
              .signature_id = "waddledoo"}}
};

const struct config_map *cros_config_get_config_map(int *num_entries) {
  *num_entries = 1;
  return &all_configs[0];
}
