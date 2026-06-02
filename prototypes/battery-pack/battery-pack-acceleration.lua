local item_sounds = require("__base__.prototypes.item_sounds")
local icon_path = "__electric-trains__/graphics/icons/"

data:extend
{
    {
        type = "item",
        name = "charged-acceleration-battery-pack",
        icon = icon_path .. "acceleration-battery/charged-acceleration-battery.png",
        icon_size = 64,
        pictures = {
            layers = {
                {
                    filename = icon_path .. "acceleration-battery/charged-acceleration-battery.png",
                    size = 64,
                    scale = 0.5
                },
                {
                    draw_as_light = true,
                    flags = { "light" },
                    filename = icon_path .. "battery_light.png",
                    size = 64,
                    scale = 0.5
                }
            }
        },
        fuel_category = "electrical",
        fuel_value = "32MJ",
        fuel_top_speed_multiplier = 0.8,
        fuel_acceleration_multiplier = 1.5,
        fuel_acceleration_multiplier_quality_bonus = 0.25,
        fuel_top_speed_multiplier_quality_bonus = 0.25,
        burnt_result = "discharged-acceleration-battery-pack",
        subgroup = "battery-trains",
        order = "c-a[charged-battery-pack]",
        stack_size = 20,
        inventory_move_sound = item_sounds.electric_small_inventory_move,
        pick_sound = item_sounds.electric_small_inventory_pickup,
        drop_sound = item_sounds.electric_small_inventory_move
    },

    {
        type = "recipe",
        name = "charged-acceleration-battery-pack",
        localised_name = { "recipe-name.charged-acceleration-battery-pack" },
        category = "faster-electrical",
        allow_as_intermediate = false,
        energy_required = 60,
        enabled = false,
        hidden = false,
        hide_from_player_crafting = true,
        ingredients = {
            { type = "item", name = "discharged-acceleration-battery-pack", amount = 1 }
        },
        results = {
            { type = "item", name = "charged-acceleration-battery-pack", probability = 0.95, amount = 1 }
        },
        main_product = "charged-acceleration-battery-pack"
    },

    --------------------------------

    {
        type = "item",
        name = "discharged-acceleration-battery-pack",
        icon = icon_path .. "acceleration-battery/discharged-acceleration-battery.png",
        icon_size = 64,
        subgroup = "battery-trains",
        order = "c-b[discharged-battery-pack]",
        stack_size = 20,
        inventory_move_sound = item_sounds.electric_small_inventory_move,
        pick_sound = item_sounds.electric_small_inventory_pickup,
        drop_sound = item_sounds.electric_small_inventory_move
    },

    {
        type = "recipe",
        name = "discharged-acceleration-battery-pack",
        localised_name = { "recipe-name.discharged-acceleration-battery-pack" },
        category = "advanced-crafting",
        energy_required = 20,
        enabled = false,
        allow_as_intermediate = false,
        ingredients = {
            { type = "item", name = "steel-plate",                      amount = 2 },
            { type = "item", name = "battery",                          amount = 20 },
            { type = "item", name = "discharged-electric-battery-pack", amount = 1 },
            { type = "item", name = "productivity-module-3",            amount = 1 }
        },
        results = { { type = "item", name = "discharged-acceleration-battery-pack", amount = 1 } },
    }
}

if settings.startup["train-battery-decay-enable-setting"].value == "true" then
    data:extend
    {
        {
            type = "item",
            name = "destroyed-acceleration-battery-pack",
            icon = icon_path .. "acceleration-battery/destroyed-acceleration-battery.png",
            icon_size = 64,
            pictures = {
                layers = {
                    {
                        filename = icon_path .. "acceleration-battery/destroyed-acceleration-battery.png",
                        size = 64,
                        scale = 0.5
                    }
                }
            },
            burnt_result = "discharged-acceleration-battery-pack",
            subgroup = "battery-trains",
            order = "c-c[destroyed-battery-pack]",
            stack_size = 20,
            inventory_move_sound = item_sounds.electric_small_inventory_move,
            pick_sound = item_sounds.electric_small_inventory_pickup,
            drop_sound = item_sounds.electric_small_inventory_move
        },

        {
            type = "recipe",
            name = "refurbish-acceleration-battery-pack",
            localised_name = { "recipe-name.refurbish-acceleration-battery-pack" },
            icon = icon_path .. "acceleration-battery/refurbishment-acceleration-battery.png",
            icon_size = 64,
            energy_required = 120,
            enabled = false,
            hide_from_player_crafting = true,
            category = "chemistry",
            ingredients = {
                { type = "item",  name = "destroyed-acceleration-battery-pack", amount = 1 },
                { type = "item",  name = "battery",                             amount = 10 },
                { type = "fluid", name = "sulfuric-acid",                       amount = 200 }
            },
            allow_as_intermediate = false,
            results = { { type = "item", name = "discharged-acceleration-battery-pack", amount = 1 } }
        }
    }

    local recipe = data.raw["recipe"]["charged-acceleration-battery-pack"]
    local destroyed = { type = "item", name = "destroyed-acceleration-battery-pack", probability = 0.05, amount = 1 }
    table.insert(recipe.results, destroyed)
end
