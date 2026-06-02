local science = {
    basic = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack",   1 },
        { "chemical-science-pack",   1 }
    },
    late_space_age = {
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "chemical-science-pack",        1 },
        { "production-science-pack",      1 },
        { "utility-science-pack",         1 },
        { "space-science-pack",           1 },
        { "electromagnetic-science-pack", 1 }
    }
}

-- If the Space Exploration mod is installed, make compatibility changes.
if mods["space-exploration"] or (mods["space-age"] and settings.startup["lock-behind-fulgora"].value == "false") then

    data.raw["technology"]["tech-electric-trains"].unit.ingredients = science.basic
    data.raw["technology"]["tech-electric-trains"].prerequisites = {
        "logistic-science-pack", "chemical-science-pack", "electric-engine" }

    ----------------------

    data.raw["technology"]["tech-electric-trains-experimental-charging"].unit.ingredients = science.basic
    data.raw["technology"]["tech-electric-trains-experimental-charging"].prerequisites = {
        "logistic-science-pack", "chemical-science-pack", "tech-electric-trains" }

    ----------------------

    data.raw["technology"]["tech-electric-locomotive-wagon"].unit.ingredients = science.basic
    data.raw["technology"]["tech-electric-locomotive-wagon"].prerequisites = {
        "logistic-science-pack", "chemical-science-pack", "tech-electric-trains" }

    ----------------------

    if mods["space-age"] then
        data.raw["technology"]["tech-electric-artillery-wagon"].unit.ingredients = {
            { "automation-science-pack",  1 },
            { "logistic-science-pack",    1 },
            { "chemical-science-pack",    1 },
            { "military-science-pack",    1 },
            { "utility-science-pack",     1 },
            { "space-science-pack",       1 },
            { "metallurgic-science-pack", 1 }
        }
    elseif mods["space-exploration"] then
        data.raw["technology"]["tech-electric-artillery-wagon"].unit.ingredients = {
            { "automation-science-pack",    1 },
            { "logistic-science-pack",      1 },
            { "chemical-science-pack",      1 },
            { "military-science-pack",      1 },
            { "utility-science-pack",       1 },
            { "space-science-pack",         1 },
            { "se-material-science-pack-1", 1 }
        }
    else
        data.raw["technology"]["tech-electric-artillery-wagon"].unit.ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack",   1 },
            { "chemical-science-pack",   1 },
            { "military-science-pack",   1 },
            { "utility-science-pack",    1 },
            { "space-science-pack",      1 }
        }
    end
    data.raw["technology"]["tech-electric-artillery-wagon"].prerequisites = {
        "logistic-science-pack", "chemical-science-pack", "artillery", "tech-electric-trains" }

    ----------------------

    data.raw["technology"]["tech-acceleration-battery-pack"].unit.ingredients = science.basic
    data.raw["technology"]["tech-acceleration-battery-pack"].prerequisites = {
        "logistic-science-pack", "chemical-science-pack", "tech-electric-trains",
        "tech-electric-trains-experimental-charging" }

    ----------------------

    data.raw["technology"]["tech-alkaline-battery-pack"].unit.ingredients = science.basic
    data.raw["technology"]["tech-alkaline-battery-pack"].prerequisites = {
        "logistic-science-pack", "chemical-science-pack", "tech-electric-trains" }

    ----------------------

    data.raw["technology"]["tech-efficiency-battery-pack"].unit.ingredients = science.basic
    data.raw["technology"]["tech-efficiency-battery-pack"].prerequisites = {
        "logistic-science-pack", "chemical-science-pack", "tech-electric-trains",
        "tech-electric-trains-experimental-charging" }

    ----------------------

    data.raw["technology"]["tech-speed-battery-pack"].unit.ingredients = science.basic
    data.raw["technology"]["tech-speed-battery-pack"].prerequisites = {
        "logistic-science-pack", "chemical-science-pack", "tech-electric-trains",
        "tech-electric-trains-experimental-charging" }

    ----------------------

    -- Just remove the braking force infinite techs.
    data.raw["technology"]["tech-electric-trains-braking-force-1"] = nil

elseif mods["space-age"] and settings.startup["lock-behind-fulgora"].value == "true" then

    data.raw["technology"]["tech-electric-trains"].unit.ingredients = science.late_space_age
    data.raw["technology"]["tech-electric-trains"].unit.count = 2000
    data.raw["technology"]["tech-electric-trains"].prerequisites = {
        "processing-unit", "electromagnetic-plant", "railway", "holmium-processing", "electromagnetic-science-pack" }

    ----------------------

    data.raw["technology"]["tech-alkaline-battery-pack"].unit.ingredients = science.late_space_age
    data.raw["technology"]["tech-alkaline-battery-pack"].unit.count = 2000
    data.raw["technology"]["tech-alkaline-battery-pack"].prerequisites = { "tech-electric-trains" }

    ----------------------

    data.raw["technology"]["tech-electric-trains-experimental-charging"].unit.ingredients = science.late_space_age
    data.raw["technology"]["tech-electric-trains-experimental-charging"].unit.count = 2000
    data.raw["technology"]["tech-electric-trains-experimental-charging"].prerequisites = {
        "tech-alkaline-battery-pack", "tech-electric-trains", "tech-electric-locomotive-wagon" }

    ----------------------

    data.raw["technology"]["tech-electric-locomotive-wagon"].unit.ingredients = science.late_space_age
    data.raw["technology"]["tech-electric-locomotive-wagon"].unit.count = 2000
    data.raw["technology"]["tech-electric-locomotive-wagon"].prerequisites = { "tech-electric-trains" }

    ----------------------

    data.raw["technology"]["tech-electric-artillery-wagon"].unit.ingredients = {
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "chemical-science-pack",        1 },
        { "production-science-pack",      1 },
        { "utility-science-pack",         1 },
        { "space-science-pack",           1 },
        { "electromagnetic-science-pack", 1 },
        { "military-science-pack",        1 },
        { "metallurgic-science-pack",     1 }
    }
    data.raw["technology"]["tech-electric-artillery-wagon"].unit.count = 4000
    data.raw["technology"]["tech-electric-artillery-wagon"].prerequisites = { "tech-electric-trains", "artillery" }

    ----------------------

    data.raw["technology"]["tech-speed-battery-pack"].unit.ingredients = science.late_space_age
    data.raw["technology"]["tech-speed-battery-pack"].unit.count = 4000
    data.raw["technology"]["tech-speed-battery-pack"].prerequisites = {
        "tech-electric-trains", "tech-electric-trains-experimental-charging" }

    ----------------------

    data.raw["technology"]["tech-acceleration-battery-pack"].unit.ingredients = science.late_space_age
    data.raw["technology"]["tech-acceleration-battery-pack"].unit.count = 4000
    data.raw["technology"]["tech-acceleration-battery-pack"].prerequisites = {
        "tech-electric-trains", "tech-electric-trains-experimental-charging" }

    ----------------------

    data.raw["technology"]["tech-efficiency-battery-pack"].unit.ingredients = science.late_space_age
    data.raw["technology"]["tech-efficiency-battery-pack"].unit.count = 4000
    data.raw["technology"]["tech-efficiency-battery-pack"].prerequisites = {
        "tech-electric-trains", "tech-electric-trains-experimental-charging" }

    ----------------------

    -- Just remove the braking force infinite techs.
    data.raw["technology"]["tech-electric-trains-braking-force-1"] = nil
end
