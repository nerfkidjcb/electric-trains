data:extend({{
    type = "item",
    name = "space-train-battery-charging-station",
    icon = "__electric-trains__/graphics/icons/space-train-charging-station.png",
    icon_size = 128,
    subgroup = "production-machine",
    order = "h[train-system]",
    place_result = "space-train-battery-charging-station",
    stack_size = 10
}, {
    type = "item",
    name = "space-train-battery-pack",
    icon = "__electric-trains__/graphics/icons/battery.png",
    icon_size = 128,
    pictures = {
        layers = {{
            size = 128,
            filename = "__electric-trains__/graphics/icons/battery.png",
            scale = 0.125
        }, {
            draw_as_light = true,
            flags = {"light"},
            size = 128,
            filename = "__electric-trains__/graphics/icons/battery_light.png",
            scale = 0.125
        }}
    },
    fuel_category = "electrical",
    fuel_value = "50MJ",
    burnt_result = "space-train-discharged-battery-pack",
    subgroup = "intermediate-product",
    order = "s-a[battery-pack]",
    stack_size = 20
},{
    type = "item",
    name = "space-train-discharged-battery-pack",
    icon = "__electric-trains__/graphics/icons/discharged-battery.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "s-b[discharged-battery-pack]",
    stack_size = 60
}})
