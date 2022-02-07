data:extend({
  {
    type = "item-with-entity-data",
    name = "item-space-locomotive",
    icon = "__se-space-trains__/graphics/icons/space-locomotive.png",
    icon_size = 64,
    subgroup = "transport",
    order = "a[train-system]-f[space-locomotive.png]",
    place_result = "space-locomotive",
    stack_size = 5,
  },
  {
    type = "item-with-entity-data",
    name = "item-space-cargo-wagon",
    icon = "__se-space-trains__/graphics/icons/space-cargo-wagon.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "train-transport",
    order = "a[train-system]-g[cargo-wagon]",
    place_result = "space-cargo-wagon",
    stack_size = 5
  },
  {
    type = "item-with-entity-data",
    name = "item-space-fluid-wagon",
    icon = "__se-space-trains__/graphics/icons/space-fluid-wagon.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "train-transport",
    order = "a[train-system]-h[fluid-wagon]",
    place_result = "space-fluid-wagon",
    stack_size = 5
  },
})
