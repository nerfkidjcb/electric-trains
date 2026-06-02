local item_sounds = require("__base__.prototypes.item_sounds")

local electric_train_front_light_color = { r = 0.25, g = 0.25, b = 0.8, a = 0.25 }
local train_scale = 0.425
local fluid_wagon_scale = 0.375
local cargo_wagon_scale = 0.4
local wagon_vertical_shift = -0.8
local train_speed = 2.4

local icon_path = "__electric-trains__/graphics/icons/"
local sound_path = "__electric-trains__/sound/"
local cargo_path = "__electric-trains__/graphics/entity/space-cargo-wagon/"
local fluid_path = "__electric-trains__/graphics/entity/space-fluid-wagon/"
local loco_path = "__electric-trains__/graphics/entity/space-locomotive/"
local maglev_path = "__electric-trains__/graphics/entity/space-train-maglev-cushion/"

local space_train_wheels = {
    priority = "very-low",
    width = 250,
    height = 150,
    direction_count = 256,
    filenames = {
        maglev_path .. "space-train-maglev_cushions_1.png",
        maglev_path .. "space-train-maglev_cushions_2.png"
    },
    line_length = 8,
    lines_per_file = 16,
    scale = 1.4 / 2,
    rotated = {
        width = 500,
        height = 300,
        direction_count = 256,
        filenames = {
            maglev_path .. "space-train-maglev_cushions_1.png",
            maglev_path .. "space-train-maglev_cushions_2.png",
            maglev_path .. "space-train-maglev_cushions_3.png",
            maglev_path .. "space-train-maglev_cushions_4.png",
            maglev_path .. "space-train-maglev_cushions_5.png",
            maglev_path .. "space-train-maglev_cushions_6.png",
            maglev_path .. "space-train-maglev_cushions_7.png",
            maglev_path .. "space-train-maglev_cushions_8.png"
        },
        line_length = 4,
        lines_per_file = 8,
        shift = { 0.0, 0.1 }, -- original shifting from spritesheet (likely needs doubling or halving)
        scale = 0.775 / 2
    }
}


--------------------------
--  electric-locomotive --
--------------------------
data:extend
{
    {
        type = "item-with-entity-data",
        name = "electric-locomotive",
        icon = icon_path .. "electric-locomotive.png",
        icon_size = 64,
        subgroup = "train-transport",
        order = "c[rolling-stock]-f[locomotive]",
        place_result = "electric-locomotive",
        stack_size = 5,
        inventory_move_sound = item_sounds.locomotive_inventory_move,
        pick_sound = item_sounds.locomotive_inventory_pickup,
        drop_sound = item_sounds.locomotive_inventory_move
    },
    {
        type = "recipe",
        name = "electric-locomotive",
        energy_required = 60,
        enabled = false,
        ingredients = {
            { type = "item", name = "locomotive",           amount = 1 },
            { type = "item", name = "processing-unit",      amount = 20 },
            { type = "item", name = "steel-plate",          amount = 40 },
            { type = "item", name = "electric-engine-unit", amount = 50 }
        },
        results = { { type = "item", name = "electric-locomotive", amount = 1 } },
        order = "c[rolling-stock]-f[locomotive]"
    }
}


local electric_locomotive = table.deepcopy(data.raw["locomotive"]["locomotive"])

electric_locomotive.name = "electric-locomotive"
electric_locomotive.icon = icon_path .. "electric-locomotive.png"
electric_locomotive.minable = { mining_time = 1.0, result = "electric-locomotive" }
electric_locomotive.max_health = 1500
electric_locomotive.factoriopedia_simulation = nil
electric_locomotive.weight = 4000
electric_locomotive.max_speed = train_speed
electric_locomotive.max_power = "4MW"
electric_locomotive.reversing_power_modifier = 1.0
electric_locomotive.braking_force = 40
electric_locomotive.air_resistance = 0.0025
electric_locomotive.energy_source = {
    type = "burner",
    fuel_categories = { "electrical" },
    usage_priority = "primary-output",
    effectivity = 0.95,
    fuel_inventory_size = 3,
    burnt_inventory_size = 3
}
electric_locomotive.pictures.rotated.layers =
{
    {
        allow_low_quality_rotation = true,
        dice = 4,
        direction_count = 256,
        filenames = {
            loco_path .. "space_locomotive_1.png",
            loco_path .. "space_locomotive_2.png",
            loco_path .. "space_locomotive_3.png",
            loco_path .. "space_locomotive_4.png",
            loco_path .. "space_locomotive_5.png",
            loco_path .. "space_locomotive_6.png",
            loco_path .. "space_locomotive_7.png",
            loco_path .. "space_locomotive_8.png"
        },
        height = 600,
        line_length = 4,
        lines_per_file = 8,
        priority = "very-low",
        scale = train_scale,
        shift = { 0.0, wagon_vertical_shift },
        width = 1000,
    },
    {
        allow_low_quality_rotation = true,
        apply_runtime_tint = true,
        dice = 4,
        direction_count = 256,
        filenames = {
            loco_path .. "space_locomotive_mask_1.png",
            loco_path .. "space_locomotive_mask_2.png",
            loco_path .. "space_locomotive_mask_3.png",
            loco_path .. "space_locomotive_mask_4.png",
            loco_path .. "space_locomotive_mask_5.png",
            loco_path .. "space_locomotive_mask_6.png",
            loco_path .. "space_locomotive_mask_7.png",
            loco_path .. "space_locomotive_mask_8.png"
        },
        flags = { "mask" },
        height = 600,
        line_length = 4,
        lines_per_file = 8,
        priority = "very-low",
        scale = train_scale,
        shift = { 0.0, wagon_vertical_shift },
        tint_as_overlay = true,
        width = 1000,
    },
    {
        allow_low_quality_rotation = true,
        direction_count = 256,
        draw_as_shadow = true,
        filenames = {
            loco_path .. "space_locomotive_shadows_1.png",
            loco_path .. "space_locomotive_shadows_2.png",
            loco_path .. "space_locomotive_shadows_3.png",
            loco_path .. "space_locomotive_shadows_4.png",
            loco_path .. "space_locomotive_shadows_5.png",
            loco_path .. "space_locomotive_shadows_6.png",
            loco_path .. "space_locomotive_shadows_7.png",
            loco_path .. "space_locomotive_shadows_8.png"
        },
        flags = { "shadow" },
        height = 600,
        line_length = 4,
        lines_per_file = 8,
        priority = "very-low",
        scale = train_scale,
        shift = { 0.0, wagon_vertical_shift },
        tint_as_overlay = true,
        width = 1000,
    }
}
electric_locomotive.front_light_pictures.rotated.layers =
{
    {
        allow_low_quality_rotation = true,
        blend_mode = "additive",
        direction_count = 256,
        --draw_as_glow = true,
        draw_as_light = true,
        filenames = {
            loco_path .. "space_locomotive_lights_front_1.png",
            loco_path .. "space_locomotive_lights_front_2.png",
            loco_path .. "space_locomotive_lights_front_3.png",
            loco_path .. "space_locomotive_lights_front_4.png",
            loco_path .. "space_locomotive_lights_front_5.png",
            loco_path .. "space_locomotive_lights_front_6.png",
            loco_path .. "space_locomotive_lights_front_7.png",
            loco_path .. "space_locomotive_lights_front_8.png"
        },
        height = 600,
        line_length = 4,
        lines_per_file = 8,
        priority = "very-low",
        scale = train_scale,
        shift = { 0.0, wagon_vertical_shift },
        tint = { r = 1.0, g = 1.0, b = 1.0, a = 0.25 },
        width = 1000,
    }
}
electric_locomotive.minimap_representation.filename =
    icon_path .. "representation/electric-locomotive-minimap-representation.png"
electric_locomotive.selected_minimap_representation.filename =
    icon_path .. "representation/electric-locomotive-selected-minimap-representation.png"
electric_locomotive.wheels = space_train_wheels
electric_locomotive.drive_over_tie_trigger = nil
electric_locomotive.drive_over_tie_trigger_minimal_speed = nil
electric_locomotive.tie_distance = nil
electric_locomotive.working_sound.main_sounds[2].sound.filename = sound_path .. "space-train-engine.ogg"
electric_locomotive.working_sound.main_sounds[2].sound.volume = 0.4

if not mods["realistic-flashlight-fixed"] then
    electric_locomotive.front_light[1].intensity = 0.8
    electric_locomotive.front_light[1].color = electric_train_front_light_color
    electric_locomotive.front_light[2].intensity = 0.8
    electric_locomotive.front_light[2].color = electric_train_front_light_color
end

data:extend { electric_locomotive }


---------------------------------
--  electric-locomotive-wagon  --
---------------------------------
data:extend
{
    {
        type = "item-with-entity-data",
        name = "electric-locomotive-wagon",
        icon = icon_path .. "electric-locomotive-wagon.png",
        icon_size = 64,
        subgroup = "train-transport",
        order = "c[rolling-stock]-f[locomotiveb]",
        place_result = "electric-locomotive-wagon",
        stack_size = 5,
        inventory_move_sound = item_sounds.locomotive_inventory_move,
        pick_sound = item_sounds.locomotive_inventory_pickup,
        drop_sound = item_sounds.locomotive_inventory_move
    },
    {
        type = "recipe",
        name = "electric-locomotive-wagon",
        energy_required = 60,
        enabled = false,
        ingredients = {
            { type = "item", name = "locomotive",           amount = 1 },
            { type = "item", name = "processing-unit",      amount = 10 },
            { type = "item", name = "steel-plate",          amount = 40 },
            { type = "item", name = "electric-engine-unit", amount = 50 }
        },
        results = { { type = "item", name = "electric-locomotive-wagon", amount = 1 } },
        order = "c[rolling-stock]-f[locomotiveb]"
    }
}


local electric_locomotive_wagon = table.deepcopy(data.raw["locomotive"]["electric-locomotive"])

electric_locomotive_wagon.name = "electric-locomotive-wagon"
electric_locomotive_wagon.icon = icon_path .. "electric-locomotive-wagon.png"
electric_locomotive_wagon.minable = { mining_time = 1, result = "electric-locomotive-wagon" }
electric_locomotive_wagon.drawing_box = { { -1.0, -4.0 }, { 1.0, 3.0 } } -- ???
electric_locomotive_wagon.pictures.rotated.layers =
{
    {
        allow_low_quality_rotation = true,
        dice = 4,
        direction_count = 256,
        filenames = {
            cargo_path .. "space_cargo_wagon_1.png",
            cargo_path .. "space_cargo_wagon_2.png",
            cargo_path .. "space_cargo_wagon_3.png",
            cargo_path .. "space_cargo_wagon_4.png",
            cargo_path .. "space_cargo_wagon_1.png",
            cargo_path .. "space_cargo_wagon_2.png",
            cargo_path .. "space_cargo_wagon_3.png",
            cargo_path .. "space_cargo_wagon_4.png"
        },
        height = 600,
        line_length = 4,
        lines_per_file = 8,
        priority = "very-low",
        scale = train_scale,
        shift = { 0.0, wagon_vertical_shift },
        width = 1000,
    },
    {
        allow_low_quality_rotation = true,
        apply_runtime_tint = true,
        dice = 4,
        direction_count = 256,
        filenames = {
            cargo_path .. "space_cargo_wagon_mask_1.png",
            cargo_path .. "space_cargo_wagon_mask_2.png",
            cargo_path .. "space_cargo_wagon_mask_3.png",
            cargo_path .. "space_cargo_wagon_mask_4.png",
            cargo_path .. "space_cargo_wagon_mask_1.png",
            cargo_path .. "space_cargo_wagon_mask_2.png",
            cargo_path .. "space_cargo_wagon_mask_3.png",
            cargo_path .. "space_cargo_wagon_mask_4.png"
        },
        flags = { "mask" },
        height = 600,
        line_length = 4,
        lines_per_file = 8,
        priority = "very-low",
        scale = train_scale,
        shift = { 0.0, wagon_vertical_shift },
        width = 1000,
    },
    {
        allow_low_quality_rotation = true,
        dice = 4,
        direction_count = 256,
        filenames = {
            cargo_path .. "electric_locomotive_wagon_top_light_1.png",
            cargo_path .. "electric_locomotive_wagon_top_light_2.png",
            cargo_path .. "electric_locomotive_wagon_top_light_3.png",
            cargo_path .. "electric_locomotive_wagon_top_light_4.png",
            cargo_path .. "electric_locomotive_wagon_top_light_5.png",
            cargo_path .. "electric_locomotive_wagon_top_light_6.png",
            cargo_path .. "electric_locomotive_wagon_top_light_7.png",
            cargo_path .. "electric_locomotive_wagon_top_light_8.png"
        },
        height = 600,
        line_length = 4,
        lines_per_file = 8,
        priority = "very-low",
        scale = train_scale,
        shift = { 0.0, wagon_vertical_shift },
        width = 1000,
    },
    {
        allow_low_quality_rotation = true,
        direction_count = 256,
        draw_as_shadow = true,
        filenames = {
            cargo_path .. "space_cargo_wagon_shadows_1.png",
            cargo_path .. "space_cargo_wagon_shadows_2.png",
            cargo_path .. "space_cargo_wagon_shadows_3.png",
            cargo_path .. "space_cargo_wagon_shadows_4.png",
            cargo_path .. "space_cargo_wagon_shadows_1.png",
            cargo_path .. "space_cargo_wagon_shadows_2.png",
            cargo_path .. "space_cargo_wagon_shadows_3.png",
            cargo_path .. "space_cargo_wagon_shadows_4.png"
        },
        flags = { "shadow" },
        height = 600,
        line_length = 4,
        lines_per_file = 8,
        priority = "very-low",
        scale = train_scale,
        shift = { 0.0, wagon_vertical_shift },
        width = 1000,
    }
}

data:extend { electric_locomotive_wagon }


----------------------------
--  electric-cargo-wagon  --
----------------------------
data:extend
{
    {
        type = "item-with-entity-data",
        name = "electric-cargo-wagon",
        icon = icon_path .. "electric-cargo-wagon.png",
        icon_size = 64,
        subgroup = "train-transport",
        order = "c[rolling-stock]-h[cargo-wagon]",
        place_result = "electric-cargo-wagon",
        stack_size = 5,
        inventory_move_sound = item_sounds.metal_large_inventory_move,
        pick_sound = item_sounds.locomotive_inventory_pickup,
        drop_sound = item_sounds.metal_large_inventory_move
    },
    {
        type = "recipe",
        name = "electric-cargo-wagon",
        energy_required = 60,
        enabled = false,
        ingredients = {
            { type = "item", name = "cargo-wagon",          amount = 1 },
            { type = "item", name = "processing-unit",      amount = 10 },
            { type = "item", name = "steel-plate",          amount = 40 },
            { type = "item", name = "electric-engine-unit", amount = 5 }
        },
        results = { { type = "item", name = "electric-cargo-wagon", amount = 1 } },
        order = "c[rolling-stock]-h[cargo-wagon]"
    }
}


local electric_cargo_wagon = table.deepcopy(data.raw["cargo-wagon"]["cargo-wagon"])

electric_cargo_wagon.name = "electric-cargo-wagon"
electric_cargo_wagon.icon = icon_path .. "electric-cargo-wagon.png"
electric_cargo_wagon.inventory_size = 50
electric_cargo_wagon.minable = { mining_time = 1.0, result = "electric-cargo-wagon" }
electric_cargo_wagon.factoriopedia_simulation = nil
electric_cargo_wagon.max_speed = train_speed
electric_cargo_wagon.pictures.rotated.layers =
{
    {
        allow_low_quality_rotation = true,
        back_equals_front = true,
        dice = 4,
        direction_count = 128,
        filenames = {
            cargo_path .. "space_cargo_wagon_1.png",
            cargo_path .. "space_cargo_wagon_2.png",
            cargo_path .. "space_cargo_wagon_3.png",
            cargo_path .. "space_cargo_wagon_4.png"
        },
        height = 600,
        line_length = 4,
        lines_per_file = 8,
        priority = "very-low",
        scale = cargo_wagon_scale,
        shift = { 0.0, wagon_vertical_shift },
        width = 1000,
    },
    {
        allow_low_quality_rotation = true,
        apply_runtime_tint = true,
        back_equals_front = true,
        dice = 4,
        direction_count = 128,
        filenames = {
            cargo_path .. "space_cargo_wagon_mask_1.png",
            cargo_path .. "space_cargo_wagon_mask_2.png",
            cargo_path .. "space_cargo_wagon_mask_3.png",
            cargo_path .. "space_cargo_wagon_mask_4.png"
        },
        flags = { "mask" },
        height = 600,
        line_length = 4,
        lines_per_file = 8,
        priority = "very-low",
        scale = cargo_wagon_scale,
        shift = { 0.0, wagon_vertical_shift },
        width = 1000,
    },
    {
        allow_low_quality_rotation = true,
        back_equals_front = true,
        dice = 4,
        direction_count = 128,
        draw_as_shadow = true,
        filenames = {
            cargo_path .. "space_cargo_wagon_shadows_1.png",
            cargo_path .. "space_cargo_wagon_shadows_2.png",
            cargo_path .. "space_cargo_wagon_shadows_3.png",
            cargo_path .. "space_cargo_wagon_shadows_4.png"
        },
        flags = { "shadow" },
        height = 600,
        line_length = 4,
        lines_per_file = 8,
        priority = "very-low",
        scale = cargo_wagon_scale,
        shift = { 0.8, wagon_vertical_shift },
        width = 1000,
    }
}
electric_cargo_wagon.horizontal_doors = nil
electric_cargo_wagon.vertical_doors = nil
electric_cargo_wagon.minimap_representation.filename =
    icon_path .. "representation/electric-cargo-wagon-minimap-representation.png"
electric_cargo_wagon.selected_minimap_representation.filename =
    icon_path .. "representation/electric-cargo-wagon-selected-minimap-representation.png"
electric_cargo_wagon.wheels = space_train_wheels
electric_cargo_wagon.door_opening_sound = nil
electric_cargo_wagon.door_closing_sound = nil
electric_cargo_wagon.drive_over_tie_trigger = nil
electric_cargo_wagon.drive_over_tie_trigger_minimal_speed = nil
electric_cargo_wagon.tie_distance = nil

data:extend { electric_cargo_wagon }


----------------------------
--  electric-fluid-wagon  --
----------------------------
data:extend
{
    {
        type = "item-with-entity-data",
        name = "electric-fluid-wagon",
        icon = icon_path .. "electric-fluid-wagon.png",
        icon_size = 64,
        subgroup = "train-transport",
        order = "c[rolling-stock]-i[fluid-wagon]",
        place_result = "electric-fluid-wagon",
        stack_size = 5,
        inventory_move_sound = item_sounds.metal_large_inventory_move,
        pick_sound = item_sounds.locomotive_inventory_pickup,
        drop_sound = item_sounds.metal_large_inventory_move
    },
    {
        type = "recipe",
        name = "electric-fluid-wagon",
        energy_required = 60,
        enabled = false,
        ingredients = {
            { type = "item", name = "fluid-wagon",          amount = 1 },
            { type = "item", name = "processing-unit",      amount = 10 },
            { type = "item", name = "steel-plate",          amount = 40 },
            { type = "item", name = "electric-engine-unit", amount = 5 }
        },
        results = { { type = "item", name = "electric-fluid-wagon", amount = 1 } },
        order = "c[rolling-stock]-h[fluid-wagon]"
    }
}


local electric_fluid_wagon = table.deepcopy(data.raw["fluid-wagon"]["fluid-wagon"])

electric_fluid_wagon.name = "electric-fluid-wagon"
electric_fluid_wagon.icon = icon_path .. "electric-fluid-wagon.png"
electric_fluid_wagon.minable = { mining_time = 1.0, result = "electric-fluid-wagon" }
electric_fluid_wagon.capacity = 60000
electric_fluid_wagon.factoriopedia_simulation = nil
electric_fluid_wagon.max_speed = train_speed
electric_fluid_wagon.pictures.rotated.layers =
{
    {
        allow_low_quality_rotation = true,
        back_equals_front = true,
        dice = 4,
        direction_count = 128,
        filenames = {
            fluid_path .. "space_fluid_wagon_1.png",
            fluid_path .. "space_fluid_wagon_2.png",
            fluid_path .. "space_fluid_wagon_3.png",
            fluid_path .. "space_fluid_wagon_4.png"
        },
        height = 600,
        line_length = 4,
        lines_per_file = 8,
        priority = "very-low",
        scale = fluid_wagon_scale,
        shift = { 0.0, -0.7 },
        width = 1000,
    },
    {
        allow_low_quality_rotation = true,
        back_equals_front = true,
        dice = 4,
        direction_count = 128,
        draw_as_shadow = true,
        filenames = {
            fluid_path .. "space_fluid_wagon_shadows_1.png",
            fluid_path .. "space_fluid_wagon_shadows_2.png",
            fluid_path .. "space_fluid_wagon_shadows_3.png",
            fluid_path .. "space_fluid_wagon_shadows_4.png"
        },
        flags = { "shadow" },
        height = 600,
        line_length = 4,
        lines_per_file = 8,
        priority = "very-low",
        scale = fluid_wagon_scale,
        shift = { 0.0, -0.7 },
        width = 1000,
    }
}

electric_fluid_wagon.minimap_representation.filename =
    icon_path .. "representation/electric-fluid-wagon-minimap-representation.png"
electric_fluid_wagon.selected_minimap_representation.filename =
    icon_path .. "representation/electric-fluid-wagon-selected-minimap-representation.png"
electric_fluid_wagon.wheels = space_train_wheels
electric_fluid_wagon.drive_over_tie_trigger = nil
electric_fluid_wagon.drive_over_tie_trigger_minimal_speed = nil
electric_fluid_wagon.tie_distance = nil

data:extend { electric_fluid_wagon }


--------------------------------
--  electric-artillery-wagon  --
--------------------------------
data:extend
{
    {
        type = "item-with-entity-data",
        name = "electric-artillery-wagon",
        icon = icon_path .. "electric-artillery-wagon.png",
        icon_size = 64,
        subgroup = "train-transport",
        order = "c[rolling-stock]-j[artillery-wagon]",
        inventory_move_sound = item_sounds.artillery_large_inventory_move,
        pick_sound = item_sounds.artillery_large_inventory_pickup,
        drop_sound = item_sounds.artillery_large_inventory_move,
        place_result = "electric-artillery-wagon",
        stack_size = 5
    },
    {
        type = "recipe",
        name = "electric-artillery-wagon",
        energy_required = 60,
        enabled = false,
        ingredients = {
            { type = "item", name = "artillery-wagon",      amount = 1 },
            { type = "item", name = 'electric-engine-unit', amount = 20 },
            { type = "item", name = "iron-gear-wheel",      amount = 20 },
            { type = "item", name = "steel-plate",          amount = 20 },
            { type = "item", name = "pipe",                 amount = 16 },
            { type = "item", name = "processing-unit",      amount = 10 }
        },
        results = { { type = "item", name = "electric-artillery-wagon", amount = 1 } }
    }
}


local electric_artillery_wagon = table.deepcopy(data.raw["artillery-wagon"]["artillery-wagon"])

electric_artillery_wagon.name = "electric-artillery-wagon"
electric_artillery_wagon.ammo_stack_limit = 120
electric_artillery_wagon.minable = { mining_time = 1.0, result = "electric-artillery-wagon" }
electric_artillery_wagon.max_health = 800
electric_artillery_wagon.factoriopedia_simulation = nil
electric_artillery_wagon.weight = 6000
electric_artillery_wagon.max_speed = train_speed
electric_artillery_wagon.turret_rotation_speed = 0.002
electric_artillery_wagon.minimap_representation.filename =
    icon_path .. "representation/electric-artillery-wagon-minimap-representation.png"
electric_artillery_wagon.selected_minimap_representation.filename =
    icon_path .. "representation/electric-artillery-wagon-selected-minimap-representation.png"
electric_artillery_wagon.wheels = space_train_wheels
electric_artillery_wagon.drive_over_tie_trigger = nil
electric_artillery_wagon.drive_over_tie_trigger_minimal_speed = nil
electric_artillery_wagon.tie_distance = nil

data:extend { electric_artillery_wagon }
