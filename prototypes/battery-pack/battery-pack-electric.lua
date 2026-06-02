local item_sounds = require("__base__.prototypes.item_sounds")
local icon_path = "__electric-trains__/graphics/icons/"

data:extend
{
    {
        type = "item",
        name = "charged-electric-battery-pack",
        icon = icon_path .. "electric-battery/charged-battery.png",
        icon_size = 64,
        pictures = {
            layers = {
                {
                    filename = icon_path .. "electric-battery/charged-battery.png",
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
        fuel_value = "40MJ",
        fuel_acceleration_multiplier_quality_bonus = 0.25,
        fuel_top_speed_multiplier_quality_bonus = 0.25,
        burnt_result = "discharged-electric-battery-pack",
        subgroup = "battery-trains",
        order = "b-a[charged-battery-pack]",
        stack_size = 20,
        inventory_move_sound = item_sounds.electric_small_inventory_move,
        pick_sound = item_sounds.electric_small_inventory_pickup,
        drop_sound = item_sounds.electric_small_inventory_move
    },

    {
        type = "recipe",
        name = "charged-electric-battery-pack",
        localised_name = { "recipe-name.charged-electric-battery-pack" },
        category = "electrical",
        hide_from_player_crafting = true,
        energy_required = 60,
        enabled = false,
        allow_as_intermediate = false,
        ingredients = {
            { type = "item", name = "discharged-electric-battery-pack", amount = 1 }
        },
        results = {
            { type = "item", name = "charged-electric-battery-pack", probability = 0.95, amount = 1 }
        },
        main_product = "charged-electric-battery-pack"
    },

    {
        type = "recipe",
        name = "faster-recharge-electric-battery-pack",
        localised_name = { "recipe-name.faster-recharge-electric-battery-pack" },
        icon = icon_path .. "electric-battery/faster-recharge-battery.png",
        icon_size = 64,
        category = "faster-electrical",
        hide_from_player_crafting = true,
        energy_required = 20,
        enabled = false,
        allow_as_intermediate = false,
        ingredients = { { type = "item", name = "discharged-electric-battery-pack", amount = 1 } },
        results = {
            { type = "item", name = "charged-electric-battery-pack", probability = 0.75, amount = 1 }
        },
        main_product = "charged-electric-battery-pack"
    },

    --------------------------------

    {
        type = "item",
        name = "discharged-electric-battery-pack",
        icon = icon_path .. "electric-battery/discharged-battery.png",
        icon_size = 64,
        subgroup = "battery-trains",
        order = "b-b[discharged-battery-pack]",
        stack_size = 60,
        inventory_move_sound = item_sounds.electric_small_inventory_move,
        pick_sound = item_sounds.electric_small_inventory_pickup,
        drop_sound = item_sounds.electric_small_inventory_move
    },

    {
        type = "recipe",
        name = "discharged-electric-battery-pack",
        localised_name = { "recipe-name.discharged-electric-battery-pack" },
        category = "advanced-crafting",
        energy_required = 10,
        enabled = false,
        allow_as_intermediate = false,
        ingredients = {
            { type = "item", name = "steel-plate", amount = 2 },
            { type = "item", name = "battery",     amount = 20 }
        },
        results = { { type = "item", name = "discharged-electric-battery-pack", amount = 1 } },
    },

}

if settings.startup["train-battery-decay-enable-setting"].value == "true" then
    data:extend
    {
        {
            type = "item",
            name = "destroyed-electric-battery-pack",
            icon = icon_path .. "electric-battery/destroyed-battery.png",
            icon_size = 64,
            pictures = {
                layers = {
                    {
                        size = 64,
                        filename = icon_path .. "electric-battery/destroyed-battery.png",
                        scale = 0.5
                    }
                }
            },
            burnt_result = "discharged-electric-battery-pack",
            subgroup = "battery-trains",
            order = "b-c[destroyed-battery-pack]",
            stack_size = 20,
            inventory_move_sound = item_sounds.electric_small_inventory_move,
            pick_sound = item_sounds.electric_small_inventory_pickup,
            drop_sound = item_sounds.electric_small_inventory_move
        },

        {
            type = "recipe",
            name = "refurbish-electric-battery-pack",
            localised_name = { "recipe-name.refurbish-electric-battery-pack" },
            icon = icon_path .. "electric-battery/refurbishment-battery.png",
            icon_size = 64,
            energy_required = 60,
            enabled = false,
            hide_from_player_crafting = true,
            category = "chemistry",
            ingredients = {
                { type = "item",  name = "destroyed-electric-battery-pack", amount = 1 },
                { type = "item",  name = "battery",                         amount = 5 },
                { type = "fluid", name = "sulfuric-acid",                   amount = 20 }
            },
            allow_as_intermediate = false,
            results = { { type = "item", name = "discharged-electric-battery-pack", amount = 1 } }
        }
    }

    local recipe = data.raw["recipe"]["charged-electric-battery-pack"]
    local destroyed = { type = "item", name = "destroyed-electric-battery-pack", probability = 0.05, amount = 1 }
    table.insert(recipe.results, destroyed)

    local faster_recipe = data.raw["recipe"]["faster-recharge-electric-battery-pack"]
    local faster_destroyed = { type = "item", name = "destroyed-electric-battery-pack", probability = 0.25, amount = 1 }
    table.insert(faster_recipe.results, faster_destroyed)
end
