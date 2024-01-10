data:extend({{
  type = "bool-setting",
  name = "train-battery-decay-enable-setting",
  setting_type = "startup",
  default_value = "true"
}, {
  type = "string-setting",
  name = "train-battery-pack-energy-density-setting",
  setting_type = "startup",
  default_value = "25 MJ (Default)",
  allowed_values = {"25 MJ (Default)", "50 MJ"}
}, {
  type = "string-setting",
  name = "electric-fluid-wagon-capacity-setting",
  setting_type = "startup",
  default_value = "30.000 (Default)",
  allowed_values = {"25.000 (Vanilla)", "30.000 (Default)"}
}, {
  type = "string-setting",
  name = "electric-cargo-wagon-capacity-setting",
  setting_type = "startup",
  default_value = "50 Slots (Default)",
  allowed_values = {"40 Slots (Vanilla)", "50 Slots (Default)", "120 Slots (Extended)"}
}, {
  type = "string-setting",
  name = "electric-locomotive-speed-setting",
  setting_type = "startup",
  default_value = "518 km/h (Default)",
  allowed_values = {"238 km/h (Vanilla)", "378 km/h", "518 km/h (Default)"}
}})
