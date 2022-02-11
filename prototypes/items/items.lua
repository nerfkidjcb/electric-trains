data:extend(
{
  {
    type = "item",
    name = "space-train-battery-charging-station",
    icon = "__se-space-trains__/graphics/icons/space-train-charging-station.png",
    icon_size = 128,
    subgroup = "production-machine",
    order = "h[train-system]",
    place_result = "space-train-battery-charging-station",
    stack_size = 10
  },
  
  {
    type = "item",
    name = "space-train-battery-pack",
    icon = "__se-space-trains__/graphics/icons/battery.png",
    icon_size = 128,
    fuel_category = "electrical",
    fuel_value = "100MJ",
    burnt_result = "space-train-discharged-battery-pack",
    subgroup = "intermediate-product",
    order = "s-a[battery-pack]",
    stack_size = 10
  },
  
  {
    type = "item",
    name = "space-train-discharged-battery-pack",
    icon = "__se-space-trains__/graphics/icons/discharged-battery.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "s-b[discharged-battery-pack]",
    stack_size = 10
  },
  
  {
    type = "item",
    name = "space-locomotive-fuel-dummy",
    icon = "__se-space-trains__/graphics/icons/lightning-bolt.png",
    icon_size = 32,
    fuel_category = "electrical",
    fuel_value = "250MJ",
    subgroup = "raw-material",
    order = "h[battery]",
    stack_size = 1
  },
  
  { -- defined to stop Factorio complaining about not having an item to place for the charging point
    type = "item",
    name = "space-locomotive-charging-dummy",
    icon = "__se-space-trains__/graphics/icons/lightning-bolt.png",
    icon_size = 32,
    subgroup = "transport",
    order = "a[train-system]-c[train-stop]-a",
    place_result = "space-locomotive-charging-dummy",
    stack_size = 10
  }
})
