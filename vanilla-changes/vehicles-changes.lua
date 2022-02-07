---------------------
-- -- Add Space Trains
---------------------
data:extend({{
    type = "recipe",
    name = "recipe-space-locomotive",
    -- energy_required = 60,
    energy_required = 2,
    enabled = false,
    allow_productivity = true,
    ingredients = {
        -- { "locomotive", 1 },
        -- { "electronic-components", 20 },
        -- { "steel-gear-wheel", 20 },
        -- { "processing-unit", 20 },
        -- { "rare-metals", 80 },
    },
    result = "item-space-locomotive"
}, {
    type = "recipe",
    name = "recipe-space-cargo-wagon",
    -- energy_required = 60,
    energy_required = 2,
    enabled = false,
    allow_productivity = true,
    ingredients = {
        -- { "locomotive", 1 },
        -- { "electronic-components", 20 },
        -- { "steel-gear-wheel", 20 },
        -- { "processing-unit", 20 },
        -- { "rare-metals", 80 },
    },
    result = "item-space-cargo-wagon"
}, {
    type = "recipe",
    name = "recipe-space-fluid-wagon",
    -- energy_required = 60,
    energy_required = 2,
    enabled = false,
    allow_productivity = true,
    ingredients = {
        -- { "locomotive", 1 },
        -- { "electronic-components", 20 },
        -- { "steel-gear-wheel", 20 },
        -- { "processing-unit", 20 },
        -- { "rare-metals", 80 },
    },
    result = "item-space-fluid-wagon"
}, {
    type = "recipe",
    name = "space-train-battery-charging-station",
    energy_required = 5,
    enabled = false,
    ingredients = {
        -- {"iron-plate", 15},
        -- {"advanced-circuit", 5},
        -- {"copper-cable", 20}
    },
    result = "space-train-battery-charging-station"
}, {
    type = "recipe",
    name = "space-train-battery-pack",
    energy_required = 10,
    enabled = false,
    ingredients = {
        -- {"steel-plate", 2},
        -- {"battery", 20}
    },
    result = "space-train-battery-pack"
}, {
    type = "recipe",
    name = "space-train-battery-pack-recharge",
    category = "electrical",
    energy_required = 10,
    enabled = false,
    ingredients = {{"space-train-discharged-battery-pack", 1}},
    result = "space-train-battery-pack"
}})

if mods["Krastorio2"] then
    data.raw["locomotive"]["space-locomotive"].equipment_grid = "kr-locomotive-grid"
    data.raw["cargo-wagon"]["space-cargo-wagon"].equipment_grid = "kr-wagons-grid"
    data.raw["fluid-wagon"]["space-fluid-wagon"].equipment_grid = "kr-wagons-grid"
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
    data.raw["assembling-machine"]["space-train-battery-charging-station"].se_allow_in_space = true
else
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
            -- count = 500,
            count = 5,
            ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1},
                           {"production-science-pack", 1}},
            -- time = 60,
            time = 1
        }
    }})
end
