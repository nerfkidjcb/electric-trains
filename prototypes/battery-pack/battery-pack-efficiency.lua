local item_sounds = require("__base__.prototypes.item_sounds")
local icon_path = "__electric-trains__/graphics/icons/"

data:extend
{
    {
        type = "item",
        name = "charged-efficiency-battery-pack",
        icon = icon_path .. "efficiency-battery/charged-efficiency-battery.png",
        icon_size = 64,
        pictures = {
            layers = {
                {
                    filename = icon_path .. "efficiency-battery/charged-efficiency-battery.png",
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
        fuel_value = "240MJ",
        fuel_acceleration_multiplier_quality_bonus = 0.25,
        fuel_top_speed_multiplier_quality_bonus = 0.25,
        burnt_result = "discharged-efficiency-battery-pack",
        subgroup = "battery-trains",
        order = "d-a[charged-battery-pack]",
        stack_size = 20,
        inventory_move_sound = item_sounds.electric_small_inventory_move,
        pick_sound = item_sounds.electric_small_inventory_pickup,
        drop_sound = item_sounds.electric_small_inventory_move
    },

    {
        type = "recipe",
        name = "charged-efficiency-battery-pack",
        localised_name = { "recipe-name.charged-efficiency-battery-pack" },
        category = "faster-electrical",
        hidden = false,
        hide_from_player_crafting = true,
        energy_required = 60,
        enabled = false,
        allow_as_intermediate = false,
        ingredients = {
            { type = "item", name = "discharged-efficiency-battery-pack", amount = 1 }
        },
        results = {
            { type = "item", name = "charged-efficiency-battery-pack", probability = 0.95, amount = 1 }
        },
        main_product = "charged-efficiency-battery-pack"
    },

    --------------------------------

    {
        type = "item",
        name = "discharged-efficiency-battery-pack",
        icon = icon_path .. "efficiency-battery/discharged-efficiency-battery.png",
        icon_size = 64,
        subgroup = "battery-trains",
        order = "d-b[discharged-battery-pack]",
        stack_size = 20,
        inventory_move_sound = item_sounds.electric_small_inventory_move,
        pick_sound = item_sounds.electric_small_inventory_pickup,
        drop_sound = item_sounds.electric_small_inventory_move
    },

    {
        type = "recipe",
        name = "discharged-efficiency-battery-pack",
        localised_name = { "recipe-name.discharged-efficiency-battery-pack" },
        category = "advanced-crafting",
        energy_required = 20,
        enabled = false,
        allow_as_intermediate = false,
        ingredients = {
            { type = "item", name = "steel-plate",                      amount = 2 },
            { type = "item", name = "battery",                          amount = 20 },
            { type = "item", name = "discharged-electric-battery-pack", amount = 1 },
            { type = "item", name = "efficiency-module-3",              amount = 1 }
        },
        results = { { type = "item", name = "discharged-efficiency-battery-pack", amount = 1 } },
    }
}

if settings.startup["train-battery-decay-enable-setting"].value == "true" then
    data:extend
    {
        {
            type = "item",
            name = "destroyed-efficiency-battery-pack",
            icon = icon_path .. "efficiency-battery/destroyed-efficiency-battery.png",
            icon_size = 64,
            pictures = {
                layers = {
                    {
                        filename = icon_path .. "efficiency-battery/destroyed-efficiency-battery.png",
                        size = 64,
                        scale = 0.5
                    }
                }
            },
            burnt_result = "discharged-efficiency-battery-pack",
            subgroup = "battery-trains",
            order = "d-c[destroyed-battery-pack]",
            stack_size = 20,
            inventory_move_sound = item_sounds.electric_small_inventory_move,
            pick_sound = item_sounds.electric_small_inventory_pickup,
            drop_sound = item_sounds.electric_small_inventory_move
        },

        {
            type = "recipe",
            name = "refurbish-efficiency-battery-pack",
            localised_name = { "recipe-name.refurbish-efficiency-battery-pack" },
            icon = icon_path .. "efficiency-battery/refurbishment-efficiency-battery.png",
            icon_size = 64,
            energy_required = 120,
            enabled = false,
            hide_from_player_crafting = true,
            category = "chemistry",
            ingredients = {
                { type = "item",  name = "destroyed-efficiency-battery-pack", amount = 1 },
                { type = "item",  name = "battery",                           amount = 10 },
                { type = "fluid", name = "sulfuric-acid",                     amount = 200 }
            },
            allow_as_intermediate = false,
            results = { { type = "item", name = "discharged-efficiency-battery-pack", amount = 1 } }
        }
    }

    local recipe = data.raw["recipe"]["charged-efficiency-battery-pack"]
    local destroyed = { type = "item", name = "destroyed-efficiency-battery-pack", probability = 0.05, amount = 1 }
    table.insert(recipe.results, destroyed)
end
