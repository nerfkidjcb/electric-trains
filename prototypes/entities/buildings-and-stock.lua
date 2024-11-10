local electric_train_front_light_color = {
    r = 0.25,
    g = 0.25,
    b = 0.8,
    a = 0.25
}
local electric_train_back_light_color = {
    r = 0.8,
    g = 0.25,
    b = 0.8,
    a = 0.25
}
local space
train_scale = 0.425
fluid_wagon_scale = 0.375
cargo_wagon_scale = 0.4
wagon_vertical_shift = -0.8
local connection_length = 3
local train_speed = 2.4
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

function space_accumulator_picture(tint, repeat_count)
    return {
        layers = {{
            filename = "__electric-trains__/graphics/entity/electric-train-charging-station/hr_space_charging_station.png",
            priority = "high",
            width = 128,
            height = 192,
            repeat_count = repeat_count,
            shift = util.by_pixel(0, -16),
            tint = tint,
            animation_speed = 0.5,
            scale = 0.5
        }, {
            filename = "__electric-trains__/graphics/entity/electric-train-charging-station/hr_space_charging_station_shadow.png",
            priority = "high",
            width = 285,
            height = 91,
            repeat_count = repeat_count,
            shift = util.by_pixel(32, 11),
            draw_as_shadow = true,
            scale = 0.5
        }}
    }
end

function experimental_space_accumulator_picture(tint, repeat_count)
    return {
        layers = {{
            filename = "__electric-trains__/graphics/entity/electric-train-charging-station/hr_experimental_space_charging_station.png",
            priority = "high",
            width = 128,
            height = 192,
            repeat_count = repeat_count,
            shift = util.by_pixel(0, -16),
            tint = tint,
            animation_speed = 1.5,
            scale = 0.5
        }, {
            filename = "__electric-trains__/graphics/entity/electric-train-charging-station/hr_space_charging_station_shadow.png",
            priority = "high",
            width = 285,
            height = 91,
            repeat_count = repeat_count,
            shift = util.by_pixel(32, 11),
            draw_as_shadow = true,
            scale = 0.5
        }}
    }
end

function space_accumulator_charge()
    return {
        layers = {space_accumulator_picture({
            r = 1,
            g = 1,
            b = 1,
            a = 1
        }, 30), {
            filenames = {"__electric-trains__/graphics/entity/electric-train-charging-station/hr_space_charging_station_lightning.png"},
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
        }}
    }
end

function experimental_space_accumulator_charge()
    return {
        layers = {experimental_space_accumulator_picture({
            r = 1,
            g = 1,
            b = 1,
            a = 1
        }, 30), {

            filenames = {"__electric-trains__/graphics/entity/electric-train-charging-station/hr_space_charging_station_lightning.png"},
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

        }}
    }
end

local rolling_stock_back_light = function()
    return {{
        minimum_darkness = 0.3,
        color = {1, 0.1, 0.05, 0},
        shift = {-0.6, 3.5},
        size = 2,
        intensity = 0.6,
        add_perspective = true
    }, {
        minimum_darkness = 0.3,
        color = {1, 0.1, 0.05, 0},
        shift = {0.6, 3.5},
        size = 2,
        intensity = 0.6,
        add_perspective = true
    }}
end

local rolling_stock_stand_by_light = function()
    return {{
        minimum_darkness = 0.3,
        color = {0.05, 0.2, 1, 0},
        shift = {-0.6, -3.5},
        size = 2,
        intensity = 0.5,
        add_perspective = true
    }, {
        minimum_darkness = 0.3,
        color = {0.05, 0.2, 1, 0},
        shift = {0.6, -3.5},
        size = 2,
        intensity = 0.5,
        add_perspective = true
    }}
end

local locomotive_reflection = function()
    return {
        pictures = {
            filename = "__base__/graphics/entity/locomotive/reflection/locomotive-reflection.png",
            priority = "extra-high",
            width = 20,
            height = 52,
            shift = util.by_pixel(0, 40),
            variation_count = 1,
            scale = 5
        },
        rotate = true,
        orientation_to_variation = false
    }
end

space_train_wheels = {
    priority = "very-low",
    width = 250,
    height = 150,
    direction_count = 256,
    filenames = {"__electric-trains__/graphics/entity/vehicles/space-trains/maglev_cushions_1.png",
                 "__electric-trains__/graphics/entity/vehicles/space-trains/maglev_cushions_2.png"},
    line_length = 8,
    lines_per_file = 16,
    scale = 1.4 / 2,
    rotated = {
        width = 500,
        height = 300,
        direction_count = 256,
        filenames = {"__electric-trains__/graphics/entity/vehicles/space-trains/hr_maglev_cushions_1.png",
                     "__electric-trains__/graphics/entity/vehicles/space-trains/hr_maglev_cushions_2.png",
                     "__electric-trains__/graphics/entity/vehicles/space-trains/hr_maglev_cushions_3.png",
                     "__electric-trains__/graphics/entity/vehicles/space-trains/hr_maglev_cushions_4.png",
                     "__electric-trains__/graphics/entity/vehicles/space-trains/hr_maglev_cushions_5.png",
                     "__electric-trains__/graphics/entity/vehicles/space-trains/hr_maglev_cushions_6.png",
                     "__electric-trains__/graphics/entity/vehicles/space-trains/hr_maglev_cushions_7.png",
                     "__electric-trains__/graphics/entity/vehicles/space-trains/hr_maglev_cushions_8.png"},
        line_length = 4,
        lines_per_file = 8,
        shift = {0, 0.1}, -- original shifting from spritesheeter (likely needs doubling or halving)
        scale = 0.775 / 2
    }
}

data:extend({ -- Battery charging interface
{
    type = "assembling-machine",
    name = "electric-train-battery-charging-station",
    icon = "__electric-trains__/graphics/icons/electric-train-charging-station.png",
    icon_size = 128,
    flags = {"placeable-neutral", "player-creation"},
    minable = {
        mining_time = 0.1,
        result = "electric-train-battery-charging-station"
    },
    max_health = 150,
    resistances = {{
        type = "fire",
        percent = 70
    }},
    corpse = "accumulator-remnants",
    dying_explosion = "accumulator-explosion",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box = {{-1, -1.5}, {1, 1}},
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
        working_visualisations = {{
            effect = "flicker",
            fadeout = true,
            light = {
                intensity = 0.2,
                size = 9.9,
                shift = {0.0, 0.0},
                color = {
                    r = 0.25,
                    g = 0.25,
                    b = 0.8
                }
            }
        }, {
            effect = "flicker",
            fadeout = true,
            draw_as_light = true,
            animation = space_accumulator_charge()
        }}
    },

    water_reflection = accumulator_reflection(),

    energy_usage = "1.7MW",
    crafting_categories = {"electrical"},
    crafting_speed = 1,
    show_recipe_icon = false,

    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = {
        sound = {
            filename = "__electric-trains__/sound/space-charging-sound.ogg",
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
    allowed_effects = {"speed", "consumption", "pollution", "quality"},
    effect_receiver = {
        uses_module_effects = true,
        uses_beacon_effects = true,
        uses_surface_effects = true
    }
}, -- Experimental Battery Charging Interface
{
    type = "assembling-machine",
    name = "experimental-electric-train-battery-charging-station",
    icon = "__electric-trains__/graphics/icons/experimental-electric-train-charging-station.png",
    icon_size = 128,
    flags = {"placeable-neutral", "player-creation"},
    minable = {
        mining_time = 1,
        result = "experimental-electric-train-battery-charging-station"
    },
    max_health = 150,
    resistances = {{
        type = "fire",
        percent = 70
    }},
    corpse = "accumulator-remnants",
    dying_explosion = "accumulator-explosion",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box = {{-1, -1.5}, {1, 1}},
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
        working_visualisations = {{
            effect = "flicker",
            fadeout = true,
            light = {
                intensity = 0.2,
                size = 9.9,
                shift = {0.0, 0.0},
                color = {
                    r = 0.25,
                    g = 0.25,
                    b = 0.8
                }
            }
        }, {
            effect = "flicker",
            fadeout = true,
            draw_as_light = true,
            animation = experimental_space_accumulator_charge()
        }}
    },

    water_reflection = accumulator_reflection(),

    energy_usage = "10MW",
    crafting_categories = {"faster-electrical"},
    crafting_speed = 1,
    show_recipe_icon = false,

    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = {
        sound = {
            filename = "__electric-trains__/sound/space-charging-sound.ogg",
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
    allowed_effects = {"speed", "consumption", "pollution", "quality"},
    effect_receiver = {
        uses_module_effects = true,
        uses_beacon_effects = true,
        uses_surface_effects = true
    }
}, -- Actual Trains now
{
    type = "locomotive",
    name = "electric-locomotive",
    icon = "__electric-trains__/graphics/icons/electric-locomotive.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {
        mining_time = 1,
        result = "electric-locomotive"
    },
    mined_sound = sounds.deconstruct_large(0.8),
    max_health = 1500,
    deliver_category = "vehicle",
    corpse = "locomotive-remnants",
    dying_explosion = "locomotive-explosion",
    collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
    selection_box = {{-1, -3}, {1, 3}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 1,
    alert_icon_shift = util.by_pixel(0, -24),
    weight = 4000,
    allow_remote_driving = true,
    max_speed = train_speed,
    max_power = "4MW",
    reversing_power_modifier = 1.0,
    braking_force = 40,
    friction_force = 0.50,
    vertical_selection_shift = -0.5,
    air_resistance = 0.0025, -- this is a percentage of current speed that will be subtracted
    connection_distance = connection_length,
    joint_distance = 4,
    energy_per_hit_point = 5,
    icons_positioning = {{
        inventory_index = defines.inventory.fuel,
        shift = {0, 0.3},
        max_icons_per_row = 3
    }},
    resistances = {{
        type = "fire",
        decrease = 20,
        percent = 75
    }, {
        type = "physical",
        decrease = 15,
        percent = 30
    }, {
        type = "impact",
        decrease = 50,
        percent = 75
    }, {
        type = "explosion",
        decrease = 15,
        percent = 30
    }, {
        type = "acid",
        decrease = 5,
        percent = 25
    }},
    energy_source = {
        type = "burner",
        fuel_categories = {"electrical"},
        usage_priority = "primary-output",
        effectivity = 0.95,
        fuel_inventory_size = 3,
        burnt_inventory_size = 3
    },
    front_light = {{
        type = "oriented",
        minimum_darkness = 0.3,
        picture = {
            filename = "__core__/graphics/light-cone.png",
            priority = "extra-high",
            flags = {"light"},
            scale = 2,
            width = 200,
            height = 200
        },
        shift = {-0.6, -16},
        size = 2,
        intensity = 0.8,
        color = electric_train_front_light_color
    }, {
        type = "oriented",
        minimum_darkness = 0.3,
        picture = {
            filename = "__core__/graphics/light-cone.png",
            priority = "extra-high",
            flags = {"light"},
            scale = 2,
            width = 200,
            height = 200
        },
        shift = {0.6, -16},
        size = 2,
        intensity = 0.8,
        color = electric_train_front_light_color
    }},
    back_light = rolling_stock_back_light(),
    stand_by_light = rolling_stock_stand_by_light(),
    color = {
        r = 0.92,
        g = 0.07,
        b = 0,
        a = 0.5
    },
    default_copy_color_from_train_stop = true,
    pictures = {
        rotated = {
            layers = {{
                priority = "very-low",
                dice = 4,
                width = 1000,
                height = 600,
                direction_count = 256,
                allow_low_quality_rotation = true,
                filenames = {"__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_1.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_2.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_3.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_4.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_5.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_6.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_7.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_8.png"},
                line_length = 4,
                lines_per_file = 8,
                shift = {0, wagon_vertical_shift},
                scale = train_scale
            }, {
                priority = "very-low",
                flags = {"mask"},
                dice = 4,
                width = 1000,
                height = 600,
                tint_as_overlay = true,
                direction_count = 256,
                filenames = {"__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_mask_1.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_mask_2.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_mask_3.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_mask_4.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_mask_5.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_mask_6.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_mask_7.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_mask_8.png"},
                line_length = 4,
                lines_per_file = 8,
                shift = {0, wagon_vertical_shift},
                apply_runtime_tint = true,
                scale = train_scale
            }, {
                priority = "very-low",
                flags = {"shadow"},
                width = 1000,
                height = 600,
                tint_as_overlay = true,
                direction_count = 256,
                draw_as_shadow = true,
                filenames = {"__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_shadows_1.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_shadows_2.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_shadows_3.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_shadows_4.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_shadows_5.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_shadows_6.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_shadows_7.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_shadows_8.png"},
                line_length = 4,
                lines_per_file = 8,
                shift = {0, wagon_vertical_shift},
                scale = train_scale
            }}
        }
    },
    front_light_pictures = {
        rotated = {
            layers = {{
                priority = "very-low",
                blend_mode = "additive",
                draw_as_light = true,
                tint = {
                    r = 1.0,
                    g = 1.0,
                    b = 1.0,
                    a = 0.25
                },
                width = 1000,
                height = 600,
                direction_count = 256,
                allow_low_quality_rotation = true,
                filenames = {"__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_lights_front_1.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_lights_front_2.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_lights_front_3.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_lights_front_4.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_lights_front_5.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_lights_front_6.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_lights_front_7.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_locomotive_lights_front_8.png"},
                line_length = 4,
                lines_per_file = 8,
                shift = {0, wagon_vertical_shift},
                scale = train_scale
            }}
        }
    },
    minimap_representation = {
        filename = "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-minimap-representation.png",
        flags = {"icon"},
        size = {20, 40},
        scale = 0.5
    },
    selected_minimap_representation = {
        filename = "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-selected-minimap-representation.png",
        flags = {"icon"},
        size = {20, 40},
        scale = 0.5
    },
    wheels = space_train_wheels,
    stop_trigger = { -- left side
    {
        type = "create-trivial-smoke",
        repeat_count = 125,
        smoke_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the left
        speed = {-0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
    }, -- right side
    {
        type = "create-trivial-smoke",
        repeat_count = 125,
        smoke_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the right
        speed = {0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        volume = 0.4,
        modifiers = {volume_multiplier("main-menu", 1.8), volume_multiplier("driving", 0.9),
                     volume_multiplier("tips-and-tricks", 0.8)},
        offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
    }, {
        type = "play-sound",
        sound = sounds.train_brakes
    }},
    -- drive_over_tie_trigger = drive_over_tie(),
    -- tie_distance = 50,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
        sound = {
            filename = "__electric-trains__/sound/space-train-engine.ogg",
            volume = 0.4,
            modifiers = {volume_multiplier("main-menu", 1.8), volume_multiplier("driving", 0.9),
                         volume_multiplier("tips-and-tricks", 0.8)}
        },
        match_speed_to_activity = true,
        max_sounds_per_type = 2
    },
    open_sound = {
        filename = "__base__/sound/train-door-open.ogg",
        volume = 0.5
    },
    close_sound = {
        filename = "__base__/sound/train-door-close.ogg",
        volume = 0.4
    },
    sound_minimum_speed = 0.5,
    water_reflection = locomotive_reflection()
}, {
    type = "locomotive",
    name = "electric-locomotive-wagon",
    icon = "__electric-trains__/graphics/icons/electric-locomotive-wagon.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {
        mining_time = 1,
        result = "electric-locomotive-wagon"
    },
    mined_sound = sounds.deconstruct_large(0.8),
    max_health = 1500,
    deliver_category = "vehicle",
    corpse = "cargo-wagon-remnants",
    dying_explosion = "locomotive-explosion",
    collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
    selection_box = {{-1, -3}, {1, 3}},
    drawing_box = {{-1, -4}, {1, 3}},
    alert_icon_shift = util.by_pixel(0, -24),
    damaged_trigger_effect = hit_effects.entity(),
    allow_remote_driving = true,
    icon_draw_specification = {
        scale = 1.25,
        shift = {0, -1}
    },
    weight = 4000,
    max_speed = train_speed,
    max_power = "4MW",
    reversing_power_modifier = 1.0,
    braking_force = 40,
    friction_force = 0.50,
    vertical_selection_shift = -0.5,
    air_resistance = 0.0025, -- this is a percentage of current speed that will be subtracted
    connection_distance = connection_length,
    joint_distance = 4,
    energy_per_hit_point = 5,
    resistances = {{
        type = "fire",
        decrease = 20,
        percent = 75
    }, {
        type = "physical",
        decrease = 15,
        percent = 30
    }, {
        type = "impact",
        decrease = 50,
        percent = 75
    }, {
        type = "explosion",
        decrease = 15,
        percent = 30
    }, {
        type = "acid",
        decrease = 5,
        percent = 25
    }},
    energy_source = {
        type = "burner",
        fuel_categories = {"electrical"},
        usage_priority = "primary-output",
        effectivity = 0.95,
        fuel_inventory_size = 3,
        burnt_inventory_size = 3
    },
    back_light = rolling_stock_back_light(),
    stand_by_light = rolling_stock_stand_by_light(),
    color = {
        r = 0.92,
        g = 0.07,
        b = 0,
        a = 0.5
    },
    default_copy_color_from_train_stop = true,
    pictures = {
        rotated = {
            layers = {{
                priority = "very-low",
                dice = 4,
                width = 1000,
                height = 600,
                direction_count = 256,
                allow_low_quality_rotation = true,
                filenames = {"__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_1.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_2.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_3.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_4.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_5.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_6.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_7.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_8.png"},
                line_length = 4,
                lines_per_file = 8,
                shift = {0, wagon_vertical_shift},
                scale = train_scale
            }, {
                priority = "very-low",
                flags = {"mask"},
                dice = 4,
                width = 1000,
                height = 600,
                direction_count = 256,
                allow_low_quality_rotation = true,
                filenames = {"__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_mask_1.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_mask_2.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_mask_3.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_mask_4.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_mask_5.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_mask_6.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_mask_7.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_mask_8.png"},
                line_length = 4,
                lines_per_file = 8,
                shift = {0, wagon_vertical_shift},
                apply_runtime_tint = true,
                scale = train_scale
            }, {
                priority = "very-low",
                flags = {"shadow"},
                width = 1000,
                height = 600,
                direction_count = 256,
                draw_as_shadow = true,
                allow_low_quality_rotation = true,
                filenames = {"__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_shadows_1.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_shadows_2.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_shadows_3.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_shadows_4.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_shadows_5.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_shadows_6.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_shadows_7.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/hr_electric_locomotive_wagon_shadows_8.png"},
                line_length = 4,
                lines_per_file = 8,
                shift = {0, wagon_vertical_shift},
                scale = train_scale
            }}
        }
    },
    minimap_representation = {
        filename = "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/electric-locomotive-wagon-minimap-representation.png",
        flags = {"icon"},
        size = {20, 40},
        scale = 0.5
    },
    selected_minimap_representation = {
        filename = "__electric-trains__/graphics/entity/vehicles/space-trains/electric-locomotive-wagon/electric-locomotive-wagon-selected-minimap-representation.png",
        flags = {"icon"},
        size = {20, 40},
        scale = 0.5
    },
    wheels = space_train_wheels,
    stop_trigger = { -- left side
    {
        type = "create-trivial-smoke",
        repeat_count = 125,
        smoke_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the left
        speed = {-0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
    }, -- right side
    {
        type = "create-trivial-smoke",
        repeat_count = 125,
        smoke_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the right
        speed = {0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
    }, {
        type = "play-sound",
        sound = sounds.train_brakes
    }},
    -- drive_over_tie_trigger = drive_over_tie(),
    -- tie_distance = 50,
    impact_category = "metal-large",
    working_sound = {
        sound = {
            filename = "__electric-trains__/sound/space-train-engine.ogg",
            volume = 0.4,
            modifiers = {volume_multiplier("main-menu", 1.8), volume_multiplier("driving", 0.9),
                         volume_multiplier("tips-and-tricks", 0.8)}
        },
        match_speed_to_activity = true,
        max_sounds_per_type = 2
    },
    open_sound = {
        filename = "__base__/sound/train-door-open.ogg",
        volume = 0.5
    },
    close_sound = {
        filename = "__base__/sound/train-door-close.ogg",
        volume = 0.4
    },
    sound_minimum_speed = 0.5,
    water_reflection = locomotive_reflection()
}, {
    type = "cargo-wagon",
    name = "electric-cargo-wagon",
    icon = "__electric-trains__/graphics/icons/electric-cargo-wagon.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    inventory_size = 50,
    minable = {
        mining_time = 0.5,
        result = "electric-cargo-wagon"
    },
    mined_sound = {
        filename = "__core__/sound/deconstruct-large.ogg",
        volume = 0.8
    },
    max_health = 600,
    corpse = "cargo-wagon-remnants",
    dying_explosion = "cargo-wagon-explosion",
    collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
    selection_box = {{-1, -2.703125}, {1, 3.296875}},
    damaged_trigger_effect = hit_effects.entity(),
    vertical_selection_shift = -0.796875,
    weight = 1000,
    max_speed = train_speed,
    braking_force = 3,
    friction_force = 0.50,
    air_resistance = 0.01,
    connection_distance = connection_length,
    joint_distance = 4,
    energy_per_hit_point = 5,
    resistances = {{
        type = "fire",
        decrease = 15,
        percent = 50
    }, {
        type = "physical",
        decrease = 15,
        percent = 30
    }, {
        type = "impact",
        decrease = 50,
        percent = 60
    }, {
        type = "explosion",
        decrease = 15,
        percent = 30
    }, {
        type = "acid",
        decrease = 3,
        percent = 20
    }},
    back_light = rolling_stock_back_light(),
    stand_by_light = rolling_stock_stand_by_light(),
    color = {
        r = 0.43,
        g = 0.23,
        b = 0,
        a = 0.5
    },
    pictures = {
        rotated = {
            layers = {{
                priority = "very-low",
                dice = 4,
                width = 1000,
                height = 600,
                back_equals_front = true,
                direction_count = 128,
                allow_low_quality_rotation = true,
                filenames = {"__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_cargo_wagon_1.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_cargo_wagon_2.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_cargo_wagon_3.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_cargo_wagon_4.png"},
                line_length = 4,
                lines_per_file = 8,
                shift = {0, wagon_vertical_shift},
                scale = cargo_wagon_scale
            }, --  {
            --     flags = {"mask"},
            --     priority = "very-low",
            --     dice = 4,
            --     width = 1000,
            --     height = 600,
            --     direction_count = 128,
            --     allow_low_quality_rotation = true,
            --     back_equals_front = true,
            --     apply_runtime_tint = true,
            --     shift = {0, wagon_vertical_shift},
            --     filenames = {"__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_cargo_wagon_mask_1.png",
            --                  "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_cargo_wagon_mask_2.png",
            --                  "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_cargo_wagon_mask_3.png",
            --                  "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_cargo_wagon_mask_4.png"},
            --     line_length = 4,
            --     lines_per_file = 8,
            --     scale = cargo_wagon_scale
            -- },
            {
                flags = {"shadow"},
                priority = "very-low",
                dice = 4,
                width = 1000,
                height = 600,
                back_equals_front = true,
                draw_as_shadow = true,
                direction_count = 128,
                allow_low_quality_rotation = true,
                filenames = {"__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_cargo_wagon_shadows_1.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_cargo_wagon_shadows_2.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_cargo_wagon_shadows_3.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_cargo_wagon_shadows_4.png"},
                line_length = 4,
                lines_per_file = 8,
                shift = {0.8, wagon_vertical_shift},
                scale = cargo_wagon_scale
            }}
        }
    },
    minimap_representation = {
        filename = "__electric-trains__/graphics/entity/vehicles/space-trains/electric-cargo-wagon-minimap-representation.png",
        flags = {"icon"},
        size = {20, 40},
        scale = 0.5
    },
    selected_minimap_representation = {
        filename = "__electric-trains__/graphics/entity/vehicles/space-trains/electric-cargo-wagon-selected-minimap-representation.png",
        flags = {"icon"},
        size = {20, 40},
        scale = 0.5
    },
    wheels = space_train_wheels,
    -- drive_over_tie_trigger = drive_over_tie(),
    -- tie_distance = 50,
    working_sound = {
        sound = {
            filename = "__base__/sound/train-wheels.ogg",
            volume = 0.3
        },
        match_volume_to_activity = true
    },
    crash_trigger = crash_trigger(),
    open_sound = sounds.cargo_wagon_open,
    close_sound = sounds.cargo_wagon_close,
    sound_minimum_speed = 1,
    vehicle_impact_sound = sounds.generic_impact,
    water_reflection = locomotive_reflection()
}, {
    type = "fluid-wagon",
    name = "electric-fluid-wagon",
    icon = "__electric-trains__/graphics/icons/electric-fluid-wagon.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {
        mining_time = 0.5,
        result = "electric-fluid-wagon"
    },
    mined_sound = {
        filename = "__core__/sound/deconstruct-large.ogg",
        volume = 0.8
    },
    max_health = 600,
    capacity = 60000,
    corpse = "fluid-wagon-remnants",
    dying_explosion = "fluid-wagon-explosion",
    collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
    selection_box = {{-1, -2.703125}, {1, 3.296875}},
    damaged_trigger_effect = hit_effects.entity(),
    vertical_selection_shift = -0.796875,
    weight = 1000,
    max_speed = train_speed,
    braking_force = 3,
    friction_force = 0.50,
    air_resistance = 0.01,
    connection_distance = connection_length,
    joint_distance = 4,
    energy_per_hit_point = 6,
    resistances = {{
        type = "fire",
        decrease = 15,
        percent = 50
    }, {
        type = "physical",
        decrease = 15,
        percent = 30
    }, {
        type = "impact",
        decrease = 50,
        percent = 60
    }, {
        type = "explosion",
        decrease = 15,
        percent = 30
    }, {
        type = "acid",
        decrease = 3,
        percent = 20
    }},
    back_light = rolling_stock_back_light(),
    stand_by_light = rolling_stock_stand_by_light(),
    color = {
        r = 0.43,
        g = 0.23,
        b = 0,
        a = 0.5
    },
    pictures = {
        rotated = {
            layers = {{
                priority = "very-low",
                dice = 4,
                width = 1000,
                height = 600,
                back_equals_front = true,
                direction_count = 128,
                allow_low_quality_rotation = true,
                filenames = {"__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_fluid_wagon_1.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_fluid_wagon_2.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_fluid_wagon_3.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_fluid_wagon_4.png"},
                line_length = 4,
                lines_per_file = 8,
                shift = {0, -0.7},
                scale = fluid_wagon_scale
            }, {
                flags = {"shadow"},
                priority = "very-low",
                dice = 4,
                width = 1000,
                height = 600,
                back_equals_front = true,
                draw_as_shadow = true,
                direction_count = 128,
                allow_low_quality_rotation = true,
                filenames = {"__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_fluid_wagon_shadows_1.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_fluid_wagon_shadows_2.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_fluid_wagon_shadows_3.png",
                             "__electric-trains__/graphics/entity/vehicles/space-trains/hr_space_fluid_wagon_shadows_4.png"},
                line_length = 4,
                lines_per_file = 8,
                shift = {0, -0.7},
                scale = fluid_wagon_scale
            }}
        }
    },
    minimap_representation = {
        filename = "__electric-trains__/graphics/entity/vehicles/space-trains/electric-fluid-wagon-minimap-representation.png",
        flags = {"icon"},
        size = {20, 40},
        scale = 0.5
    },
    selected_minimap_representation = {
        filename = "__electric-trains__/graphics/entity/vehicles/space-trains/electric-fluid-wagon-selected-minimap-representation.png",
        flags = {"icon"},
        size = {20, 40},
        scale = 0.5
    },
    wheels = space_train_wheels,
    -- drive_over_tie_trigger = drive_over_tie(),
    -- tie_distance = 50,
    working_sound = {
        sound = {
            filename = "__base__/sound/train-wheels.ogg",
            volume = 0.3
        },
        match_volume_to_activity = true
    },
    crash_trigger = crash_trigger(),
    sound_minimum_speed = 0.1,
    vehicle_impact_sound = sounds.generic_impact,
    water_reflection = locomotive_reflection()
}, {
    type = "artillery-wagon",
    name = "electric-artillery-wagon",
    icon = "__base__/graphics/icons/artillery-wagon.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    inventory_size = 1,
    ammo_stack_limit = 120,
    minable = {
        mining_time = 1,
        result = "electric-artillery-wagon"
    },
    mined_sound = sounds.deconstruct_large(0.8),
    max_health = 800,
    deliver_category = "vehicle",
    corpse = "artillery-wagon-remnants",
    dying_explosion = "artillery-wagon-explosion",
    collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
    selection_box = {{-1, -2.703125}, {1, 3.296875}},
    damaged_trigger_effect = hit_effects.entity(),
    vertical_selection_shift = -0.796875,
    weight = 6000,
    max_speed = train_speed,
    braking_force = 3,
    friction_force = 0.50,
    air_resistance = 0.015,
    connection_distance = 3,
    joint_distance = 4,
    energy_per_hit_point = 2,
    gun = "artillery-wagon-cannon",
    turret_rotation_speed = 0.002,
    turn_after_shooting_cooldown = 60,
    cannon_parking_frame_count = 8,
    cannon_parking_speed = 0.25,
    manual_range_modifier = 2.5,
    icon_draw_specification = {
        scale = 0.7,
        shift = {0, -0.5}
    },
    resistances = {{
        type = "fire",
        decrease = 15,
        percent = 50
    }, {
        type = "physical",
        decrease = 15,
        percent = 30
    }, {
        type = "impact",
        decrease = 50,
        percent = 50
    }, {
        type = "explosion",
        decrease = 15,
        percent = 30
    }, {
        type = "acid",
        decrease = 3,
        percent = 20
    }},
    back_light = rolling_stock_back_light(),
    stand_by_light = rolling_stock_stand_by_light(),
    color = {
        r = 0.43,
        g = 0.23,
        b = 0,
        a = 0.5
    },
    pictures = {
        rotated = {
            layers = {util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-base", {
                dice = 4,
                priority = "very-low",
                allow_low_quality_rotation = true,
                direction_count = 256,
                scale = 0.5,
                usage = "train"
            }), util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-base-shadow", {
                dice = 4,
                priority = "very-low",
                allow_low_quality_rotation = true,
                draw_as_shadow = true,
                direction_count = 256,
                scale = 0.5,
                usage = "train"
            })}
        }
    },
    cannon_barrel_pictures = {
        rotated = {
            layers = {util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel", {
                priority = "very-low",
                allow_low_quality_rotation = true,
                direction_count = 256,
                scale = 0.5,
                usage = "train"
            }), util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow", {
                priority = "very-low",
                allow_low_quality_rotation = true,
                draw_as_shadow = true,
                direction_count = 256,
                scale = 0.5,
                usage = "train"
            })}
        }
    },
    cannon_base_pictures = {
        rotated = {
            layers = {util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base", {
                priority = "very-low",
                allow_low_quality_rotation = true,
                direction_count = 256,
                scale = 0.5,
                usage = "train"
            }), util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow", {
                priority = "very-low",
                allow_low_quality_rotation = true,
                draw_as_shadow = true,
                direction_count = 256,
                scale = 0.5,
                usage = "train"
            })}
        }
    },
    cannon_base_height = 1.672049,
    cannon_base_shift_when_vertical = -2.5357685,
    cannon_base_shift_when_horizontal = -2.0702245,

    cannon_barrel_recoil_shiftings = { -- East-North-Up (when cannon is facing North)
    {0.0100, -0.0000, -0.0000}, {0.0093, -0.1973, -0.0878}, {0.0088, -0.3945, -0.1755}, {0.0083, -0.5918, -0.2635},
    {0.0078, -0.7888, -0.3513}, {0.0070, -0.9860, -0.4390}, {0.0070, -0.9828, -0.4375}, {0.0070, -0.9753, -0.4343},
    {0.0073, -0.9635, -0.4290}, {0.0073, -0.9475, -0.4220}, {0.0073, -0.9278, -0.4130}, {0.0073, -0.9043, -0.4025},
    {0.0075, -0.8770, -0.3905}, {0.0075, -0.8463, -0.3768}, {0.0075, -0.8123, -0.3618}, {0.0078, -0.7755, -0.3453},
    {0.0078, -0.7360, -0.3278}, {0.0080, -0.6940, -0.3090}, {0.0080, -0.6498, -0.2893}, {0.0083, -0.6040, -0.2690},
    {0.0083, -0.5565, -0.2478}, {0.0085, -0.5080, -0.2263}, {0.0085, -0.4588, -0.2043}, {0.0088, -0.4088, -0.1820},
    {0.0088, -0.3590, -0.1598}, {0.0090, -0.3095, -0.1378}, {0.0093, -0.2605, -0.1160}, {0.0093, -0.2128, -0.0948},
    {0.0095, -0.1663, -0.0740}, {0.0095, -0.1213, -0.0540}, {0.0098, -0.0785, -0.0350}, {0.0098, -0.0380, -0.0170}},
    cannon_barrel_light_direction = {0.5976251, -0.0242053, -0.8014102}, -- ENU

    minimap_representation = {
        filename = "__electric-trains__/graphics/entity/vehicles/space-trains/electric-artillery-wagon-minimap-representation.png",
        flags = {"icon"},
        size = {20, 40},
        scale = 0.5
    },
    selected_minimap_representation = {
        filename = "__electric-trains__/graphics/entity/vehicles/space-trains/electric-artillery-wagon-selected-minimap-representation.png",
        flags = {"icon"},
        size = {20, 40},
        scale = 0.5
    },
    wheels = space_train_wheels,
    -- drive_over_tie_trigger = drive_over_tie(),
    -- drive_over_tie_trigger_minimal_speed = 0.5,
    -- tie_distance = 50,
    working_sound = sounds.train_wagon_wheels,
    crash_trigger = crash_trigger(),
    open_sound = sounds.artillery_open,
    close_sound = sounds.artillery_close,
    rotating_sound = {
        sound = {
            filename = "__base__/sound/fight/artillery-rotation-loop.ogg",
            volume = 0.2
        },
        stopped_sound = {
            filename = "__base__/sound/fight/artillery-rotation-stop.ogg"
        }
    },
    water_reflection = {
        pictures = {
            filename = "__base__/graphics/entity/artillery-wagon/reflection/artillery-wagon-reflection.png",
            priority = "extra-high",
            width = 32,
            height = 52,
            shift = util.by_pixel(0, 40),
            variation_count = 1,
            scale = 5
        },
        rotate = true,
        orientation_to_variation = false
    }
}})
