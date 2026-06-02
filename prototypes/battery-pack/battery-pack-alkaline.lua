local item_sounds = require("__base__.prototypes.item_sounds")
local icon_path = "__electric-trains__/graphics/icons/"

data:extend
{
    {
        type = "item",
        name = "alkaline-electric-battery-pack",
        icon = icon_path .. "alkaline-battery.png",
        icon_size = 64,
        pictures = {
            layers = {
                {
                    filename = icon_path .. "electric-battery/charged-battery.png",
                    size = 64,
                    scale = 0.5
                },
                {
                    draw_as_light = false,
                    flags = { "light" },
                    filename = icon_path .. "battery_light.png",
                    size = 64,
                    scale = 0.5
                }
            }
        },
        fuel_category = "electrical",
        fuel_value = "120MJ",
        fuel_acceleration_multiplier_quality_bonus = 0.25,
        fuel_top_speed_multiplier_quality_bonus = 0.25,
        burnt_result = "",
        subgroup = "battery-trains",
        order = "a-a[charged-battery-pack]",
        stack_size = 20,
        inventory_move_sound = item_sounds.electric_small_inventory_move,
        pick_sound = item_sounds.electric_small_inventory_pickup,
        drop_sound = item_sounds.electric_small_inventory_move,
        fuel_acceleration_multiplier = 0.65,
        fuel_top_speed_multiplier = 0.8
    },

    {
        type = "recipe",
        name = "alkaline-electric-battery-pack",
        localised_name = { "recipe-name.alkaline-electric-battery-pack" },
        category = "advanced-crafting",
        energy_required = 10,
        enabled = false,
        allow_as_intermediate = false,
        ingredients = {
            { type = "item", name = "steel-plate", amount = 2 },
            { type = "item", name = "battery",     amount = 5 }
        },
        results = { { type = "item", name = "alkaline-electric-battery-pack", amount = 1 } },
    }
}
