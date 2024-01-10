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
}, {
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
