------------------------------------------
-- Startup Settings handling happens here.
------------------------------------------
if settings.startup["space-locomotive-speed-setting"].value == "238 km/h (Vanilla)" then
  data.raw["locomotive"]["space-locomotive"].max_speed = 1.1
  data.raw["cargo-wagon"]["space-cargo-wagon"].max_speed = 1.1
  data.raw["fluid-wagon"]["space-fluid-wagon"].max_speed = 1.1
elseif settings.startup["space-locomotive-speed-setting"].value == "378 km/h" then
  data.raw["locomotive"]["space-locomotive"].max_speed = 1.75
  data.raw["cargo-wagon"]["space-cargo-wagon"].max_speed = 1.75
  data.raw["fluid-wagon"]["space-fluid-wagon"].max_speed = 1.75
end
if settings.startup["space-cargo-wagon-capacity-setting"].value == "40 Slots (Vanilla)" then
  data.raw["cargo-wagon"]["space-cargo-wagon"].inventory_size = 40
elseif settings.startup["space-cargo-wagon-capacity-setting"].value == "120 Slots (Extended)" then
  data.raw["cargo-wagon"]["space-cargo-wagon"].inventory_size = 120
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

  data.raw["recipe"]["recipe-space-locomotive"].ingredients =
    {{"locomotive", 1}, {"processing-unit", 20}, {"electronic-components", 20}, {"steel-gear-wheel", 20},
     {"rare-metals", 80}}
  table.insert(data.raw["recipe"]["recipe-space-cargo-wagon"].ingredients, {"steel-gear-wheel", 20})
  table.insert(data.raw["recipe"]["recipe-space-fluid-wagon"].ingredients, {"steel-gear-wheel", 20})
  table.insert(data.raw["recipe"]["space-train-battery-pack"].ingredients, {"lithium-sulfur-battery", 10})
  if settings.startup["space-battery-decay-enable-setting"].value then
    table.insert(data.raw["recipe"]["space-train-battery-pack-refurbish"].ingredients, {"lithium-sulfur-battery", 5})
  end
else
  if settings.startup["space-battery-decay-enable-setting"].value then
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

  -- Handle Battery decay in Space Exploration.
  if settings.startup["space-battery-decay-enable-setting"].value then
    table.insert(data.raw["technology"]["se-space-rail"].effects, {
      type = "unlock-recipe",
      recipe = "space-train-battery-pack-refurbish"
    })
    data.raw["recipe"]["space-train-battery-pack-refurbish"].category = "hard-recycling"

    -- Check for the installed version of Space Exploration and handle it.
    old_version = util.split(mods["space-exploration"], ".")
    if tonumber(old_version[2]) <= 5 then -- Check if this is pre v0.6.0 SE
      data.raw["recipe"]["space-train-battery-pack-refurbish"].subgroup = "space-recycling"
    else
      data.raw["recipe"]["space-train-battery-pack-refurbish"].subgroup = "recycling"
    end
  end

  -- Add new prerequisites to the Space Train Tech to reflect the newly required ingredients.
  table.insert(data.raw["technology"]["se-space-rail"].prerequisites, "se-heat-shielding")
  table.insert(data.raw["technology"]["se-space-rail"].prerequisites, "steel-processing")
  table.insert(data.raw["technology"]["se-space-rail"].prerequisites, "advanced-electronics-2")
  -- Add new prerequisites to the Space Train Tech if Krastorio 2 is used.
  if mods["Krastorio2"] then
    table.insert(data.raw["technology"]["se-space-rail"].prerequisites, "advanced-electronics")
    table.insert(data.raw["technology"]["se-space-rail"].prerequisites, "kr-lithium-sulfur-battery")
  end

  -- Change recipes accordingly when space exploration mods are installed and used.
  table.insert(data.raw["recipe"]["recipe-space-locomotive"].ingredients, {"se-heat-shielding", 20})
  table.insert(data.raw["recipe"]["recipe-space-cargo-wagon"].ingredients, {"se-heat-shielding", 20})
  table.insert(data.raw["recipe"]["recipe-space-fluid-wagon"].ingredients, {"se-heat-shielding", 20})
  table.insert(data.raw["recipe"]["space-train-battery-charging-station"].ingredients, {"se-heat-shielding", 20})

  data.raw["assembling-machine"]["space-train-battery-charging-station"].se_allow_in_space = true

  if mods["space-exploration"] and not mods["Krastorio2"] then
    table.insert(data.raw["recipe"]["recipe-space-locomotive"].ingredients, {"steel-plate", 20})
    table.insert(data.raw["recipe"]["recipe-space-cargo-wagon"].ingredients, {"steel-plate", 20})
    table.insert(data.raw["recipe"]["recipe-space-fluid-wagon"].ingredients, {"steel-plate", 20})
  end
else
  -- Handle adding a new tech for Space Trains if Space Exploration is not used. (Vanilla)
  -- table.insert(data.raw["recipe"]["recipe-space-locomotive"].ingredients, {"steel-plate", 20})
  -- table.insert(data.raw["recipe"]["recipe-space-cargo-wagon"].ingredients, {"steel-plate", 20})
  -- table.insert(data.raw["recipe"]["recipe-space-fluid-wagon"].ingredients, {"steel-plate", 20})
  -- UPDATE: More realistic and expensive recipes for the Electric Locomotive and wagons
  table.insert(data.raw["recipe"]["recipe-space-locomotive"].ingredients, {"steel-plate", 40})
  table.insert(data.raw["recipe"]["recipe-space-locomotive"].ingredients, {"rocket-control-unit", 10})
  table.insert(data.raw["recipe"]["recipe-space-locomotive"].ingredients, {"electric-engine-unit", 50})
  table.insert(data.raw["recipe"]["recipe-space-cargo-wagon"].ingredients, {"steel-plate", 40})
  table.insert(data.raw["recipe"]["recipe-space-cargo-wagon"].ingredients, {"electric-engine-unit", 5})
  table.insert(data.raw["recipe"]["recipe-space-fluid-wagon"].ingredients, {"steel-plate", 40})
  table.insert(data.raw["recipe"]["recipe-space-fluid-wagon"].ingredients, {"electric-engine-unit", 5})
  -- END UPDATE

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
    prerequisites = {"steel-processing", "advanced-electronics-2", "battery", "railway", "production-science-pack"},
    unit = {
      count = 500,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1},
                     {"production-science-pack", 1}},
      time = 60
    }
  }})
  -- Add infinite techs for increasing the braking force of the trains. (Would love to have a TechnologyModifier for top speed too, but that's not possible yet.)
  data:extend({  
    {
    type = "technology",
    name = "tech-space-trains-braking-force-1",
    icon_size = 256, icon_mipmaps = 4,
    icons = 
    {
      {
        icon = "__se-space-trains__/graphics/icons/space-trains-tech.png",
        icon_size = 256, icon_mipmaps = 4
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-braking-force.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = {100, 100}
      }
    },
    effects =
    {
      {
        type = "train-braking-force-bonus",
        modifier = 0.05
      } 
    },
    prerequisites = {"space-science-pack", "tech-space-trains"}, 
    unit =
    {
      count_formula = "2^L*1000", 
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    order = "e-k-d"
  }})
  if settings.startup["space-battery-decay-enable-setting"].value then
    table.insert(data.raw["technology"]["tech-space-trains"].effects, {
      type = "unlock-recipe",
      recipe = "space-train-battery-pack-refurbish"
    })
  end
  if mods["Krastorio2"] then -- Change the technology spot to be behind Lithium-Sulfur Batteries
    table.insert(data.raw["technology"]["tech-space-trains"].prerequisites, "advanced-electronics")
    table.insert(data.raw["technology"]["tech-space-trains"].prerequisites, "kr-lithium-sulfur-battery")
  end
end
