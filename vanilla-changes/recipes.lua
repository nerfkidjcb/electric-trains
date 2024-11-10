---------------------
-- -- Add Space Trains
---------------------
data:extend({{
    type = "recipe",
    name = "recipe-electric-locomotive",
    energy_required = 60,
    enabled = false,
    ingredients = {{
        type = "item",
        name = "locomotive",
        amount = 1
    }, {
        type = "item",
        name = "processing-unit",
        amount = 20
    }},
    results = {{
        type = "item",
        name = "electric-locomotive",
        amount = 1
    }},
    order = "c[rolling-stock]-f[locomotive]"
}, -- Electric Wagon Locomotive
{
    type = "recipe",
    name = "recipe-electric-locomotive-wagon",
    energy_required = 60,
    enabled = false,
    ingredients = {{
        type = "item",
        name = "locomotive",
        amount = 1
    }, {
        type = "item",
        name = "processing-unit",
        amount = 20
    }},
    results = {{
        type = "item",
        name = "electric-locomotive-wagon",
        amount = 1
    }},
    order = "c[rolling-stock]-f[locomotiveb]"
}, {
    type = "recipe",
    name = "recipe-electric-cargo-wagon",
    energy_required = 60,
    enabled = false,
    ingredients = {{
        type = "item",
        name = "cargo-wagon",
        amount = 1
    }, {
        type = "item",
        name = "processing-unit",
        amount = 10
    }},
    results = {{
        type = "item",
        name = "electric-cargo-wagon",
        amount = 1
    }},
    order = "c[rolling-stock]-h[cargo-wagon]"
}, {
    type = "recipe",
    name = "recipe-electric-fluid-wagon",
    energy_required = 60,
    enabled = false,
    ingredients = {{
        type = "item",
        name = "fluid-wagon",
        amount = 1
    }, {
        type = "item",
        name = "processing-unit",
        amount = 10
    }},
    results = {{
        type = "item",
        name = "electric-fluid-wagon",
        amount = 1
    }},
    order = "c[rolling-stock]-h[fluid-wagon]"
}, {
    type = "recipe",
    name = "electric-train-battery-charging-station",
    energy_required = 60,
    enabled = false,
    ingredients = {{
        type = "item",
        name = "steel-plate",
        amount = 15
    }, {
        type = "item",
        name = "processing-unit",
        amount = 5
    }, {
        type = "item",
        name = "copper-cable",
        amount = 20
    }},
    results = {{
        type = "item",
        name = "electric-train-battery-charging-station",
        amount = 1
    }}
}, -- Experimental charging station
{
    type = "recipe",
    name = "experimental-electric-train-battery-charging-station",
    energy_required = 120,
    enabled = false,
    ingredients = {{
        type = "item",
        name = "steel-plate",
        amount = 25
    }, {
        type = "item",
        name = "processing-unit",
        amount = 50
    }, {
        type = "item",
        name = "copper-cable",
        amount = 200
    }, {
        type = "item",
        name = "electric-train-battery-charging-station",
        amount = 1
    }},
    results = {{
        type = "item",
        name = "experimental-electric-train-battery-charging-station",
        amount = 1
    }}
}, {
    type = "recipe",
    name = "electric-train-battery-pack",
    category = "advanced-crafting",
    energy_required = 10,
    enabled = false,
    allow_as_intermediate = false,
    ingredients = {{
        type = "item",
        name = "steel-plate",
        amount = 2
    }, {
        type = "item",
        name = "battery",
        amount = 20
    }},
    localised_name = {"recipe-name.electric-train-discharged-battery-pack-desc"},
    results = {{
        type = "item",
        name = "electric-train-discharged-battery-pack",
        amount = 1
    }},
    order = "s-[battery-pack-a]"
}, {
    type = "recipe",
    name = "recipe-electric-train-alkaline-battery-pack",
    category = "advanced-crafting",
    energy_required = 10,
    enabled = false,
    allow_as_intermediate = false,
    ingredients = {{
        type = "item",
        name = "steel-plate",
        amount = 2
    }, {
        type = "item",
        name = "battery",
        amount = 5
    }},
    localised_name = {"recipe-name.electric-train-alkaline-battery-pack-desc"},
    results = {{
        type = "item",
        name = "electric-train-alkaline-battery-pack",
        amount = 1
    }},
    order = "s-[battery-pack-a]"
}, -- Speed, acceleration and efficiency battery-packs
{
    type = "recipe",
    name = "speed-battery-pack",
    category = "advanced-crafting",
    energy_required = 20,
    enabled = false,
    allow_as_intermediate = false,
    ingredients = {{
        type = "item",
        name = "steel-plate",
        amount = 2
    }, {
        type = "item",
        name = "battery",
        amount = 20
    }, {
        type = "item",
        name = "electric-train-discharged-battery-pack",
        amount = 1
    }, {
        type = "item",
        name = "speed-module-3",
        amount = 1
    }},
    localised_name = {"recipe-name.discharged-speed-battery-pack-desc"},
    results = {{
        type = "item",
        name = "discharged-speed-battery-pack",
        amount = 1
    }},
    order = "s-[battery-pack-d]"
}, {
    type = "recipe",
    name = "acceleration-battery-pack",
    category = "advanced-crafting",
    energy_required = 20,
    enabled = false,
    allow_as_intermediate = false,
    ingredients = {{
        type = "item",
        name = "steel-plate",
        amount = 2
    }, {
        type = "item",
        name = "battery",
        amount = 20
    }, {
        type = "item",
        name = "electric-train-discharged-battery-pack",
        amount = 1
    }, {
        type = "item",
        name = "productivity-module-3",
        amount = 1
    }},
    localised_name = {"recipe-name.discharged-acceleration-battery-pack-desc"},
    results = {{
        type = "item",
        name = "discharged-acceleration-battery-pack",
        amount = 1
    }},
    order = "s-[battery-pack-b]"
}, {
    type = "recipe",
    name = "efficiency-battery-pack",
    category = "advanced-crafting",
    energy_required = 20,
    enabled = false,
    allow_as_intermediate = false,
    ingredients = {{
        type = "item",
        name = "steel-plate",
        amount = 2
    }, {
        type = "item",
        name = "battery",
        amount = 20
    }, {
        type = "item",
        name = "electric-train-discharged-battery-pack",
        amount = 1
    }, {
        type = "item",
        name = "efficiency-module-3",
        amount = 1
    }},
    localised_name = {"recipe-name.discharged-efficiency-battery-pack-desc"},
    results = {{
        type = "item",
        name = "discharged-efficiency-battery-pack",
        amount = 1
    }},
    order = "s-[battery-pack-c]"
}, -- Charging speed, acceleration and efficiency battery-packs
{
    type = "recipe",
    name = "speed-battery-pack-recharge",
    category = "faster-electrical",
    hidden = false,
    hide_from_player_crafting = true,
    energy_required = 60,
    enabled = false,
    icon = "__electric-trains__/graphics/icons/speed-battery/fast-speed-battery.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    allow_as_intermediate = false,
    ingredients = {{
        type = "item",
        name = "discharged-speed-battery-pack",
        amount = 1
    }},
    order = "d",
    results = {{
        type = "item",
        name = "destroyed-speed-battery-pack",
        probability = 0.05,
        amount = 1
    }, {
        type = "item",
        name = "speed-battery-pack",
        probability = 0.95,
        amount = 1
    }}
}, {
    type = "recipe",
    name = "acceleration-battery-pack-recharge",
    category = "faster-electrical",
    hidden = false,
    hide_from_player_crafting = true,
    energy_required = 60,
    enabled = false,
    icon = "__electric-trains__/graphics/icons/acceleration-battery/fast-acceleration-battery.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    allow_as_intermediate = false,
    ingredients = {{
        type = "item",
        name = "discharged-acceleration-battery-pack",
        amount = 1
    }},
    order = "b",
    results = {{
        type = "item",
        name = "destroyed-acceleration-battery-pack",
        probability = 0.05,
        amount = 1
    }, {
        type = "item",
        name = "acceleration-battery-pack",
        probability = 0.95,
        amount = 1
    }}
}, {
    type = "recipe",
    name = "efficiency-battery-pack-recharge",
    category = "faster-electrical",
    hidden = false,
    hide_from_player_crafting = true,
    energy_required = 60,
    enabled = false,
    icon = "__electric-trains__/graphics/icons/efficiency-battery/fast-efficiency-battery.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    allow_as_intermediate = false,
    ingredients = {{
        type = "item",
        name = "discharged-efficiency-battery-pack",
        amount = 1
    }},
    order = "c",
    results = {{
        type = "item",
        name = "destroyed-efficiency-battery-pack",
        probability = 0.05,
        amount = 1
    }, {
        type = "item",
        name = "efficiency-battery-pack",
        probability = 0.95,
        amount = 1
    }}
}, {
    type = "recipe",
    name = "electric-train-battery-pack-recharge",
    category = "electrical",
    hidden = false,
    hide_from_player_crafting = true,
    energy_required = 60,
    enabled = false,
    icon = "__electric-trains__/graphics/icons/battery.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    allow_as_intermediate = false,
    ingredients = {{
        type = "item",
        name = "electric-train-discharged-battery-pack",
        amount = 1
    }},
    results = {{
        type = "item",
        name = "electric-train-destroyed-battery-pack",
        probability = 0.01,
        amount = 1
    }, {
        type = "item",
        name = "electric-train-battery-pack",
        probability = 0.99,
        amount = 1
    }}
}, {
    -- Faster space train battery pack recharge
    type = "recipe",
    name = "faster-electric-train-battery-pack-recharge",
    category = "faster-electrical",
    hidden = false,
    hide_from_player_crafting = true,
    energy_required = 20,
    enabled = false,
    icon = "__electric-trains__/graphics/icons/fast-battery.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    allow_as_intermediate = false,
    ingredients = {{
        type = "item",
        name = "electric-train-discharged-battery-pack",
        amount = 1
    }},
    order = "a",
    results = {{
        type = "item",
        name = "electric-train-destroyed-battery-pack",
        probability = 0.15,
        amount = 1
    }, {
        type = "item",
        name = "electric-train-battery-pack",
        probability = 0.85,
        amount = 1
    }}
}})

