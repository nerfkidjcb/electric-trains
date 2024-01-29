---------------------
-- -- Add Space Trains
---------------------
data:extend({{
  type = "recipe",
  name = "recipe-electric-locomotive",
  energy_required = 60,
  enabled = false,
  ingredients = {{"locomotive", 1}, {"processing-unit", 20}},
  result = "electric-locomotive",
  order = "a[train-system]-f[locomotive]"
}, -- Electric Wagon Locomotive
{
  type = "recipe",
  name = "recipe-electric-locomotive-wagon",
  energy_required = 60,
  enabled = false, 
  ingredients = {{"locomotive", 1}, {"processing-unit", 20}},
  result = "electric-locomotive-wagon",
  order = "a[train-system]-f[locomotiveb]"
},
{
  type = "recipe",
  name = "recipe-electric-cargo-wagon",
  energy_required = 60,
  enabled = false,
  ingredients = {{"cargo-wagon", 1}, {"processing-unit", 10}},
  result = "electric-cargo-wagon",
  order = "a[train-system]-h[cargo-wagon]"
}, {
  type = "recipe",
  name = "recipe-electric-fluid-wagon",
  energy_required = 60,
  enabled = false,
  ingredients = {{"fluid-wagon", 1}, {"processing-unit", 10}},
  result = "electric-fluid-wagon",
  order = "a[train-system]-h[fluid-wagon]"
}, {
  type = "recipe",
  name = "electric-train-battery-charging-station",
  energy_required = 60,
  enabled = false,
  ingredients = {{"steel-plate", 15}, {"processing-unit", 5}, {"copper-cable", 20}},
  result = "electric-train-battery-charging-station"
}, -- Experimental charging station
{
  type = "recipe",
  name = "experimental-electric-train-battery-charging-station",
  energy_required = 120,
  enabled = false,
  ingredients = {{"steel-plate", 25}, {"processing-unit", 50}, {"copper-cable", 200}, {"electric-train-battery-charging-station", 1}},
  result = "experimental-electric-train-battery-charging-station"
},{
  type = "recipe",
  name = "electric-train-battery-pack",
  category = "advanced-crafting",
  energy_required = 10,
  enabled = false,
  allow_as_intermediate = false,
  ingredients = {{"steel-plate", 2}, {"battery", 20}},
  localised_name = {"recipe-name.electric-train-discharged-battery-pack-desc"},
  result = "electric-train-discharged-battery-pack",
  order = "s-[battery-pack-a]"
},{
  type = "recipe",
  name = "recipe-electric-train-alkaline-battery-pack",
  category = "advanced-crafting",
  energy_required = 10,
  enabled = false,
  allow_as_intermediate = false,
  ingredients = {{"steel-plate", 2}, {"battery", 5}},
  localised_name = {"recipe-name.electric-train-alkaline-battery-pack-desc"},
  result = "electric-train-alkaline-battery-pack",
  order = "s-[battery-pack-a]"

}, -- Speed, acceleration and efficiency battery-packs
{
  type = "recipe",
  name = "speed-battery-pack",
  category = "advanced-crafting",
  energy_required = 20,
  enabled = false,
  allow_as_intermediate = false,
  ingredients = {{"steel-plate", 2}, {"battery", 20}, {"electric-train-discharged-battery-pack", 1}, {"speed-module-3", 1}},
  localised_name = {"recipe-name.discharged-speed-battery-pack-desc"},
  result = "discharged-speed-battery-pack",
  order = "s-[battery-pack-d]"
},{
  type = "recipe",
  name = "acceleration-battery-pack",
  category = "advanced-crafting",
  energy_required = 20,
  enabled = false,
  allow_as_intermediate = false,
  ingredients = {{"steel-plate", 2}, {"battery", 20}, {"electric-train-discharged-battery-pack", 1}, {"productivity-module-3", 1}},
  localised_name = {"recipe-name.discharged-acceleration-battery-pack-desc"},
  result = "discharged-acceleration-battery-pack",
  order = "s-[battery-pack-b]"
},{
  type = "recipe",
  name = "efficiency-battery-pack",
  category = "advanced-crafting",
  energy_required = 20,
  enabled = false,
  allow_as_intermediate = false,
  ingredients = {{"steel-plate", 2}, {"battery", 20}, {"electric-train-discharged-battery-pack", 1}, {"effectivity-module-3", 1}},
  localised_name = {"recipe-name.discharged-efficiency-battery-pack-desc"},
  result = "discharged-efficiency-battery-pack",
  order = "s-[battery-pack-c]"
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
  order = "d",
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
  order = "b",
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
  order = "c",
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
  name = "electric-train-battery-pack-recharge",
  category = "electrical",
  hidden = false,
  hide_from_player_crafting = true,
  energy_required = 60,
  enabled = false,
  icon = "__electric-trains__/graphics/icons/battery.png",
  icon_size = 128,
  subgroup = "intermediate-product",
  allow_as_intermediate = false,
  ingredients = {{"electric-train-discharged-battery-pack", 1}},
  results = {{
    name = "electric-train-destroyed-battery-pack",
    probability = 0.01,
    amount = 1
  }, {
    name = "electric-train-battery-pack",
    probability = 0.99,
    amount = 1
  }}

},
{
  -- Faster space train battery park recharge
  type = "recipe",
  name = "faster-electric-train-battery-pack-recharge",
  category = "faster-electrical",
  hidden = false,
  hide_from_player_crafting = true,
  energy_required = 20,
  enabled = false,
  icon = "__electric-trains__/graphics/icons/fast-battery.png",
  icon_size = 128,
  subgroup = "intermediate-product",
  allow_as_intermediate = false,
  ingredients = {{"electric-train-discharged-battery-pack", 1}},
  order = "a",
  results = {{
    name = "electric-train-destroyed-battery-pack",
    probability = 0.15,
    amount = 1
  }, {
    name = "electric-train-battery-pack",
    probability = 0.85,
    amount = 1
  }}
}})
