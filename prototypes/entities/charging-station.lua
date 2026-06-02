local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

local icon_path = "__electric-trains__/graphics/icons/"
local sound_path = "__electric-trains__/sound/"
local station_path = "__electric-trains__/graphics/entity/electric-train-charging-station/"

local function space_accumulator_picture(tint, repeat_count)
    return {
        layers = {
            {
                filename = station_path .. "space_charging_station.png",
                priority = "high",
                width = 256,
                height = 256,
                repeat_count = repeat_count,
                shift = util.by_pixel(0, -16),
                tint = tint,
                animation_speed = 0.5,
                scale = 0.5
            },
            {
                filename = station_path .. "space_charging_station_shadow.png",
                priority = "high",
                width = 285,
                height = 91,
                repeat_count = repeat_count,
                shift = util.by_pixel(32, 11),
                draw_as_shadow = true,
                scale = 0.5
            }
        }
    }
end

local function experimental_space_accumulator_picture(tint, repeat_count)
    return {
        layers = {
            {
                filename = station_path .. "experimental_space_charging_station.png",
                priority = "high",
                width = 256,
                height = 256,
                repeat_count = repeat_count,
                shift = util.by_pixel(0, -16),
                tint = tint,
                animation_speed = 1.5,
                scale = 0.5
            },
            {
                filename = station_path .. "space_charging_station_shadow.png",
                priority = "high",
                width = 285,
                height = 91,
                repeat_count = repeat_count,
                shift = util.by_pixel(32, 11),
                draw_as_shadow = true,
                scale = 0.5
            }
        }
    }
end

local function space_accumulator_charge()
    return {
        layers = {
            space_accumulator_picture({ r = 1, g = 1, b = 1, a = 1 }, 30),
            {
                filenames = { station_path .. "space_charging_station_lightning.png" },
                priority = "high",
                width = 128,
                height = 192,
                line_length = 6,
                lines_per_file = 5,
                frame_count = 30,
                draw_as_glow = true,
                shift = util.by_pixel(0, -16),
                scale = 0.5,
                animation_speed = 1
            }
        }
    }
end

local function experimental_space_accumulator_charge()
    return {
        layers = {
            experimental_space_accumulator_picture({ r = 1, g = 1, b = 1, a = 1 }, 30),
            {
                filenames = { station_path .. "space_charging_station_lightning.png" },
                priority = "high",
                width = 128,
                height = 192,
                line_length = 6,
                lines_per_file = 5,
                frame_count = 30,
                draw_as_glow = true,
                shift = util.by_pixel(0, -16),
                scale = 0.5,
                animation_speed = 3
            }
        }
    }
end

-------------------------

data:extend
{
    {
        type = "item",
        name = "electric-train-battery-charging-station",
        icon = icon_path .. "electric-train-charging-station.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "h[train-system]",
        place_result = "electric-train-battery-charging-station",
        stack_size = 10,
        inventory_move_sound = item_sounds.electric_large_inventory_move,
        pick_sound = item_sounds.electric_large_inventory_pickup,
        drop_sound = item_sounds.electric_large_inventory_move
    },

    {
        type = "recipe",
        name = "electric-train-battery-charging-station",
        energy_required = 60,
        enabled = false,
        ingredients = {
            { type = "item", name = "steel-plate",     amount = 40 },
            { type = "item", name = "processing-unit", amount = 10 },
            { type = "item", name = "copper-cable",    amount = 50 }
        },
        results = { { type = "item", name = "electric-train-battery-charging-station", amount = 1 } }
    },

    {
        type = "assembling-machine",
        name = "electric-train-battery-charging-station",
        icon = icon_path .. "electric-train-charging-station.png",
        icon_size = 64,
        flags = { "placeable-neutral", "player-creation" },
        minable = {
            mining_time = 0.1,
            result = "electric-train-battery-charging-station"
        },
        max_health = 150,
        resistances = {
            { type = "fire", percent = 70 }
        },
        corpse = "accumulator-remnants",
        dying_explosion = "accumulator-explosion",
        collision_box = { { -0.9, -0.9 }, { 0.9, 0.9 } },
        selection_box = { { -1.0, -1.0 }, { 1.0, 1.0 } },
        damaged_trigger_effect = hit_effects.entity(),
        drawing_box = { { -1.0, -1.5 }, { 1.0, 1.0 } },
        energy_source = {
            type = "electric",
            buffer_capacity = "30MJ",
            usage_priority = "primary-input",
            input_flow_limit = "10MW",
            output_flow_limit = "0kW"
        },
        fast_replaceable_group = "assembling-machine",
        graphics_set = {
            always_draw_idle_animation = true,
            idle_animation = space_accumulator_picture(),
            working_visualisations = {
                {
                    effect = "flicker",
                    fadeout = true,
                    light = {
                        intensity = 0.2,
                        size = 9.9,
                        shift = { 0.0, 0.0 },
                        color = { r = 0.25, g = 0.25, b = 0.8 }
                    }
                },
                {
                    effect = "flicker",
                    fadeout = true,
                    draw_as_light = true,
                    animation = space_accumulator_charge()
                }
            }
        },

        water_reflection = accumulator_reflection(),

        energy_usage = "1.7MW",
        crafting_categories = { "electrical" },
        crafting_speed = 1,
        show_recipe_icon = false,

        vehicle_impact_sound = sounds.generic_impact,
        open_sound = sounds.machine_open,
        close_sound = sounds.machine_close,
        working_sound = {
            sound = {
                filename = sound_path .. "space-charging-sound.ogg",
                volume = 0.35
            },
            idle_sound = {
                filename = "__base__/sound/accumulator-idle.ogg",
                volume = 0.3
            },
            -- persistent = true,
            max_sounds_per_type = 3,
            audible_distance_modifier = 0.5,
            fade_in_ticks = 4,
            fade_out_ticks = 20
        },

        -- Circuit things
        draw_circuit_wires = true,
        enable_logistic_control_behavior = true,
        circuit_wire_max_distance = 7.5,

        -- Modules and effects
        module_slots = 2,
        allowed_effects = { "speed", "consumption", "pollution", "quality" },
        effect_receiver = {
            uses_module_effects = true,
            uses_beacon_effects = true,
            uses_surface_effects = true
        }
    },

    --------------------------------------------
    --------------------------------------------
    --------------------------------------------

    {
        type = "item",
        name = "experimental-electric-train-battery-charging-station",
        icon = icon_path .. "experimental-electric-train-charging-station.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "i[train-system]",
        place_result = "experimental-electric-train-battery-charging-station",
        stack_size = 10,
        inventory_move_sound = item_sounds.electric_large_inventory_move,
        pick_sound = item_sounds.electric_large_inventory_pickup,
        drop_sound = item_sounds.electric_large_inventory_move
    },

    {
        type = "recipe",
        name = "experimental-electric-train-battery-charging-station",
        energy_required = 120,
        enabled = false,
        ingredients = {
            { type = "item", name = "steel-plate",                             amount = 40 },
            { type = "item", name = "processing-unit",                         amount = 50 },
            { type = "item", name = "copper-cable",                            amount = 200 },
            { type = "item", name = "electric-train-battery-charging-station", amount = 1 }
        },
        results = { { type = "item", name = "experimental-electric-train-battery-charging-station", amount = 1 } }
    },

    {
        type = "assembling-machine",
        name = "experimental-electric-train-battery-charging-station",
        icon = icon_path .. "experimental-electric-train-charging-station.png",
        icon_size = 64,
        flags = { "placeable-neutral", "player-creation" },
        minable = {
            mining_time = 1,
            result = "experimental-electric-train-battery-charging-station"
        },
        max_health = 150,
        resistances = {
            {
                type = "fire",
                percent = 70
            }
        },
        corpse = "accumulator-remnants",
        dying_explosion = "accumulator-explosion",
        collision_box = { { -0.9, -0.9 }, { 0.9, 0.9 } },
        selection_box = { { -1.0, -1.0 }, { 1.0, 1.0 } },
        damaged_trigger_effect = hit_effects.entity(),
        drawing_box = { { -1.0, -1.5 }, { 1.0, 1.0 } },
        energy_source = {
            type = "electric",
            buffer_capacity = "150MJ",
            usage_priority = "primary-input",
            input_flow_limit = "100MW",
            output_flow_limit = "0kW"
        },
        fast_replaceable_group = "assembling-machine",
        graphics_set = {
            idle_animation = experimental_space_accumulator_picture(),
            always_draw_idle_animation = true,
            working_visualisations = {
                {
                    effect = "flicker",
                    fadeout = true,
                    light = {
                        intensity = 0.2,
                        size = 9.9,
                        shift = { 0.0, 0.0 },
                        color = { r = 0.25, g = 0.25, b = 0.8 }
                    }
                },
                {
                    effect = "flicker",
                    fadeout = true,
                    draw_as_light = true,
                    animation = experimental_space_accumulator_charge()
                }
            }
        },

        water_reflection = accumulator_reflection(),

        energy_usage = "10MW",
        crafting_categories = { "electrical", "faster-electrical" },
        crafting_speed = 1,
        show_recipe_icon = false,

        vehicle_impact_sound = sounds.generic_impact,
        open_sound = sounds.machine_open,
        close_sound = sounds.machine_close,
        working_sound = {
            sound = {
                filename = sound_path .. "space-charging-sound.ogg",
                volume = 0.35
            },
            idle_sound = {
                filename = "__base__/sound/accumulator-idle.ogg",
                volume = 0.3
            },
            -- persistent = true,
            max_sounds_per_type = 3,
            audible_distance_modifier = 0.5,
            fade_in_ticks = 4,
            fade_out_ticks = 20
        },

        -- Circuit things
        draw_circuit_wires = true,
        enable_logistic_control_behavior = true,
        circuit_wire_max_distance = 7.5,

        -- Modules and effects
        module_slots = 4,
        allowed_effects = { "speed", "consumption", "pollution", "quality" },
        effect_receiver = {
            uses_module_effects = true,
            uses_beacon_effects = true,
            uses_surface_effects = true
        }
    }
}
