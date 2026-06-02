data:extend
{
    {
        type = "technology",
        name = "tech-electric-trains",
        mod = "electric-trains",
        icon = "__electric-trains__/graphics/technology/tech-electric-trains.png",
        icon_size = 256,
        effects = {
            { type = "unlock-recipe", recipe = "electric-locomotive" },
            { type = "unlock-recipe", recipe = "electric-fluid-wagon" },
            { type = "unlock-recipe", recipe = "electric-cargo-wagon" },
            { type = "unlock-recipe", recipe = "electric-train-battery-charging-station" },
            { type = "unlock-recipe", recipe = "discharged-electric-battery-pack" },
            { type = "unlock-recipe", recipe = "charged-electric-battery-pack" }
        },
        prerequisites = {
            "steel-processing",
            "processing-unit",
            "battery",
            "railway",
            "production-science-pack",
            "utility-science-pack",
            "electric-engine"
        },
        unit = {
            count = 2000,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "production-science-pack", 1 },
                { "utility-science-pack",    1 }
            },
            time = 60
        }
    },

    {
        type = "technology",
        name = "tech-electric-locomotive-wagon",
        icon = "__electric-trains__/graphics/technology/tech-electric-locomotive-wagon.png",
        icon_size = 256,
        effects = { { type = "unlock-recipe", recipe = "electric-locomotive-wagon" } },
        prerequisites = { "tech-electric-trains" },
        unit = {
            count = 2000,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "production-science-pack", 1 },
                { "utility-science-pack",    1 }
            },
            time = 60
        }
    },

    {
        type = "technology",
        name = "tech-electric-artillery-wagon",
        icon = "__electric-trains__/graphics/technology/tech-electric-artillery-wagon.png",
        icon_size = 256,
        effects = { { type = "unlock-recipe", recipe = "electric-artillery-wagon" } },
        prerequisites = { "tech-electric-trains", "artillery" },
        unit = {
            count = 4000,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "production-science-pack", 1 },
                { "utility-science-pack",    1 },
                { "military-science-pack",   1 }
            },
            time = 60
        }
    },

    ------------------------

    {
        type = "technology",
        name = "tech-electric-trains-experimental-charging",
        mod = "electric-trains",
        icon = "__electric-trains__/graphics/technology/tech-electric-trains-experimental-charging.png",
        icon_size = 256,
        effects = {
            { type = "unlock-recipe", recipe = "experimental-electric-train-battery-charging-station" },
            { type = "unlock-recipe", recipe = "faster-recharge-electric-battery-pack" }
        },
        prerequisites = { "tech-electric-trains", "tech-electric-locomotive-wagon" },
        unit = {
            count = 2000,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "production-science-pack", 1 },
                { "utility-science-pack",    1 }
            },
            time = 60
        }
    },

    ------------------------

    {
        type = "technology",
        name = "tech-electric-trains-braking-force-1",
        icon_size = 256,
        icons = {
            {
                icon = "__electric-trains__/graphics/technology/tech-electric-trains-braking-force-1.png",
                icon_size = 256
            },
            {
                icon = "__core__/graphics/icons/technology/constants/constant-braking-force.png",
                icon_size = 128,
                icon_mipmaps = 3,
                shift = { 100, 100 }
            }
        },
        effects = { { type = "train-braking-force-bonus", modifier = 0.05 } },
        prerequisites = { "space-science-pack", "tech-electric-trains", "tech-electric-trains-experimental-charging" },
        unit = {
            count_formula = "2^L*1000",
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "production-science-pack", 1 },
                { "utility-science-pack",    1 },
                { "space-science-pack",      1 }
            },
            time = 60
        },
        max_level = "infinite",
        order = "e-k-d"
    },

    ------------------------

    {
        type = "technology",
        name = "tech-acceleration-battery-pack",
        icon = "__electric-trains__/graphics/technology/tech-acceleration-battery-pack.png",
        icon_size = 256,
        effects = {
            { type = "unlock-recipe", recipe = "discharged-acceleration-battery-pack" },
            { type = "unlock-recipe", recipe = "charged-acceleration-battery-pack" }
        },
        prerequisites = { "tech-electric-trains", "tech-electric-trains-experimental-charging", "productivity-module-3" },
        unit = {
            count = 4000,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "production-science-pack", 1 },
                { "utility-science-pack",    1 }
            },
            time = 60
        }
    },

    {
        type = "technology",
        name = "tech-alkaline-battery-pack",
        mod = "electric-trains",
        icon = "__electric-trains__/graphics/technology/tech-alkaline-battery-pack.png",
        icon_size = 256,
        effects = { { type = "unlock-recipe", recipe = "alkaline-electric-battery-pack" } },
        prerequisites = { "tech-electric-trains" },
        unit = {
            count = 2000,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "production-science-pack", 1 },
                { "utility-science-pack",    1 }
            },
            time = 60
        }
    },

    {
        type = "technology",
        name = "tech-efficiency-battery-pack",
        icon = "__electric-trains__/graphics/technology/tech-efficiency-battery-pack.png",
        icon_size = 256,
        effects = {
            { type = "unlock-recipe", recipe = "discharged-efficiency-battery-pack" },
            { type = "unlock-recipe", recipe = "charged-efficiency-battery-pack" }
        },
        prerequisites = { "tech-electric-trains", "tech-electric-trains-experimental-charging", "efficiency-module-3" },
        unit = {
            count = 4000,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "production-science-pack", 1 },
                { "utility-science-pack",    1 }
            },
            time = 60
        }
    },

    {
        type = "technology",
        name = "tech-speed-battery-pack",
        icon = "__electric-trains__/graphics/technology/tech-speed-battery-pack.png",
        icon_size = 256,
        effects = {
            { type = "unlock-recipe", recipe = "discharged-speed-battery-pack" },
            { type = "unlock-recipe", recipe = "charged-speed-battery-pack" }
        },
        prerequisites = { "tech-electric-trains", "tech-electric-trains-experimental-charging", "speed-module-3" },
        unit = {
            count = 4000,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "production-science-pack", 1 },
                { "utility-science-pack",    1 }
            },
            time = 60
        }
    },

}

if settings.startup["train-battery-decay-enable-setting"].value == "true" then
    table.insert(data.raw["technology"]["tech-electric-trains"].effects,
        { type = "unlock-recipe", recipe = "refurbish-electric-battery-pack" })

    table.insert(data.raw["technology"]["tech-acceleration-battery-pack"].effects,
        { type = "unlock-recipe", recipe = "refurbish-acceleration-battery-pack" })

    table.insert(data.raw["technology"]["tech-efficiency-battery-pack"].effects,
        { type = "unlock-recipe", recipe = "refurbish-efficiency-battery-pack" })

    table.insert(data.raw["technology"]["tech-speed-battery-pack"].effects,
        { type = "unlock-recipe", recipe = "refurbish-speed-battery-pack" })
end
