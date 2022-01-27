local nuclear_smoke_color = { r = 0.1, g = 0.1, b = 0.8, a = 0.25 }
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

space_train_wheels =
{
  priority = "very-low",
  width = 500,
  height = 500,
  direction_count = 128,
  filenames =
  {
    "__space-trains__/prototypes/entities/vehicles/maglev_cushion_0.png",
    "__space-trains__/prototypes/entities/vehicles/maglev_cushion_1.png"
  },
  line_length = 8,
  lines_per_file = 8,
  hr_version =
  {
    priority = "very-low",
    width = 1000,
    height = 1000,
    direction_count = 128,
    filenames =
    {
      "__space-trains__/prototypes/entities/vehicles/hr_maglev_cushion_0.png",
      "__space-trains__/prototypes/entities/vehicles/hr_maglev_cushion_1.png"
    },
    line_length = 8,
    lines_per_file = 8,
    --shift = {0.015625, -0.453125}, original shifting from spritesheeter (likely needs doubling or halving)
    scale = 0.075
  }
}

data:extend({
  -- Entity
  {
    type = "locomotive",
    name = "space-locomotive",
    icon = "__space-trains__/icons/vehicles/space-locomotive.png",
    icon_size = 64,
    flags = { "placeable-neutral", "player-creation", "placeable-off-grid" },
    minable = { mining_time = 1, result = "space-locomotive" },
    mined_sound = { filename = "__core__/sound/deconstruct-medium.ogg" },
    max_health = 1500,
    equipment_grid = "kr-locomotive-grid",
    corpse = "locomotive-remnants",
    dying_explosion = "locomotive-explosion",
    collision_box = { { -0.6, -2.6 }, { 0.6, 2.6 } },
    selection_box = { { -1, -3 }, { 1, 3 } },
    drawing_box = { { -1, -4 }, { 1, 3 } },
    alert_icon_shift = util.by_pixel(0, -24),
    damaged_trigger_effect = hit_effects.entity(),
    weight = 12000,
    max_speed = 1.15725,
    --max_speed = 1.0185,
    --max_speed = 1.2035,
    max_power = "3MW",
    reversing_power_modifier = 0.75,
    braking_force = 40,
    friction_force = 0.50,
    vertical_selection_shift = -0.5,
    air_resistance = 0.0075, -- this is a percentage of current speed that will be subtracted
    connection_distance = 3,
    joint_distance = 4,
    energy_per_hit_point = 5,
    resistances = {
      {
        type = "fire",
        decrease = 20,
        percent = 75,
      },
      {
        type = "physical",
        decrease = 15,
        percent = 30,
      },
      {
        type = "impact",
        decrease = 50,
        percent = 75,
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 30,
      },
      {
        type = "acid",
        decrease = 5,
        percent = 25,
      },
    },
    burner = {
      fuel_category = "nuclear",
      effectivity = 0.1,
      fuel_inventory_size = 1,
      burnt_inventory_size = 1,
    },
    front_light = {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture = {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200,
        },
        shift = { -0.6, -16 },
        size = 2,
        intensity = 0.8,
        color = nuclear_smoke_color,
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture = {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200,
        },
        shift = { 0.6, -16 },
        size = 2,
        intensity = 0.8,
        color = nuclear_smoke_color,
      },
    },
    back_light = rolling_stock_back_light(),
    stand_by_light = rolling_stock_stand_by_light(),
    color = { r = 0.92, g = 0.07, b = 0, a = 0.5 },
    pictures = {
      layers = {
        {
          slice = 8,
          priority = "very-low",
          width = 500,
          height = 500,
          direction_count = 128,
          allow_low_quality_rotation = true,
          filenames = {
            "__space-trains__/prototypes/entities/vehicles/space_train_0.png",
            "__space-trains__/prototypes/entities/vehicles/space_train_1.png",
          },
          line_length = 8,
          lines_per_file = 8,
          shift = { 0.0, -0.4 },
          scale = 0.35,
          hr_version = {
            priority = "very-low",
            slice = 8,
            width = 1000,
            height = 1000,
            direction_count = 128,
            allow_low_quality_rotation = true,
            filenames = {
              "__space-trains__/prototypes/entities/vehicles/hr_space_train_0.png",
              "__space-trains__/prototypes/entities/vehicles/hr_space_train_1.png",
            },
            line_length = 8,
            lines_per_file = 8,
            shift = { 0.0, -0.4 },
            scale = 0.35,
          },
        },
        -- {
        --   priority = "very-low",
        --   flags = { "mask" },
        --   slice = 4,
        --   width = 236,
        --   height = 228,
        --   direction_count = 256,
        --   allow_low_quality_rotation = true,
        --   filenames = {
        --     kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-mask-01.png",
        --     kr_entities_path .. "nuclear-locomotive/nuclear-locomotive-mask-02.png",
        --   },
        --   line_length = 4,
        --   lines_per_file = 8,
        --   shift = { 0.0, -0.5 },
        --   apply_runtime_tint = true,
        --   hr_version = {
        --     priority = "very-low",
        --     flags = { "mask" },
        --     slice = 4,
        --     width = 472,
        --     height = 456,
        --     direction_count = 256,
        --     allow_low_quality_rotation = true,
        --     filenames = {
        --       kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-mask-1.png",
        --       kr_entities_path .. "nuclear-locomotive/hr-nuclear-locomotive-mask-2.png",
        --     },
        --     line_length = 4,
        --     lines_per_file = 4,
        --     shift = { 0.0, -0.5 },
        --     apply_runtime_tint = true,
        --     scale = 0.5,
        --   },
        -- },
        {
          priority = "very-low",
          slice = 8,
          flags = { "shadow" },
          width = 500,
          height = 500,
          direction_count = 128,
          draw_as_shadow = true,
          allow_low_quality_rotation = true,
          filenames = {
            "__space-trains__/prototypes/entities/vehicles/space_train_shadows_0.png",
            "__space-trains__/prototypes/entities/vehicles/space_train_shadows_1.png",
          },
          line_length = 8,
          lines_per_file = 8,
          shift = { 1, 0.3 },
          scale = 0.5
        },
      },
    },
    front_light_pictures = {
      layers = {
        {
          priority = "very-low",
          blend_mode = "additive",
          draw_as_light = true,
          tint = nuclear_smoke_color,
          width = 230,
          height = 212,
          direction_count = 256,
          allow_low_quality_rotation = true,
          filenames = {
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-light-front-01.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-light-front-02.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-light-front-03.png",
            "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-light-front-04.png",
          },
          line_length = 8,
          lines_per_file = 8,
          shift = util.by_pixel(0, -50),
          hr_version = {
            priority = "very-low",
            blend_mode = "additive",
            draw_as_light = true,
            tint = nuclear_smoke_color,
            width = 458,
            height = 420,
            direction_count = 256,
            allow_low_quality_rotation = true,
            filenames = {
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-light-front-01.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-light-front-02.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-light-front-03.png",
              "__base__/graphics/entity/diesel-locomotive/hr-diesel-locomotive-light-front-04.png",
            },
            line_length = 8,
            lines_per_file = 8,
            shift = util.by_pixel(0, -50),
            scale = 0.5,
          },
        },
      },
    },
    minimap_representation = {
      filename = "__space-trains__/prototypes/entities/vehicles/space-locomotive-minimap-representation.png",
      flags = { "icon" },
      size = { 20, 40 },
      scale = 0.5,
    },
    selected_minimap_representation = {
      filename = "__space-trains__/prototypes/entities/vehicles/space-locomotive-selected-minimap-representation.png",
      flags = { "icon" },
      size = { 20, 40 },
      scale = 0.5,
    },
    wheels = space_train_wheels,
    stop_trigger = {
      -- left side
      {
        type = "create-trivial-smoke",
        repeat_count = 125,
        smoke_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the left
        speed = { -0.03, 0 },
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = { { -0.75, -2.7 }, { -0.3, 2.7 } },
      },
      -- right side
      {
        type = "create-trivial-smoke",
        repeat_count = 125,
        smoke_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the right
        speed = { 0.03, 0 },
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = { { 0.3, -2.7 }, { 0.75, 2.7 } },
      },
      {
        type = "play-sound",
        sound = sounds.train_brakes,
      },
      {
        type = "play-sound",
        sound = sounds.train_brake_screech,
      },
    },
    drive_over_tie_trigger = drive_over_tie(),
    tie_distance = 50,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = {
        filename = "__base__/sound/train-engine.ogg",
        volume = 0.4,
      },
      match_speed_to_activity = true,
      max_sounds_per_type = 2,
    },
    open_sound = { filename = "__base__/sound/train-door-open.ogg", volume = 0.5 },
    close_sound = { filename = "__base__/sound/train-door-close.ogg", volume = 0.4 },
    sound_minimum_speed = 0.25,
    water_reflection = locomotive_reflection(),
  },
})
