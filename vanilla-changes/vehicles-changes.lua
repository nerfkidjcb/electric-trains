---------------------
-- -- Add Space Trains
---------------------
data:extend({{
  type = "recipe",
  name = "recipe-space-locomotive",
  energy_required = 60,
  enabled = false,
  ingredients = {{"locomotive", 1}, {"processing-unit", 20}},
  result = "space-locomotive"
}, -- Electric Wagon Locomotive
{
  type = "recipe",
  name = "recipe-electric-locomotive-wagon",
  energy_required = 60,
  enabled = false, 
  ingredients = {{"locomotive", 1}, {"processing-unit", 20}},
  result = "electric-locomotive-wagon"
},
{
  type = "recipe",
  name = "recipe-space-cargo-wagon",
  energy_required = 60,
  enabled = false,
  ingredients = {{"cargo-wagon", 1}, {"processing-unit", 10}},
  result = "space-cargo-wagon"
}, {
  type = "recipe",
  name = "recipe-space-fluid-wagon",
  energy_required = 60,
  enabled = false,
  ingredients = {{"fluid-wagon", 1}, {"processing-unit", 10}},
  result = "space-fluid-wagon"
}, {
  type = "recipe",
  name = "space-train-battery-charging-station",
  energy_required = 60,
  enabled = false,
  ingredients = {{"steel-plate", 15}, {"processing-unit", 5}, {"copper-cable", 20}},
  result = "space-train-battery-charging-station"
}, -- Experimental charging station
{
  type = "recipe",
  name = "experimental-space-train-battery-charging-station",
  energy_required = 120,
  enabled = false,
  ingredients = {{"steel-plate", 25}, {"processing-unit", 50}, {"copper-cable", 200}, {"space-train-battery-charging-station", 1}},
  result = "experimental-space-train-battery-charging-station"
},{
  type = "recipe",
  name = "space-train-battery-pack",
  category = "advanced-crafting",
  energy_required = 10,
  enabled = false,
  allow_as_intermediate = false,
  ingredients = {{"steel-plate", 2}, {"battery", 20}},
  localised_name = {"recipe-name.space-train-discharged-battery-pack-desc"},
  result = "space-train-discharged-battery-pack"
}, -- Speed, acceleration and efficiency battery-packs
{
  type = "recipe",
  name = "speed-battery-pack",
  category = "advanced-crafting",
  energy_required = 20,
  enabled = false,
  allow_as_intermediate = false,
  ingredients = {{"steel-plate", 2}, {"battery", 20}, {"speed-module-3", 1}},
  result = "discharged-speed-battery-pack"
},{
  type = "recipe",
  name = "acceleration-battery-pack",
  category = "advanced-crafting",
  energy_required = 20,
  enabled = false,
  allow_as_intermediate = false,
  ingredients = {{"steel-plate", 2}, {"battery", 20}, {"productivity-module-3", 1}},
  result = "discharged-acceleration-battery-pack"
},{
  type = "recipe",
  name = "efficiency-battery-pack",
  category = "advanced-crafting",
  energy_required = 20,
  enabled = false,
  allow_as_intermediate = false,
  ingredients = {{"steel-plate", 2}, {"battery", 20}, {"effectivity-module-3", 1}},
  result = "discharged-efficiency-battery-pack"
}, -- Charging speed, acceleration and efficiency battery-packs

{
  type = "recipe",
  name = "speed-battery-pack-recharge",
  category = "faster-electrical",
  hidden = false,
  hide_from_player_crafting = true,
  energy_required = 60,
  enabled = false,
  icon = "__electric-trains__/graphics/icons/speed-battery/fast-speed-battery.png",
  icon_size = 128,
  subgroup = "intermediate-product",
  allow_as_intermediate = false,
  ingredients = {{"discharged-speed-battery-pack", 1}},
  results = {{
    name = "destroyed-speed-battery-pack",
    probability = 0.05,
    amount = 1
  }, {
    name = "speed-battery-pack",
    probability = 0.95,
    amount = 1
  }}
},{
  type = "recipe",
  name = "acceleration-battery-pack-recharge",
  category = "faster-electrical",
  hidden = false,
  hide_from_player_crafting = true,
  energy_required = 60,
  enabled = false,
  icon = "__electric-trains__/graphics/icons/acceleration-battery/fast-acceleration-battery.png",
  icon_size = 128,
  subgroup = "intermediate-product",
  allow_as_intermediate = false,
  ingredients = {{"discharged-acceleration-battery-pack", 1}},
  results = {{
    name = "destroyed-acceleration-battery-pack",
    probability = 0.05,
    amount = 1
  }, {
    name = "acceleration-battery-pack",
    probability = 0.95,
    amount = 1
  }}
},{
  type = "recipe",
  name = "efficiency-battery-pack-recharge",
  category = "faster-electrical",
  hidden = false,
  hide_from_player_crafting = true,
  energy_required = 60,
  enabled = false,
  icon = "__electric-trains__/graphics/icons/efficiency-battery/fast-efficiency-battery.png",
  icon_size = 128,
  subgroup = "intermediate-product",
  allow_as_intermediate = false,
  ingredients = {{"discharged-efficiency-battery-pack", 1}},
  results = {{
    name = "destroyed-efficiency-battery-pack",
    probability = 0.05,
    amount = 1
  }, {
    name = "efficiency-battery-pack",
    probability = 0.95,
    amount = 1
  }}
}, 
{
  type = "recipe",
  name = "space-train-battery-pack-recharge",
  category = "electrical",
  hidden = false,
  hide_from_player_crafting = true,
  energy_required = 60,
  enabled = false,
  icon = "__electric-trains__/graphics/icons/battery.png",
  icon_size = 128,
  subgroup = "intermediate-product",
  allow_as_intermediate = false,
  ingredients = {{"space-train-discharged-battery-pack", 1}},
  results = {{
    name = "space-train-destroyed-battery-pack",
    probability = 0.01,
    amount = 1
  }, {
    name = "space-train-battery-pack",
    probability = 0.99,
    amount = 1
  }}

},
{
  -- Faster space train battery park recharge
  type = "recipe",
  name = "faster-space-train-battery-pack-recharge",
  category = "faster-electrical",
  hidden = false,
  hide_from_player_crafting = true,
  energy_required = 20,
  enabled = false,
  icon = "__electric-trains__/graphics/icons/fast-battery.png",
  icon_size = 128,
  subgroup = "intermediate-product",
  allow_as_intermediate = false,
  ingredients = {{"space-train-discharged-battery-pack", 1}},
  results = {{
    name = "space-train-destroyed-battery-pack",
    probability = 0.15,
    amount = 1
  }, {
    name = "space-train-battery-pack",
    probability = 0.85,
    amount = 1
  }}
}})
