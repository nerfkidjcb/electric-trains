data:extend({{
  type = "string-setting",
  name = "train-battery-decay-enable-setting",
  setting_type = "startup",
  default_value = "true",
  allowed_values = {"true", "false"}
}, {
  type = "string-setting",
  name = "train-battery-pack-energy-density-setting",
  setting_type = "startup",
  default_value = "40 MJ (Default)",
  allowed_values = {"40 MJ (Default)", "80 MJ"}
}, {
  type = "string-setting",
  name = "electric-fluid-wagon-capacity-setting",
  setting_type = "startup",
  default_value = "60.000 (Default)",
  allowed_values = {"50.000 (Vanilla)", "60.000 (Default)", "150.000 (Extended)"}
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
  allowed_values = {"238 km/h (Vanilla)", "378 km/h", "518 km/h (Default)", "714 km/h (Extended)"}
}})
