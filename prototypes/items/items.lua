data:extend({{
    type = "item",
    name = "space-train-battery-charging-station",
    icon = "__electric-trains__/graphics/icons/space-train-charging-station.png",
    icon_size = 128,
    subgroup = "production-machine",
    order = "h[train-system]",
    place_result = "space-train-battery-charging-station",
    stack_size = 10
}, -- Experimental charging station
{
    type = "item",
    name = "experimental-space-train-battery-charging-station",
    icon = "__electric-trains__/graphics/icons/experimental-space-train-charging-station.png",
    icon_size = 128,
    subgroup = "production-machine",
    order = "i[train-system]",
    place_result = "experimental-space-train-battery-charging-station",
    stack_size = 10
},
{
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
    fuel_value = "40MJ",
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
    order = "s-a[discharged-battery-pack]",
    stack_size = 60
}, -- Speed, acceleration and efficiency battery-packs
{
    type = "item",
    name = "speed-battery-pack",
    icon = "__electric-trains__/graphics/icons/speed-battery/speed-battery.png",
    icon_size = 128,
    pictures = {
        layers = {{
            size = 128,
            filename = "__electric-trains__/graphics/icons/speed-battery/speed-battery.png",
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
    fuel_value = "32MJ",
    fuel_top_speed_multiplier = 1.5,
    fuel_acceleration_multiplier = 0.8,
    burnt_result = "discharged-speed-battery-pack",
    subgroup = "intermediate-product",
    order = "s-d[battery-pack]",
    stack_size = 20

},{
    type = "item",
    name = "discharged-speed-battery-pack",
    icon = "__electric-trains__/graphics/icons/speed-battery/discharged-speed-battery.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "s-d[discharged-battery-pack]",
    stack_size = 20
},{
    type = "item",
    name = "acceleration-battery-pack",
    icon = "__electric-trains__/graphics/icons/acceleration-battery/acceleration-battery.png",
    icon_size = 128,
    pictures = {
        layers = {{
            size = 128,
            filename = "__electric-trains__/graphics/icons/acceleration-battery/acceleration-battery.png",
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
    fuel_value = "32MJ",
    fuel_top_speed_multiplier = 0.8,
    fuel_acceleration_multiplier = 1.5,
    burnt_result = "discharged-acceleration-battery-pack",
    subgroup = "intermediate-product",
    order = "s-b[battery-pack]",
    stack_size = 20
}, {
    type = "item",
    name = "discharged-acceleration-battery-pack",
    icon = "__electric-trains__/graphics/icons/acceleration-battery/discharged-acceleration-battery.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "s-b[discharged-battery-pack]",
    stack_size = 20
}, {
    type = "item",
    name = "efficiency-battery-pack",
    icon = "__electric-trains__/graphics/icons/efficiency-battery/efficiency-battery.png",
    icon_size = 128,
    pictures = {
        layers = {{
            size = 128,
            filename = "__electric-trains__/graphics/icons/efficiency-battery/efficiency-battery.png",
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
    fuel_value = "120MJ",
    burnt_result = "discharged-efficiency-battery-pack",
    subgroup = "intermediate-product",
    order = "s-c[battery-pack]",
    stack_size = 20
}, {
    type = "item",
    name = "discharged-efficiency-battery-pack",
    icon = "__electric-trains__/graphics/icons/efficiency-battery/discharged-efficiency-battery.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "s-c[discharged-battery-pack]",
    stack_size = 20
},
})
