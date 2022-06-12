data:extend({
    {
        type = "bool-setting",
        name = "space-battery-decay-enable-setting",
        setting_type = "startup",
        default_value = "true"
    },{
        type = "string-setting",
        name = "space-battery-pack-energy-density-setting",
        setting_type = "startup",
        default_value = "50 MJ (Default)",
        allowed_values = {
            "50 MJ (Default)",
            "100 MJ"
        }
    },{
        type = "string-setting",
        name = "space-fluid-wagon-capacity-setting",
        setting_type = "startup",
        default_value = "30.000 (Default)",
        allowed_values = {
            "25.000 (Vanilla)",
            "30.000 (Default)"
        }
    },{
        type = "string-setting",
        name = "space-cargo-wagon-capacity-setting",
        setting_type = "startup",
        default_value = "50 Slots (Default)",
        allowed_values = {
            "40 Slots (Vanilla)",
            "50 Slots (Default)"
        }
    },
    {
        type = "string-setting",
        name = "space-locomotive-speed-setting",
        setting_type = "startup",
        default_value = "518 km/h (Default)",
        allowed_values = {
            "238 km/h (Vanilla)",
            "378 km/h",
            "518 km/h (Default)"
        }
    }
})