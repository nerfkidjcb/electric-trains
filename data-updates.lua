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
  data.raw["assembling-machine"]["experimental-space-train-battery-charging-station"].energy_usage = "33MW"
  data.raw["item"]["space-train-battery-pack"].fuel_value = "100MJ"
end

if settings.startup["space-battery-decay-enable-setting"].value then
  data:extend({{
    type = "item",
    name = "space-train-destroyed-battery-pack",
    icon = "__electric-trains__/graphics/icons/destroyed-battery.png",
    icon_size = 128,
    pictures = {
      layers = {{
        size = 128,
        filename = "__electric-trains__/graphics/icons/destroyed-battery.png",
        scale = 0.125
      }, {
        draw_as_light = true,
        flags = {"light"},
        size = 128,
        filename = "__electric-trains__/graphics/icons/destroyed-battery_light.png",
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
    icon = "__electric-trains__/graphics/icons/destroyed-battery.png",
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
  data.raw["recipe"]["faster-space-train-battery-pack-recharge"].results = {{
    name = "space-train-battery-pack",
    amount = 1
  }}
end
------------------------------------------
-- Changes to recipes and technologies.
------------------------------------------

  table.insert(data.raw["recipe"]["recipe-space-locomotive"].ingredients, {"steel-plate", 40})
  table.insert(data.raw["recipe"]["recipe-space-locomotive"].ingredients, {"rocket-control-unit", 10})
  table.insert(data.raw["recipe"]["recipe-space-locomotive"].ingredients, {"electric-engine-unit", 50})
  table.insert(data.raw["recipe"]["recipe-space-cargo-wagon"].ingredients, {"steel-plate", 40})
  table.insert(data.raw["recipe"]["recipe-space-cargo-wagon"].ingredients, {"electric-engine-unit", 5})
  table.insert(data.raw["recipe"]["recipe-space-fluid-wagon"].ingredients, {"steel-plate", 40})
  table.insert(data.raw["recipe"]["recipe-space-fluid-wagon"].ingredients, {"electric-engine-unit", 5})

data:extend({ 
{
  type = "technology",
  name = "tech-space-trains",
  mod = "space-trains",
  icon = "__electric-trains__/graphics/icons/space-trains-tech.png",
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
  prerequisites = {"steel-processing", "advanced-electronics-2", "battery", "railway", "production-science-pack", "utility-science-pack", "electric-engine", "rocket-control-unit"},
  unit = {
    count = 2000,
    ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1},
                    {"production-science-pack", 1}, {"utility-science-pack", 1}},
    time = 60
  }
}})

-- Add new research for experimental chargers that unlock the experimental charging station.
data:extend({
  {
    type = "technology",
    name = "tech-space-trains-experimental-charging",
    mod = "space-trains",
    icon = "__electric-trains__/graphics/icons/experimental-space-train-charging-station.png",
    icon_size = 128,
    icon_mipmaps = 4,
    effects = {{
      type = "unlock-recipe",
      recipe = "experimental-space-train-battery-charging-station"
    }, {
      type = "unlock-recipe",
      recipe = "faster-space-train-battery-pack-recharge"
    }},
    prerequisites = {"tech-space-trains", "space-science-pack"},
    unit = {
      count = 1000000,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1},
      {"production-science-pack", 1}, {"utility-science-pack", 1}, {"space-science-pack", 1}},
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
        icon = "__electric-trains__/graphics/icons/space-trains-tech.png",
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
    prerequisites = {"space-science-pack", "tech-space-trains", "tech-space-trains-experimental-charging"}, 
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