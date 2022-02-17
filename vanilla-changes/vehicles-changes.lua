---------------------
-- -- Add Space Trains
---------------------
data:extend({{
    type = "recipe",
    name = "recipe-space-locomotive",
    energy_required = 60,
    enabled = false,
    ingredients = {{"locomotive", 1}, {"processing-unit", 20}},
    result = "item-space-locomotive"
}, {
    type = "recipe",
    name = "recipe-space-cargo-wagon",
    energy_required = 60,
    enabled = false,
    ingredients = {{"cargo-wagon", 1}, {"advanced-circuit", 10}},
    result = "item-space-cargo-wagon"
}, {
    type = "recipe",
    name = "recipe-space-fluid-wagon",
    energy_required = 60,
    enabled = false,
    ingredients = {{"fluid-wagon", 1}, {"advanced-circuit", 10}},
    result = "item-space-fluid-wagon"
}, {
    type = "recipe",
    name = "space-train-battery-charging-station",
    energy_required = 10,
    enabled = false,
    ingredients = {{"steel-plate", 15}, {"advanced-circuit", 5}, {"copper-cable", 20}},
    result = "space-train-battery-charging-station"
}, {
    type = "recipe",
    name = "space-train-battery-pack",
    category = "advanced-crafting",
    energy_required = 10,
    enabled = false,
    allow_as_intermediate = false,
    ingredients = {{"steel-plate", 2}},
    localised_name = {"recipe-name.space-train-discharged-battery-pack-desc"},
    result = "space-train-discharged-battery-pack"
}, {
    type = "recipe",
    name = "space-train-battery-pack-recharge",
    category = "electrical",
    hidden = true,
    energy_required = 30,
    enabled = false,
    icon = "__se-space-trains__/graphics/icons/battery.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    allow_as_intermediate = false,
    ingredients = {{"space-train-discharged-battery-pack", 1}},
    results = {{
        name = "space-train-destroyed-battery-pack",
        probability = 0.01,
        amount = 1
    }, {
        name = "space-train-battery-pack",
        probability = 0.99,
        amount = 1
    }}
}})
------------------------------------------
-- Startup Settings handling happens here.
------------------------------------------
if settings.startup["space-locomotive-speed-setting"].value == "238 km/h (Vanilla)" then
    data.raw["locomotive"]["space-locomotive"].max_speed = 1.1
    data.raw["cargo-wagon"]["space-cargo-wagon"].max_speed = 1.1
    data.raw["fluid-wagon"]["space-fluid-wagon"].max_speed = 1.1
end
if settings.startup["space-cargo-wagon-capacity-setting"].value == "40 Items (Vanilla)" then
    data.raw["cargo-wagon"]["space-cargo-wagon"].inventory_size = 40
end
if settings.startup["space-fluid-wagon-capacity-setting"].value == "25.000 (Vanilla)" then
    data.raw["fluid-wagon"]["space-fluid-wagon"].capacity = 25000
end
if settings.startup["space-battery-pack-energy-density-setting"].value == "100 MJ" then
    data.raw["assembling-machine"]["space-train-battery-charging-station"].energy_usage = "3.3MW"
    data.raw["item"]["space-train-battery-pack"].fuel_value = "100MJ"
end
if settings.startup["space-battery-decay-enable-setting"].value then
    data:extend({{
        type = "item",
        name = "space-train-destroyed-battery-pack",
        icon = "__se-space-trains__/graphics/icons/destroyed-battery.png",
        icon_size = 128,
        pictures = {
            layers = {{
                size = 128,
                filename = "__se-space-trains__/graphics/icons/destroyed-battery.png",
                scale = 0.125
            }, {
                draw_as_light = true,
                flags = {"light"},
                size = 128,
                filename = "__se-space-trains__/graphics/icons/destroyed-battery_light.png",
                scale = 0.125
            }}
        },
        burnt_result = "space-train-discharged-battery-pack",
        subgroup = "intermediate-product",
        order = "s-a[destroyed-battery-pack]",
        stack_size = 60
    }, {
        type = "recipe",
        name = "space-train-battery-pack-refurbish",
        energy_required = 10,
        enabled = false,
        category = "chemistry",
        ingredients = {{"space-train-destroyed-battery-pack", 1}, {
            type = "fluid",
            name = "sulfuric-acid",
            amount = 20
        }},
        icon = "__se-space-trains__/graphics/icons/destroyed-battery.png",
        icon_size = 128,
        allow_as_intermediate = false,
        localised_name = {"recipe-name.space-train-battery-pack-refurbish-desc"},
        result = "space-train-discharged-battery-pack"
    }})
else
    data.raw["recipe"]["space-train-battery-pack-recharge"].results = {{
        name = "space-train-battery-pack",
        amount = 1
    }}
end
------------------------------------------
-- Handling Mod cases happens here
------------------------------------------
if mods["Krastorio2"] then
    data.raw["locomotive"]["space-locomotive"].equipment_grid = "kr-locomotive-grid"
    data.raw["cargo-wagon"]["space-cargo-wagon"].equipment_grid = "kr-wagons-grid"
    data.raw["fluid-wagon"]["space-fluid-wagon"].equipment_grid = "kr-wagons-grid"

    table.insert(data.raw["recipe"]["recipe-space-locomotive"].ingredients, {"electronic-components", 20})
    table.insert(data.raw["recipe"]["recipe-space-locomotive"].ingredients, {"steel-gear-wheel", 20})
    table.insert(data.raw["recipe"]["recipe-space-cargo-wagon"].ingredients, {"steel-gear-wheel", 20})
    table.insert(data.raw["recipe"]["recipe-space-fluid-wagon"].ingredients, {"steel-gear-wheel", 20})
    table.insert(data.raw["recipe"]["space-train-battery-pack"].ingredients, {"lithium-sulfur-battery", 10})
    if settings.startup["space-battery-decay-enable-setting"].value then
        table.insert(data.raw["recipe"]["space-train-battery-pack-refurbish"].ingredients, {"lithium-sulfur-battery", 5})
    end
else
    if settings.startup["space-battery-decay-enable-setting"].value then
        table.insert(data.raw["recipe"]["space-train-battery-pack"].ingredients, {"battery", 20})
        table.insert(data.raw["recipe"]["space-train-battery-pack-refurbish"].ingredients, {"battery", 10})
    end
end

if mods["space-exploration"] then
    table.insert(data.raw["technology"]["se-space-rail"].effects, {
        type = "unlock-recipe",
        recipe = "recipe-space-locomotive"
    })
    table.insert(data.raw["technology"]["se-space-rail"].effects, {
        type = "unlock-recipe",
        recipe = "recipe-space-fluid-wagon"
    })
    table.insert(data.raw["technology"]["se-space-rail"].effects, {
        type = "unlock-recipe",
        recipe = "recipe-space-cargo-wagon"
    })
    table.insert(data.raw["technology"]["se-space-rail"].effects, {
        type = "unlock-recipe",
        recipe = "space-train-battery-charging-station"
    })
    table.insert(data.raw["technology"]["se-space-rail"].effects, {
        type = "unlock-recipe",
        recipe = "space-train-battery-pack"
    })
    table.insert(data.raw["technology"]["se-space-rail"].effects, {
        type = "unlock-recipe",
        recipe = "space-train-battery-pack-recharge"
    })
    if settings.startup["space-battery-decay-enable-setting"].value then
        table.insert(data.raw["technology"]["se-space-rail"].effects, {
            type = "unlock-recipe",
            recipe = "space-train-battery-pack-refurbish"
        })
        data.raw["recipe"]["space-train-battery-pack-refurbish"].category = "hard-recycling"
        data.raw["recipe"]["space-train-battery-pack-refurbish"].subgroup = "space-recycling"
    end
    -- Change recipes accordingly when space exploration mods are installed and used
    table.insert(data.raw["recipe"]["recipe-space-locomotive"].ingredients, {"se-heat-shielding", 20})
    table.insert(data.raw["recipe"]["recipe-space-cargo-wagon"].ingredients, {"se-heat-shielding", 20})
    table.insert(data.raw["recipe"]["recipe-space-fluid-wagon"].ingredients, {"se-heat-shielding", 20})
    table.insert(data.raw["recipe"]["space-train-battery-charging-station"].ingredients, {"se-heat-shielding", 20})

    data.raw["assembling-machine"]["space-train-battery-charging-station"].se_allow_in_space = true
else
    table.insert(data.raw["recipe"]["recipe-space-locomotive"].ingredients, {"steel-plate", 20})
    table.insert(data.raw["recipe"]["recipe-space-cargo-wagon"].ingredients, {"steel-plate", 20})
    table.insert(data.raw["recipe"]["recipe-space-fluid-wagon"].ingredients, {"steel-plate", 20})

    data:extend({ -- TECHNOMANS
    {
        type = "technology",
        name = "tech-space-trains",
        mod = "space-trains",
        icon = "__se-space-trains__/graphics/icons/space-trains-tech.png",
        icon_size = 256,
        icon_mipmaps = 4,
        effects = {{
            type = "unlock-recipe",
            recipe = "recipe-space-locomotive"
        }, {
            type = "unlock-recipe",
            recipe = "recipe-space-fluid-wagon"
        }, {
            type = "unlock-recipe",
            recipe = "recipe-space-cargo-wagon"
        }, {
            type = "unlock-recipe",
            recipe = "space-train-battery-charging-station"
        }, {
            type = "unlock-recipe",
            recipe = "space-train-battery-pack"
        }, {
            type = "unlock-recipe",
            recipe = "space-train-battery-pack-recharge"
        }},
        prerequisites = {"railway", "nuclear-power", "production-science-pack"},
        unit = {
            count = 500,
            ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1},
                           {"production-science-pack", 1}},
            time = 60
        }
    }})
    if settings.startup["space-battery-decay-enable-setting"].value then
        table.insert(data.raw["technology"]["tech-space-trains"].effects, {
            type = "unlock-recipe",
            recipe = "space-train-battery-pack-refurbish"
        })
    end
end
