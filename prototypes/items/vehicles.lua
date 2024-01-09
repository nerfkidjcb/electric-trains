data:extend({{
  type = "item-with-entity-data",
  name = "space-locomotive",
  icon = "__electric-trains__/graphics/icons/space-locomotive.png",
  icon_size = 64,
  subgroup = "train-transport",
  order = "a[train-system]-f[locomotive]",
  place_result = "space-locomotive",
  stack_size = 5
}, 
-- Electric Wagon Locomotive
{
  type = "item-with-entity-data",
  name = "electric-locomotive-wagon",
  icon = "__electric-trains__/graphics/icons/electric-locomotive-wagon.png",
  icon_size = 64,
  subgroup = "train-transport",
  order = "a[train-system]-f[locomotiveb]",
  place_result = "electric-locomotive-wagon",
  stack_size = 5
},
{
  type = "item-with-entity-data",
  name = "space-cargo-wagon",
  icon = "__electric-trains__/graphics/icons/space-cargo-wagon.png",
  icon_size = 64,
  icon_mipmaps = 4,
  subgroup = "train-transport",
  order = "a[train-system]-h[cargo-wagon]",
  place_result = "space-cargo-wagon",
  stack_size = 5
}, {
  type = "item-with-entity-data",
  name = "space-fluid-wagon",
  icon = "__electric-trains__/graphics/icons/space-fluid-wagon.png",
  icon_size = 64,
  icon_mipmaps = 4,
  subgroup = "train-transport",
  order = "a[train-system]-i[fluid-wagon]",
  place_result = "space-fluid-wagon",
  stack_size = 5
}})
