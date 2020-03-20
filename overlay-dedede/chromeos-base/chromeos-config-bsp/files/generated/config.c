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
              .signature_id = "waddledoo"}},

    {.platform_name = "dedede",
     .firmware_name_match = "Waddledee",
     .sku_id = 2147483647,
     .customization_id = "",
     .whitelabel_tag = "",
     .info = {.brand = "",
              .model = "waddledee",
              .customization = "waddledee",
              .signature_id = "waddledee"}},

    {.platform_name = "dedede",
     .firmware_name_match = "Jslrvp",
     .sku_id = 2147483647,
     .customization_id = "",
     .whitelabel_tag = "",
     .info = {.brand = "",
              .model = "jslrvp",
              .customization = "jslrvp",
              .signature_id = "jslrvp"}}
};

const struct config_map *cros_config_get_config_map(int *num_entries) {
  *num_entries = 3;
  return &all_configs[0];
}
