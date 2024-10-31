------------------------------------------
-- Startup Settings handling happens here.
------------------------------------------
if settings.startup["electric-locomotive-speed-setting"].value ==
    "238 km/h (Vanilla)" then
    data.raw["locomotive"]["electric-locomotive"].max_speed = 1.1
    data.raw["cargo-wagon"]["electric-cargo-wagon"].max_speed = 1.1
    data.raw["fluid-wagon"]["electric-fluid-wagon"].max_speed = 1.1
elseif settings.startup["electric-locomotive-speed-setting"].value == "378 km/h" then
    data.raw["locomotive"]["electric-locomotive"].max_speed = 1.75
    data.raw["cargo-wagon"]["electric-cargo-wagon"].max_speed = 1.75
    data.raw["fluid-wagon"]["electric-fluid-wagon"].max_speed = 1.75
elseif settings.startup["electric-locomotive-speed-setting"].value ==
    "714 km/h (Extended)" then
    data.raw["locomotive"]["electric-locomotive"].max_speed = 3.3
    data.raw["cargo-wagon"]["electric-cargo-wagon"].max_speed = 3.3
    data.raw["fluid-wagon"]["electric-fluid-wagon"].max_speed = 3.3
end

if settings.startup["electric-cargo-wagon-capacity-setting"].value ==
    "40 Slots (Vanilla)" then
    data.raw["cargo-wagon"]["electric-cargo-wagon"].inventory_size = 40
elseif settings.startup["electric-cargo-wagon-capacity-setting"].value ==
    "120 Slots (Extended)" then
    data.raw["cargo-wagon"]["electric-cargo-wagon"].inventory_size = 120
end

if settings.startup["electric-fluid-wagon-capacity-setting"].value ==
    "50.000 (Vanilla)" then
    data.raw["fluid-wagon"]["electric-fluid-wagon"].capacity = 50000
elseif settings.startup["electric-fluid-wagon-capacity-setting"].value ==
    "150.000 (Extended)" then
    data.raw["fluid-wagon"]["electric-fluid-wagon"].capacity = 150000
end

if settings.startup["train-battery-pack-energy-density-setting"].value ==
    "80 MJ" then
    data.raw["assembling-machine"]["electric-train-battery-charging-station"]
        .energy_usage = "3.3MW"
    data.raw["assembling-machine"]["experimental-electric-train-battery-charging-station"]
        .energy_usage = "33MW"
    data.raw["assembling-machine"]["experimental-electric-train-battery-charging-station"]
        .max_power = "33MW"
    data.raw["item"]["electric-train-battery-pack"].fuel_value = "80MJ"
    -- Update the other battery packs too.
    data.raw["item"]["speed-battery-pack"].fuel_value = "64MJ"
    data.raw["item"]["acceleration-battery-pack"].fuel_value = "64MJ"
    data.raw["item"]["efficiency-battery-pack"].fuel_value = "480MJ"
    data.raw["item"]["electric-train-alkaline-battery-pack"].fuel_value =
        "240MJ"
end

if settings.startup["train-battery-decay-enable-setting"].value == "true" then
    data:extend({
        {
            type = "item",
            name = "electric-train-destroyed-battery-pack",
            icon = "__electric-trains__/graphics/icons/destroyed-battery.png",
            icon_size = 128,
            pictures = {
                layers = {
                    {
                        size = 128,
                        filename = "__electric-trains__/graphics/icons/destroyed-battery.png",
                        scale = 0.25
                    }, {
                        draw_as_light = true,
                        flags = {"light"},
                        size = 128,
                        filename = "__electric-trains__/graphics/icons/destroyed-battery_light.png",
                        scale = 0.25
                    }
                }
            },
            burnt_result = "electric-train-discharged-battery-pack",
            subgroup = "intermediate-product",
            order = "s-a[destroyed-battery-pack]",
            stack_size = 20,
            inventory_move_sound = item_sounds.electric_small_inventory_move,
            pick_sound = item_sounds.electric_small_inventory_pickup,
            drop_sound = item_sounds.electric_small_inventory_move
        }, -- Destroyed speed, acceleration and efficiency battery-packs
        {
            type = "item",
            name = "destroyed-speed-battery-pack",
            icon = "__electric-trains__/graphics/icons/speed-battery/destroyed-speed-battery.png",
            icon_size = 128,
            pictures = {
                layers = {
                    {
                        size = 128,
                        filename = "__electric-trains__/graphics/icons/speed-battery/destroyed-speed-battery.png",
                        scale = 0.25
                    }, {
                        draw_as_light = true,
                        flags = {"light"},
                        size = 128,
                        filename = "__electric-trains__/graphics/icons/destroyed-battery_light.png",
                        scale = 0.25
                    }
                }
            },
            burnt_result = "discharged-speed-battery-pack",
            subgroup = "intermediate-product",
            order = "s-d[destroyed-battery-pack]",
            stack_size = 20,
            inventory_move_sound = item_sounds.electric_small_inventory_move,
            pick_sound = item_sounds.electric_small_inventory_pickup,
            drop_sound = item_sounds.electric_small_inventory_move
        }, {
            type = "item",
            name = "destroyed-acceleration-battery-pack",
            icon = "__electric-trains__/graphics/icons/acceleration-battery/destroyed-acceleration-battery.png",
            icon_size = 128,
            pictures = {
                layers = {
                    {
                        size = 128,
                        filename = "__electric-trains__/graphics/icons/acceleration-battery/destroyed-acceleration-battery.png",
                        scale = 0.25
                    }, {
                        draw_as_light = true,
                        flags = {"light"},
                        size = 128,
                        filename = "__electric-trains__/graphics/icons/destroyed-battery_light.png",
                        scale = 0.25
                    }
                }
            },
            burnt_result = "discharged-acceleration-battery-pack",
            subgroup = "intermediate-product",
            order = "s-b[destroyed-battery-pack]",
            stack_size = 20,
            inventory_move_sound = item_sounds.electric_small_inventory_move,
            pick_sound = item_sounds.electric_small_inventory_pickup,
            drop_sound = item_sounds.electric_small_inventory_move
        }, {
            type = "item",
            name = "destroyed-efficiency-battery-pack",
            icon = "__electric-trains__/graphics/icons/efficiency-battery/destroyed-efficiency-battery.png",
            icon_size = 128,
            pictures = {
                layers = {
                    {
                        size = 128,
                        filename = "__electric-trains__/graphics/icons/efficiency-battery/destroyed-efficiency-battery.png",
                        scale = 0.25
                    }, {
                        draw_as_light = true,
                        flags = {"light"},
                        size = 128,
                        filename = "__electric-trains__/graphics/icons/destroyed-battery_light.png",
                        scale = 0.25
                    }
                }
            },
            burnt_result = "discharged-efficiency-battery-pack",
            subgroup = "intermediate-product",
            order = "s-c[destroyed-battery-pack]",
            stack_size = 20,
            inventory_move_sound = item_sounds.electric_small_inventory_move,
            pick_sound = item_sounds.electric_small_inventory_pickup,
            drop_sound = item_sounds.electric_small_inventory_move
        }, -- Refurb for speed, acceleration and efficiency battery-packs
        {
            type = "recipe",
            name = "speed-battery-pack-refurbish",
            energy_required = 120,
            enabled = false,
            category = "chemistry",
            ingredients = {
                {
                    type = "item",
                    name = "destroyed-speed-battery-pack",
                    amount = 1
                }, {type = "item", name = "battery", amount = 10},
                {type = "fluid", name = "sulfuric-acid", amount = 200}
            },
            icon = "__electric-trains__/graphics/icons/speed-battery/destroyed-speed-battery.png",
            icon_size = 128,
            allow_as_intermediate = false,
            localised_name = {"recipe-name.speed-battery-pack-refurbish-desc"},
            order = "s-[battery-refurbish-d]",
            results = {
                {
                    type = "item",
                    name = "discharged-speed-battery-pack",
                    amount = 1
                }
            }
        }, {
            type = "recipe",
            name = "acceleration-battery-pack-refurbish",
            energy_required = 120,
            enabled = false,
            category = "chemistry",
            ingredients = {
                {
                    type = "item",
                    name = "destroyed-acceleration-battery-pack",
                    amount = 1
                }, {type = "item", name = "battery", amount = 10},
                {type = "fluid", name = "sulfuric-acid", amount = 200}
            },
            icon = "__electric-trains__/graphics/icons/acceleration-battery/destroyed-acceleration-battery.png",
            icon_size = 128,
            allow_as_intermediate = false,
            localised_name = {
                "recipe-name.acceleration-battery-pack-refurbish-desc"
            },
            order = "s-[battery-refurbish-b]",
            results = {
                {
                    type = "item",
                    name = "discharged-acceleration-battery-pack",
                    amount = 1
                }
            }
        }, {
            type = "recipe",
            name = "efficiency-battery-pack-refurbish",
            energy_required = 120,
            enabled = false,
            category = "chemistry",
            ingredients = {
                {
                    type = "item",
                    name = "destroyed-efficiency-battery-pack",
                    amount = 1
                }, {type = "item", name = "battery", amount = 10},
                {type = "fluid", name = "sulfuric-acid", amount = 200}
            },
            icon = "__electric-trains__/graphics/icons/efficiency-battery/destroyed-efficiency-battery.png",
            icon_size = 128,
            allow_as_intermediate = false,
            localised_name = {
                "recipe-name.efficiency-battery-pack-refurbish-desc"
            },
            order = "s-[battery-refurbish-c]",
            results = {
                {
                    type = "item",
                    name = "discharged-efficiency-battery-pack",
                    amount = 1
                }
            }
        }, {
            type = "recipe",
            name = "electric-train-battery-pack-refurbish",
            energy_required = 60,
            enabled = false,
            category = "chemistry",
            ingredients = {
                {
                    type = "item",
                    name = "electric-train-destroyed-battery-pack",
                    amount = 1
                }, {type = "item", name = "battery", amount = 5},
                {type = "fluid", name = "sulfuric-acid", amount = 20}
            },
            icon = "__electric-trains__/graphics/icons/destroyed-battery.png",
            icon_size = 128,
            allow_as_intermediate = false,
            localised_name = {
                "recipe-name.electric-train-battery-pack-refurbish-desc"
            },
            order = "s-[battery-refurbish-a]",
            results = {
                {
                    type = "item",
                    name = "electric-train-discharged-battery-pack",
                    amount = 1
                }
            }
        } -- Speed, acceleration and efficiency battery-pack ref

    })
else
    data.raw["recipe"]["electric-train-battery-pack-recharge"].results = {
        {type = "item", name = "electric-train-battery-pack", amount = 1}
    }
    data.raw["recipe"]["faster-electric-train-battery-pack-recharge"].results =
        {{type = "item", name = "electric-train-battery-pack", amount = 1}}
    -- Same for faster speed, acceleration and efficiency battery-packs
    data.raw["recipe"]["speed-battery-pack-recharge"].results = {
        {type = "item", name = "speed-battery-pack", amount = 1}
    }

    data.raw["recipe"]["acceleration-battery-pack-recharge"].results = {
        {type = "item", name = "acceleration-battery-pack", amount = 1}
    }
    data.raw["recipe"]["efficiency-battery-pack-recharge"].results = {
        {type = "item", name = "efficiency-battery-pack", amount = 1}
    }
end
------------------------------------------
-- Changes to recipes and technologies.
------------------------------------------

-- Electric Locomotive
table.insert(data.raw["recipe"]["recipe-electric-locomotive"].ingredients,
             {type = "item", name = "steel-plate", amount = 40})
table.insert(data.raw["recipe"]["recipe-electric-locomotive"].ingredients,
             {type = "item", name = "electric-engine-unit", amount = 50})

-- Electric Locomotive Wagon
table.insert(data.raw["recipe"]["recipe-electric-locomotive-wagon"].ingredients,
             {type = "item", name = "steel-plate", amount = 40})
table.insert(data.raw["recipe"]["recipe-electric-locomotive-wagon"].ingredients,
             {type = "item", name = "electric-engine-unit", amount = 50})

-- Electric Cargo Wagon
table.insert(data.raw["recipe"]["recipe-electric-cargo-wagon"].ingredients,
             {type = "item", name = "steel-plate", amount = 40})
table.insert(data.raw["recipe"]["recipe-electric-cargo-wagon"].ingredients,
             {type = "item", name = "electric-engine-unit", amount = 5})

-- Electric Fluid Wagon
table.insert(data.raw["recipe"]["recipe-electric-fluid-wagon"].ingredients,
             {type = "item", name = "steel-plate", amount = 40})
table.insert(data.raw["recipe"]["recipe-electric-fluid-wagon"].ingredients,
             {type = "item", name = "electric-engine-unit", amount = 5})

data:extend({
    {
        type = "technology",
        name = "tech-electric-trains",
        mod = "electric-trains",
        icon = "__electric-trains__/graphics/icons/space-trains-tech.png",
        icon_size = 256,
        icon_mipmaps = 4,
        effects = {
            {type = "unlock-recipe", recipe = "recipe-electric-locomotive"},
            {type = "unlock-recipe", recipe = "recipe-electric-fluid-wagon"},
            {type = "unlock-recipe", recipe = "recipe-electric-cargo-wagon"},
            {
                type = "unlock-recipe",
                recipe = "electric-train-battery-charging-station"
            }, {type = "unlock-recipe", recipe = "electric-train-battery-pack"},
            {
                type = "unlock-recipe",
                recipe = "electric-train-battery-pack-recharge"
            }
        },
        prerequisites = {
            "steel-processing", "processing-unit", "battery", "railway",
            "production-science-pack", "utility-science-pack", "electric-engine"
        },
        unit = {
            count = 2000,
            ingredients = {
                {"automation-science-pack", 1}, {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}, {"production-science-pack", 1},
                {"utility-science-pack", 1}
            },
            time = 60
        }
    }
})

-- New research for alkaline battery packs.
data:extend({
    {
        type = "technology",
        name = "tech-alkaline-battery-pack",
        mod = "electric-trains",
        icon = "__electric-trains__/graphics/icons/alkaline-battery.png",
        icon_size = 128,
        icon_mipmaps = 4,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "recipe-electric-train-alkaline-battery-pack"
            }
        },
        prerequisites = {"tech-electric-trains"},
        unit = {
            count = 2000,
            ingredients = {
                {"automation-science-pack", 1}, {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}, {"production-science-pack", 1},
                {"utility-science-pack", 1}
            },
            time = 60
        }
    }
})
-- Add new research for experimental chargers that unlock the experimental charging station.
data:extend({
    {
        type = "technology",
        name = "tech-electric-trains-experimental-charging",
        mod = "electric-trains",
        icon = "__electric-trains__/graphics/icons/experimental-electric-train-charging-station.png",
        icon_size = 128,
        icon_mipmaps = 4,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "experimental-electric-train-battery-charging-station"
            }, {
                type = "unlock-recipe",
                recipe = "faster-electric-train-battery-pack-recharge"
            }
        },
        prerequisites = {
            "tech-electric-trains", "tech-electric-locomotive-wagon"
        },
        unit = {
            count = 20000,
            ingredients = {
                {"automation-science-pack", 1}, {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}, {"production-science-pack", 1},
                {"utility-science-pack", 1}
            },
            time = 60
        }
    }
})

-- Add infinite techs for increasing the braking force of the trains. (Would love to have a TechnologyModifier for top speed too, but that's not possible yet.)
data:extend({
    {
        type = "technology",
        name = "tech-electric-trains-braking-force-1",
        icon_size = 256,
        icon_mipmaps = 4,
        icons = {
            {
                icon = "__electric-trains__/graphics/icons/space-trains-tech.png",
                icon_size = 256,
                icon_mipmaps = 4
            }, {
                icon = "__core__/graphics/icons/technology/constants/constant-braking-force.png",
                icon_size = 128,
                icon_mipmaps = 3,
                shift = {100, 100}
            }
        },
        effects = {{type = "train-braking-force-bonus", modifier = 0.05}},
        prerequisites = {
            "space-science-pack", "tech-electric-trains",
            "tech-electric-trains-experimental-charging"
        },
        unit = {
            count_formula = "2^L*1000",
            ingredients = {
                {"automation-science-pack", 1}, {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}, {"production-science-pack", 1},
                {"utility-science-pack", 1}, {"space-science-pack", 1}
            },
            time = 60
        },
        max_level = "infinite",
        order = "e-k-d"
    }
})

-- Electric Wagon Locomotive
data:extend({
    {
        type = "technology",
        name = "tech-electric-locomotive-wagon",
        icon = "__electric-trains__/graphics/icons/electric-locomotive-wagon.png",
        icon_size = 64,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "recipe-electric-locomotive-wagon"
            }
        },
        prerequisites = {"tech-electric-trains"},
        unit = {
            count = 2000,
            ingredients = {
                {"automation-science-pack", 1}, {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}, {"production-science-pack", 1},
                {"utility-science-pack", 1}
            },
            time = 60
        }
    }
})

-- Speed battery packs
data:extend({
    {
        type = "technology",
        name = "tech-speed-battery-pack",
        icon = "__electric-trains__/graphics/icons/speed-battery/speed-battery.png",
        icon_size = 128,
        icon_mipmaps = 4,
        effects = {
            {type = "unlock-recipe", recipe = "speed-battery-pack"},
            {type = "unlock-recipe", recipe = "speed-battery-pack-recharge"}
        },
        prerequisites = {
            "tech-electric-trains",
            "tech-electric-trains-experimental-charging", "speed-module-3"
        },
        unit = {
            count = 40000,
            ingredients = {
                {"automation-science-pack", 1}, {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}, {"production-science-pack", 1},
                {"utility-science-pack", 1}
            },
            time = 60
        }
    }
})

-- Acceleration battery packs
data:extend({
    {
        type = "technology",
        name = "tech-acceleration-battery-pack",
        icon = "__electric-trains__/graphics/icons/acceleration-battery/acceleration-battery.png",
        icon_size = 128,
        icon_mipmaps = 4,
        effects = {
            {type = "unlock-recipe", recipe = "acceleration-battery-pack"},
            {
                type = "unlock-recipe",
                recipe = "acceleration-battery-pack-recharge"
            }
        },
        prerequisites = {
            "tech-electric-trains",
            "tech-electric-trains-experimental-charging",
            "productivity-module-3"
        },
        unit = {
            count = 40000,
            ingredients = {
                {"automation-science-pack", 1}, {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}, {"production-science-pack", 1},
                {"utility-science-pack", 1}
            },
            time = 60
        }
    }
})

-- Efficiency battery packs
data:extend({
    {
        type = "technology",
        name = "tech-efficiency-battery-pack",
        icon = "__electric-trains__/graphics/icons/efficiency-battery/efficiency-battery.png",
        icon_size = 128,
        icon_mipmaps = 4,
        effects = {
            {type = "unlock-recipe", recipe = "efficiency-battery-pack"},
            {
                type = "unlock-recipe",
                recipe = "efficiency-battery-pack-recharge"
            }
        },
        prerequisites = {
            "tech-electric-trains",
            "tech-electric-trains-experimental-charging", "efficiency-module-3"
        },
        unit = {
            count = 40000,
            ingredients = {
                {"automation-science-pack", 1}, {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}, {"production-science-pack", 1},
                {"utility-science-pack", 1}
            },
            time = 60
        }
    }
})

if settings.startup["train-battery-decay-enable-setting"].value == "true" then
    table.insert(data.raw["technology"]["tech-electric-trains"].effects, {
        type = "unlock-recipe",
        recipe = "electric-train-battery-pack-refurbish"
    })
    table.insert(data.raw["technology"]["tech-speed-battery-pack"].effects, {
        type = "unlock-recipe",
        recipe = "speed-battery-pack-refurbish"
    })
    table.insert(data.raw["technology"]["tech-acceleration-battery-pack"]
                     .effects, {
        type = "unlock-recipe",
        recipe = "acceleration-battery-pack-refurbish"
    })
    table.insert(data.raw["technology"]["tech-efficiency-battery-pack"].effects,
                 {
        type = "unlock-recipe",
        recipe = "efficiency-battery-pack-refurbish"
    })
end

-- If the Space Exploration mod is installed, make compatibility changes.
if mods["space-exploration"] or
    (mods["space-age"] and settings.startup["lock-behind-fulgora"].value ==
        "false") then
    -- Update the tech-electric-trains technology.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-electric-trains"].unit.ingredients = {}
    data.raw["technology"]["tech-electric-trains"].unit.ingredients = {
        {"automation-science-pack", 1}, {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
    }
    data.raw["technology"]["tech-electric-trains"].unit.count = 2000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-electric-trains"].prerequisites = {}
    -- Add the new science prerequisites.
    if mods["space-age"] then
        local one_gravity_condition = {{property = "gravity", min = 1}}
        data.raw["locomotive"]["electric-locomotive"].surface_conditions =
            one_gravity_condition
        data.raw["locomotive"]["electric-locomotive-wagon"].surface_conditions =
            one_gravity_condition
        data.raw["cargo-wagon"]["electric-cargo-wagon"].surface_conditions =
            one_gravity_condition
        data.raw["fluid-wagon"]["electric-fluid-wagon"].surface_conditions =
            one_gravity_condition
        --------------------------- Add weights and default import planets --------------------------- --
        data.raw["item-with-entity-data"]["electric-locomotive"]
            .default_import_location = "fulgora"
        data.raw["item-with-entity-data"]["electric-locomotive"].weight = 1000 *
                                                                              kg
        data.raw["item-with-entity-data"]["electric-locomotive-wagon"]
            .default_import_location = "fulgora"
        data.raw["item-with-entity-data"]["electric-locomotive-wagon"].weight =
            1000 * kg
        data.raw["item-with-entity-data"]["electric-cargo-wagon"]
            .default_import_location = "fulgora"
        data.raw["item-with-entity-data"]["electric-cargo-wagon"].weight =
            1000 * kg
        data.raw["item-with-entity-data"]["electric-fluid-wagon"]
            .default_import_location = "fulgora"
        data.raw["item-with-entity-data"]["electric-fluid-wagon"].weight =
            1000 * kg
        data.raw["item"]["electric-train-battery-charging-station"]
            .default_import_location = "fulgora"
        data.raw["item"]["electric-train-battery-charging-station"].weight =
            100 * kg
        data.raw["item"]["electric-train-battery-pack"].default_import_location =
            "fulgora"
        data.raw["item"]["electric-train-battery-pack"].weight = 10 * kg
        data.raw["item"]["electric-train-discharged-battery-pack"].weight = 10 *
                                                                                kg
        if settings.startup["train-battery-decay-enable-setting"].value then
            data.raw["item"]["electric-train-destroyed-battery-pack"].weight =
                10 * kg
        end

        data.raw["technology"]["tech-electric-trains"].prerequisites = {
            "logistic-science-pack", "chemical-science-pack", "electric-engine"
        }
    else
        data.raw["technology"]["tech-electric-trains"].prerequisites = {
            "logistic-science-pack", "chemical-science-pack", "electric-engine"
        }
    end

    -- Update alkaline battery pack tech.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-alkaline-battery-pack"].unit.ingredients = {}
    data.raw["technology"]["tech-alkaline-battery-pack"].unit.ingredients = {
        {"automation-science-pack", 1}, {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
    }
    data.raw["technology"]["tech-alkaline-battery-pack"].unit.count = 2000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-alkaline-battery-pack"].prerequisites = {}
    -- Add the new science prerequisites.
    data.raw["technology"]["tech-alkaline-battery-pack"].prerequisites = {
        "logistic-science-pack", "chemical-science-pack", "tech-electric-trains"
    }

    -- Update the tech-electric-trains-experimental-charging technology.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-electric-trains-experimental-charging"].unit
        .ingredients = {}
    data.raw["technology"]["tech-electric-trains-experimental-charging"].unit
        .ingredients = {
        {"automation-science-pack", 1}, {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
    }
    data.raw["technology"]["tech-electric-trains-experimental-charging"].unit
        .count = 2000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-electric-trains-experimental-charging"]
        .prerequisites = {}
    -- Add the new science prerequisites.
    data.raw["technology"]["tech-electric-trains-experimental-charging"]
        .prerequisites = {
        "logistic-science-pack", "chemical-science-pack", "tech-electric-trains"
    }

    -- Update the tech-electric-locomotive-wagon technology.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-electric-locomotive-wagon"].unit.ingredients =
        {}
    data.raw["technology"]["tech-electric-locomotive-wagon"].unit.ingredients =
        {
            {"automation-science-pack", 1}, {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}
        }
    data.raw["technology"]["tech-electric-locomotive-wagon"].unit.count = 2000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-electric-locomotive-wagon"].prerequisites = {}
    -- Add the new science prerequisites.
    data.raw["technology"]["tech-electric-locomotive-wagon"].prerequisites = {
        "logistic-science-pack", "chemical-science-pack", "tech-electric-trains"
    }

    -- Update the tech-speed-battery-pack technology.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-speed-battery-pack"].unit.ingredients = {}
    data.raw["technology"]["tech-speed-battery-pack"].unit.ingredients = {
        {"automation-science-pack", 1}, {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
    }
    data.raw["technology"]["tech-speed-battery-pack"].unit.count = 4000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-speed-battery-pack"].prerequisites = {}
    -- Add the new science prerequisites.
    data.raw["technology"]["tech-speed-battery-pack"].prerequisites = {
        "logistic-science-pack", "chemical-science-pack",
        "tech-electric-trains", "tech-electric-trains-experimental-charging"
    }

    -- Update the tech-acceleration-battery-pack technology.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-acceleration-battery-pack"].unit.ingredients =
        {}
    data.raw["technology"]["tech-acceleration-battery-pack"].unit.ingredients =
        {
            {"automation-science-pack", 1}, {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}
        }
    data.raw["technology"]["tech-acceleration-battery-pack"].unit.count = 4000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-acceleration-battery-pack"].prerequisites = {}
    -- Add the new science prerequisites.
    data.raw["technology"]["tech-acceleration-battery-pack"].prerequisites = {
        "logistic-science-pack", "chemical-science-pack",
        "tech-electric-trains", "tech-electric-trains-experimental-charging"
    }

    -- Update the tech-efficiency-battery-pack technology.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-efficiency-battery-pack"].unit.ingredients = {}
    data.raw["technology"]["tech-efficiency-battery-pack"].unit.ingredients = {
        {"automation-science-pack", 1}, {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
    }
    data.raw["technology"]["tech-efficiency-battery-pack"].unit.count = 4000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-efficiency-battery-pack"].prerequisites = {}
    -- Add the new science prerequisites.
    data.raw["technology"]["tech-efficiency-battery-pack"].prerequisites = {
        "logistic-science-pack", "chemical-science-pack",
        "tech-electric-trains", "tech-electric-trains-experimental-charging"
    }

    -- Just remove the braking force infinite techs.
    data.raw["technology"]["tech-electric-trains-braking-force-1"] = nil

    -- Make the new powerpacks only need tier one module
    data.raw["recipe"]["speed-battery-pack"].ingredients = {
        {type = "item", name = "speed-module", amount = 1},
        {type = "item", name = "battery", amount = 5}
    }
    data.raw["recipe"]["acceleration-battery-pack"].ingredients = {
        {type = "item", name = "productivity-module", amount = 1},
        {type = "item", name = "battery", amount = 5}
    }
    data.raw["recipe"]["efficiency-battery-pack"].ingredients = {
        {type = "item", name = "efficiency-module", amount = 1},
        {type = "item", name = "battery", amount = 5}
    }

    -- Replace all processing units with advanced circuits, since blue chips are much  harder to get in SE.
    data:extend({
        {
            type = "recipe",
            name = "recipe-electric-locomotive",
            ingredients = {
                {type = "item", name = "steel-plate", amount = 40},
                {type = "item", name = "advanced-circuit", amount = 10},
                {type = "item", name = "electric-engine-unit", amount = 50},
                {type = "item", name = "locomotive", amount = 1}
            },
            results = {
                {type = "item", name = "electric-locomotive", amount = 1}
            },
            enabled = false
        }
    })
    -- Electric Locomotive Wagon
    data.raw["recipe"]["recipe-electric-locomotive-wagon"].ingredients = {
        {type = "item", name = "steel-plate", amount = 40},
        {type = "item", name = "advanced-circuit", amount = 10},
        {type = "item", name = "electric-engine-unit", amount = 50},
        {type = "item", name = "locomotive", amount = 1}
    }

    -- Electric Cargo Wagon
    data.raw["recipe"]["recipe-electric-cargo-wagon"].ingredients = {
        {type = "item", name = "steel-plate", amount = 40},
        {type = "item", name = "advanced-circuit", amount = 10},
        {type = "item", name = "electric-engine-unit", amount = 5},
        {type = "item", name = "cargo-wagon", amount = 1}
    }

    -- Electric Fluid Wagon
    data.raw["recipe"]["recipe-electric-fluid-wagon"].ingredients = {
        {type = "item", name = "steel-plate", amount = 40},
        {type = "item", name = "advanced-circuit", amount = 10},
        {type = "item", name = "electric-engine-unit", amount = 5},
        {type = "item", name = "fluid-wagon", amount = 1}
    }

    -- Electric Train Battery Charging Station
    data.raw["recipe"]["electric-train-battery-charging-station"].ingredients =
        {
            {type = "item", name = "steel-plate", amount = 40},
            {type = "item", name = "advanced-circuit", amount = 10},
            {type = "item", name = "copper-cable", amount = 50}
        }

    -- Experimental Electric Train Battery Charging Station
    data.raw["recipe"]["experimental-electric-train-battery-charging-station"]
        .ingredients = {
        {type = "item", name = "steel-plate", amount = 40},
        {type = "item", name = "advanced-circuit", amount = 50},
        {type = "item", name = "copper-cable", amount = 200}
    }

    -- Return here if just space-age is installed. (Assuming only one of the two mods is installed.)
    if mods["space-age"] then return end

    -- Allow charging in space
    data.raw["assembling-machine"]["electric-train-battery-charging-station"]
        .se_allow_in_space = true
    data.raw["assembling-machine"]["experimental-electric-train-battery-charging-station"]
        .se_allow_in_space = true

    -- Check for the installed version of Space Exploration and handle it.
    old_version = util.split(mods["space-exploration"], ".")
    -- Check if the mod settings for decay are enabled.
    if settings.startup["train-battery-decay-enable-setting"].value == "true" then
        -- Check if this is pre v0.6.0 SE
        if tonumber(old_version[2]) <= 5 then
            -- Add the new recipes to the recycling category.
            data.raw["recipe"]["electric-train-battery-pack-refurbish"].subgroup =
                "space-recycling"
            data.raw["recipe"]["speed-battery-pack-refurbish"].subgroup =
                "space-recycling"
            data.raw["recipe"]["acceleration-battery-pack-refurbish"].subgroup =
                "space-recycling"
            data.raw["recipe"]["efficiency-battery-pack-refurbish"].subgroup =
                "space-recycling"
        else
            -- Add the new recipes to the recycling category.
            data.raw["recipe"]["electric-train-battery-pack-refurbish"].subgroup =
                "recycling"
            data.raw["recipe"]["speed-battery-pack-refurbish"].subgroup =
                "recycling"
            data.raw["recipe"]["acceleration-battery-pack-refurbish"].subgroup =
                "recycling"
            data.raw["recipe"]["efficiency-battery-pack-refurbish"].subgroup =
                "recycling"
        end
        -- Recyling stuff
        data.raw["recipe"]["electric-train-battery-pack-refurbish"].category =
            "hard-recycling"
        data.raw["recipe"]["speed-battery-pack-refurbish"].category =
            "hard-recycling"
        data.raw["recipe"]["acceleration-battery-pack-refurbish"].category =
            "hard-recycling"
        data.raw["recipe"]["efficiency-battery-pack-refurbish"].category =
            "hard-recycling"
    end

elseif mods["space-age"] and settings.startup["lock-behind-fulgora"].value ==
    "true" then
    local one_gravity_condition = {{property = "gravity", min = 1}}
    data.raw["locomotive"]["electric-locomotive"].surface_conditions =
        one_gravity_condition
    data.raw["locomotive"]["electric-locomotive-wagon"].surface_conditions =
        one_gravity_condition
    data.raw["cargo-wagon"]["electric-cargo-wagon"].surface_conditions =
        one_gravity_condition
    data.raw["fluid-wagon"]["electric-fluid-wagon"].surface_conditions =
        one_gravity_condition
    -- --------------------------- Add weights and default import planets --------------------------- --
    data.raw["item-with-entity-data"]["electric-locomotive"]
        .default_import_location = "fulgora"
    data.raw["item-with-entity-data"]["electric-locomotive"].weight = 1000 * kg
    data.raw["item-with-entity-data"]["electric-locomotive-wagon"]
        .default_import_location = "fulgora"
    data.raw["item-with-entity-data"]["electric-locomotive-wagon"].weight =
        1000 * kg
    data.raw["item-with-entity-data"]["electric-cargo-wagon"]
        .default_import_location = "fulgora"
    data.raw["item-with-entity-data"]["electric-cargo-wagon"].weight = 1000 * kg
    data.raw["item-with-entity-data"]["electric-fluid-wagon"]
        .default_import_location = "fulgora"
    data.raw["item-with-entity-data"]["electric-fluid-wagon"].weight = 1000 * kg
    data.raw["item"]["electric-train-battery-charging-station"]
        .default_import_location = "fulgora"
    data.raw["item"]["electric-train-battery-charging-station"].weight = 100 *
                                                                             kg
    data.raw["item"]["electric-train-battery-pack"].default_import_location =
        "fulgora"
    data.raw["item"]["electric-train-battery-pack"].weight = 10 * kg
    data.raw["item"]["electric-train-discharged-battery-pack"].weight = 10 * kg
    if settings.startup["train-battery-decay-enable-setting"].value then
        data.raw["item"]["electric-train-destroyed-battery-pack"].weight = 10 *
                                                                               kg
    end
    -- ----------------- Change the recipes now to use the electromagentics facility ---------------- --
    data.raw["recipe"]["recipe-electric-locomotive"].subgroup =
        "fulgora-processes"
    data.raw["recipe"]["recipe-electric-locomotive"].category =
        "electromagnetics"
    data.raw["recipe"]["recipe-electric-locomotive"].allow_productivity = true
    data.raw["recipe"]["recipe-electric-locomotive"].ingredients = {
        {type = "item", name = "steel-plate", amount = 40},
        {type = "item", name = "electric-engine-unit", amount = 50},
        {type = "item", name = "advanced-circuit", amount = 10},
        {type = "item", name = "locomotive", amount = 1},
        {type = "item", name = "superconductor", amount = 10},
        {type = "item", name = "supercapacitor", amount = 5}
    }
    data.raw["recipe"]["recipe-electric-locomotive-wagon"].subgroup =
        "fulgora-processes"
    data.raw["recipe"]["recipe-electric-locomotive-wagon"].category =
        "electromagnetics"
    data.raw["recipe"]["recipe-electric-locomotive-wagon"].allow_productivity =
        true
    data.raw["recipe"]["recipe-electric-locomotive-wagon"].ingredients = {
        {type = "item", name = "steel-plate", amount = 40},
        {type = "item", name = "electric-engine-unit", amount = 50},
        {type = "item", name = "advanced-circuit", amount = 10},
        {type = "item", name = "locomotive", amount = 1},
        {type = "item", name = "superconductor", amount = 10},
        {type = "item", name = "supercapacitor", amount = 5}
    }
    data.raw["recipe"]["recipe-electric-cargo-wagon"].subgroup =
        "fulgora-processes"
    data.raw["recipe"]["recipe-electric-cargo-wagon"].category =
        "electromagnetics"
    data.raw["recipe"]["recipe-electric-cargo-wagon"].allow_productivity = true
    data.raw["recipe"]["recipe-electric-cargo-wagon"].ingredients = {
        {type = "item", name = "steel-plate", amount = 20},
        {type = "item", name = "electric-engine-unit", amount = 5},
        {type = "item", name = "advanced-circuit", amount = 10},
        {type = "item", name = "cargo-wagon", amount = 1},
        {type = "item", name = "superconductor", amount = 2},
        {type = "item", name = "supercapacitor", amount = 1}
    }
    data.raw["recipe"]["recipe-electric-fluid-wagon"].subgroup =
        "fulgora-processes"
    data.raw["recipe"]["recipe-electric-fluid-wagon"].category =
        "electromagnetics"
    data.raw["recipe"]["recipe-electric-fluid-wagon"].ingredients = {
        {type = "item", name = "steel-plate", amount = 20},
        {type = "item", name = "electric-engine-unit", amount = 5},
        {type = "item", name = "advanced-circuit", amount = 10},
        {type = "item", name = "fluid-wagon", amount = 1},
        {type = "item", name = "superconductor", amount = 2},
        {type = "item", name = "supercapacitor", amount = 1}
    }
    data.raw["recipe"]["electric-train-battery-charging-station"]
        .allow_productivity = true
    data.raw["recipe"]["electric-train-battery-charging-station"].subgroup =
        "fulgora-processes"
    data.raw["recipe"]["electric-train-battery-charging-station"].category =
        "electromagnetics"
    data.raw["recipe"]["electric-train-battery-charging-station"].ingredients =
        {
            {type = "item", name = "processing-unit", amount = 10},
            {type = "item", name = "steel-plate", amount = 10},
            {type = "item", name = "superconductor", amount = 5},
            {type = "item", name = "holmium-plate", amount = 2}
        }
    -- epxerimental charging station
    data.raw["recipe"]["experimental-electric-train-battery-charging-station"]
        .allow_productivity = true
    data.raw["recipe"]["experimental-electric-train-battery-charging-station"]
        .subgroup = "fulgora-processes"
    data.raw["recipe"]["experimental-electric-train-battery-charging-station"]
        .category = "electromagnetics"
    data.raw["recipe"]["experimental-electric-train-battery-charging-station"]
        .ingredients = {
        {type = "item", name = "processing-unit", amount = 50},
        {type = "item", name = "steel-plate", amount = 10},
        {type = "item", name = "superconductor", amount = 10},
        {type = "item", name = "holmium-plate", amount = 5}
    }
    -- normal powerpacks
    data.raw["recipe"]["electric-train-battery-pack"].allow_productivity = true
    data.raw["recipe"]["electric-train-battery-pack"].subgroup =
        "fulgora-processes"
    data.raw["recipe"]["electric-train-battery-pack"].category =
        "electromagnetics"
    data.raw["recipe"]["electric-train-battery-pack"].ingredients = {
        {type = "item", name = "supercapacitor", amount = 1},
        {type = "item", name = "superconductor", amount = 2},
        {type = "item", name = "holmium-plate", amount = 2}
    }
    -- alkaline powerpacks
    data.raw["recipe"]["recipe-electric-train-alkaline-battery-pack"]
        .allow_productivity = true
    data.raw["recipe"]["recipe-electric-train-alkaline-battery-pack"].subgroup =
        "fulgora-processes"
    data.raw["recipe"]["recipe-electric-train-alkaline-battery-pack"].category =
        "electromagnetics"
    data.raw["recipe"]["recipe-electric-train-alkaline-battery-pack"]
        .ingredients = {
        {type = "item", name = "supercapacitor", amount = 1},
        {type = "item", name = "superconductor", amount = 1},
        {type = "item", name = "holmium-plate", amount = 2}
    }
    -- speed powerpacks
    data.raw["recipe"]["speed-battery-pack"].allow_productivity = true
    data.raw["recipe"]["speed-battery-pack"].subgroup = "fulgora-processes"
    data.raw["recipe"]["speed-battery-pack"].category = "electromagnetics"
    data.raw["recipe"]["speed-battery-pack"].ingredients = {
        {type = "item", name = "supercapacitor", amount = 2},
        {type = "item", name = "superconductor", amount = 3},
        {type = "item", name = "holmium-plate", amount = 5},
        {type = "item", name = "speed-module", amount = 1}
    }
    -- acceleration powerpacks
    data.raw["recipe"]["acceleration-battery-pack"].allow_productivity = true
    data.raw["recipe"]["acceleration-battery-pack"].subgroup =
        "fulgora-processes"
    data.raw["recipe"]["acceleration-battery-pack"].category =
        "electromagnetics"
    data.raw["recipe"]["acceleration-battery-pack"].ingredients = {
        {type = "item", name = "supercapacitor", amount = 1},
        {type = "item", name = "superconductor", amount = 4},
        {type = "item", name = "holmium-plate", amount = 5},
        {type = "item", name = "productivity-module", amount = 1}
    }
    -- efficiency powerpacks
    data.raw["recipe"]["efficiency-battery-pack"].allow_productivity = true
    data.raw["recipe"]["efficiency-battery-pack"].subgroup = "fulgora-processes"
    data.raw["recipe"]["efficiency-battery-pack"].category = "electromagnetics"
    data.raw["recipe"]["efficiency-battery-pack"].ingredients = {
        {type = "item", name = "supercapacitor", amount = 3},
        {type = "item", name = "superconductor", amount = 2},
        {type = "item", name = "holmium-plate", amount = 5},
        {type = "item", name = "efficiency-module", amount = 1}
    }

    -- ------------------------------ Update tech tree ------------------------------ --
    data.raw["technology"]["tech-electric-trains"].unit.ingredients = {}
    data.raw["technology"]["tech-electric-trains"].unit.ingredients = {
        {"automation-science-pack", 1}, {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}, {"production-science-pack", 1},
        {"utility-science-pack", 1}, {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1}
    }
    data.raw["technology"]["tech-electric-trains"].unit.count = 2000
    data.raw["technology"]["tech-electric-trains"].prerequisites = {
        "processing-unit", "electromagnetic-plant", "railway",
        "holmium-processing", "electromagnetic-science-pack"
    }
    -- Update alkaline battery pack tech.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-alkaline-battery-pack"].unit.ingredients = {}
    data.raw["technology"]["tech-alkaline-battery-pack"].unit.ingredients = {
        {"automation-science-pack", 1}, {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}, {"production-science-pack", 1},
        {"utility-science-pack", 1}, {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1}
    }
    data.raw["technology"]["tech-alkaline-battery-pack"].unit.count = 2000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-alkaline-battery-pack"].prerequisites = {}
    -- Add the new science prerequisites.
    data.raw["technology"]["tech-alkaline-battery-pack"].prerequisites = {
        "tech-electric-trains"
    }

    -- Update the tech-electric-trains-experimental-charging technology.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-electric-trains-experimental-charging"].unit
        .ingredients = {}
    data.raw["technology"]["tech-electric-trains-experimental-charging"].unit
        .ingredients = {
        {"automation-science-pack", 1}, {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}, {"production-science-pack", 1},
        {"utility-science-pack", 1}, {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1}
    }
    data.raw["technology"]["tech-electric-trains-experimental-charging"].unit
        .count = 2000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-electric-trains-experimental-charging"]
        .prerequisites = {}
    -- Add the new science prerequisites.
    data.raw["technology"]["tech-electric-trains-experimental-charging"]
        .prerequisites = {
        "tech-alkaline-battery-pack", "tech-electric-trains",
        "tech-electric-locomotive-wagon"
    }

    -- Update the tech-electric-locomotive-wagon technology.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-electric-locomotive-wagon"].unit.ingredients =
        {}
    data.raw["technology"]["tech-electric-locomotive-wagon"].unit.ingredients =
        {
            {"automation-science-pack", 1}, {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}, {"production-science-pack", 1},
            {"utility-science-pack", 1}, {"space-science-pack", 1},
            {"electromagnetic-science-pack", 1}
        }
    data.raw["technology"]["tech-electric-locomotive-wagon"].unit.count = 2000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-electric-locomotive-wagon"].prerequisites = {}
    -- Add the new science prerequisites.
    data.raw["technology"]["tech-electric-locomotive-wagon"].prerequisites = {
        "tech-electric-trains"
    }

    -- Update the tech-speed-battery-pack technology.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-speed-battery-pack"].unit.ingredients = {}
    data.raw["technology"]["tech-speed-battery-pack"].unit.ingredients = {
        {"automation-science-pack", 1}, {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}, {"production-science-pack", 1},
        {"utility-science-pack", 1}, {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1}
    }
    data.raw["technology"]["tech-speed-battery-pack"].unit.count = 4000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-speed-battery-pack"].prerequisites = {}
    -- Add the new science prerequisites.
    data.raw["technology"]["tech-speed-battery-pack"].prerequisites = {
        "tech-electric-trains", "tech-electric-trains-experimental-charging"
    }

    -- Update the tech-acceleration-battery-pack technology.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-acceleration-battery-pack"].unit.ingredients =
        {}
    data.raw["technology"]["tech-acceleration-battery-pack"].unit.ingredients =
        {
            {"automation-science-pack", 1}, {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}, {"production-science-pack", 1},
            {"utility-science-pack", 1}, {"space-science-pack", 1},
            {"electromagnetic-science-pack", 1}
        }
    data.raw["technology"]["tech-acceleration-battery-pack"].unit.count = 4000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-acceleration-battery-pack"].prerequisites = {}
    -- Add the new science prerequisites.
    data.raw["technology"]["tech-acceleration-battery-pack"].prerequisites = {
        "tech-electric-trains", "tech-electric-trains-experimental-charging"
    }

    -- Update the tech-efficiency-battery-pack technology.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-efficiency-battery-pack"].unit.ingredients = {}
    data.raw["technology"]["tech-efficiency-battery-pack"].unit.ingredients = {
        {"automation-science-pack", 1}, {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}, {"production-science-pack", 1},
        {"utility-science-pack", 1}, {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1}
    }
    data.raw["technology"]["tech-efficiency-battery-pack"].unit.count = 4000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-efficiency-battery-pack"].prerequisites = {}
    -- Add the new science prerequisites.
    data.raw["technology"]["tech-efficiency-battery-pack"].prerequisites = {
        "tech-electric-trains", "tech-electric-trains-experimental-charging"
    }

    -- Just remove the braking force infinite techs.
    data.raw["technology"]["tech-electric-trains-braking-force-1"] = nil
end
