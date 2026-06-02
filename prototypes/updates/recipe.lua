local function convert_ingredient(recipe_name, old_ingredient_name, new_ingredient_name)
    local recipe = data.raw["recipe"][recipe_name]

    if not recipe then
        return
    end

    if not recipe.ingredients then
        return
    end

    for _, ingredient in pairs(recipe.ingredients) do
        if ingredient.name == old_ingredient_name then
            ingredient.name = new_ingredient_name
            break
        end
    end
end

----------------------

if mods["space-age"] or mods["space-exploration"] then

    if settings.startup["lock-behind-fulgora"].value == "true" then

        data.raw["recipe"]["electric-locomotive"].category = "electromagnetics"
        data.raw["recipe"]["electric-locomotive"].allow_productivity = true
        data.raw["recipe"]["electric-locomotive"].ingredients = {
            { type = "item", name = "steel-plate",          amount = 40 },
            { type = "item", name = "electric-engine-unit", amount = 50 },
            { type = "item", name = "advanced-circuit",     amount = 10 },
            { type = "item", name = "locomotive",           amount = 1 },
            { type = "item", name = "superconductor",       amount = 10 },
            { type = "item", name = "supercapacitor",       amount = 5 }
        }

        ----------------------

        data.raw["recipe"]["electric-locomotive-wagon"].category = "electromagnetics"
        data.raw["recipe"]["electric-locomotive-wagon"].allow_productivity = true
        data.raw["recipe"]["electric-locomotive-wagon"].ingredients = {
            { type = "item", name = "steel-plate",          amount = 40 },
            { type = "item", name = "electric-engine-unit", amount = 50 },
            { type = "item", name = "advanced-circuit",     amount = 10 },
            { type = "item", name = "locomotive",           amount = 1 },
            { type = "item", name = "superconductor",       amount = 10 },
            { type = "item", name = "supercapacitor",       amount = 5 }
        }

        ----------------------

        data.raw["recipe"]["electric-artillery-wagon"].category = "electromagnetics"
        data.raw["recipe"]["electric-artillery-wagon"].allow_productivity = true
        data.raw["recipe"]["electric-artillery-wagon"].ingredients = {
            { type = "item", name = "artillery-wagon",      amount = 1 },
            { type = "item", name = 'electric-engine-unit', amount = 20 },
            { type = "item", name = "iron-gear-wheel",      amount = 20 },
            { type = "item", name = "steel-plate",          amount = 20 },
            { type = "item", name = "pipe",                 amount = 16 },
            { type = "item", name = "processing-unit",      amount = 10 },
            { type = "item", name = "superconductor",       amount = 5 },
            { type = "item", name = "supercapacitor",       amount = 1 }
        }

        ----------------------

        data.raw["recipe"]["electric-cargo-wagon"].category = "electromagnetics"
        data.raw["recipe"]["electric-cargo-wagon"].allow_productivity = true
        data.raw["recipe"]["electric-cargo-wagon"].ingredients = {
            { type = "item", name = "steel-plate",          amount = 20 },
            { type = "item", name = "electric-engine-unit", amount = 5 },
            { type = "item", name = "advanced-circuit",     amount = 10 },
            { type = "item", name = "cargo-wagon",          amount = 1 },
            { type = "item", name = "superconductor",       amount = 2 },
            { type = "item", name = "supercapacitor",       amount = 1 }
        }

        ----------------------

        data.raw["recipe"]["electric-fluid-wagon"].category = "electromagnetics"
        data.raw["recipe"]["electric-fluid-wagon"].ingredients = {
            { type = "item", name = "steel-plate",          amount = 20 },
            { type = "item", name = "electric-engine-unit", amount = 5 },
            { type = "item", name = "advanced-circuit",     amount = 10 },
            { type = "item", name = "fluid-wagon",          amount = 1 },
            { type = "item", name = "superconductor",       amount = 2 },
            { type = "item", name = "supercapacitor",       amount = 1 }
        }

        ----------------------

        data.raw["recipe"]["electric-train-battery-charging-station"].allow_productivity = true
        data.raw["recipe"]["electric-train-battery-charging-station"].category = "electromagnetics"
        data.raw["recipe"]["electric-train-battery-charging-station"].ingredients = {
            { type = "item", name = "processing-unit", amount = 10 },
            { type = "item", name = "steel-plate",     amount = 10 },
            { type = "item", name = "superconductor",  amount = 5 },
            { type = "item", name = "holmium-plate",   amount = 2 }
        }

        ----------------------

        data.raw["recipe"]["experimental-electric-train-battery-charging-station"].allow_productivity = true
        data.raw["recipe"]["experimental-electric-train-battery-charging-station"].category = "electromagnetics"
        data.raw["recipe"]["experimental-electric-train-battery-charging-station"].ingredients = {
            { type = "item", name = "processing-unit", amount = 50 },
            { type = "item", name = "steel-plate",     amount = 10 },
            { type = "item", name = "superconductor",  amount = 10 },
            { type = "item", name = "holmium-plate",   amount = 5 }
        }

        ----------------------

        data.raw["recipe"]["discharged-electric-battery-pack"].allow_productivity = true
        data.raw["recipe"]["discharged-electric-battery-pack"].category = "electromagnetics"
        data.raw["recipe"]["discharged-electric-battery-pack"].ingredients = {
            { type = "item", name = "supercapacitor", amount = 1 },
            { type = "item", name = "superconductor", amount = 2 },
            { type = "item", name = "holmium-plate",  amount = 2 }
        }

        ----------------------

        data.raw["recipe"]["alkaline-electric-battery-pack"].allow_productivity = true
        data.raw["recipe"]["alkaline-electric-battery-pack"].category = "electromagnetics"
        data.raw["recipe"]["alkaline-electric-battery-pack"].ingredients = {
            { type = "item", name = "supercapacitor", amount = 1 },
            { type = "item", name = "superconductor", amount = 1 },
            { type = "item", name = "holmium-plate",  amount = 2 }
        }
        ----------------------

        data.raw["recipe"]["discharged-acceleration-battery-pack"].allow_productivity = true
        data.raw["recipe"]["discharged-acceleration-battery-pack"].category = "electromagnetics"
        data.raw["recipe"]["discharged-acceleration-battery-pack"].ingredients = {
            { type = "item", name = "supercapacitor",      amount = 1 },
            { type = "item", name = "superconductor",      amount = 4 },
            { type = "item", name = "holmium-plate",       amount = 5 },
            { type = "item", name = "productivity-module", amount = 1 }
        }

        ----------------------

        data.raw["recipe"]["discharged-efficiency-battery-pack"].allow_productivity = true
        data.raw["recipe"]["discharged-efficiency-battery-pack"].category = "electromagnetics"
        data.raw["recipe"]["discharged-efficiency-battery-pack"].ingredients = {
            { type = "item", name = "supercapacitor",    amount = 3 },
            { type = "item", name = "superconductor",    amount = 2 },
            { type = "item", name = "holmium-plate",     amount = 5 },
            { type = "item", name = "efficiency-module", amount = 1 }
        }

        ----------------------

        data.raw["recipe"]["discharged-speed-battery-pack"].allow_productivity = true
        data.raw["recipe"]["discharged-speed-battery-pack"].category = "electromagnetics"
        data.raw["recipe"]["discharged-speed-battery-pack"].ingredients = {
            { type = "item", name = "supercapacitor", amount = 2 },
            { type = "item", name = "superconductor", amount = 3 },
            { type = "item", name = "holmium-plate",  amount = 5 },
            { type = "item", name = "speed-module",   amount = 1 }
        }
    else
        convert_ingredient("electric-locomotive", "processing-unit", "advanced-circuit")
        convert_ingredient("electric-locomotive-wagon", "processing-unit", "advanced-circuit")
        convert_ingredient("electric-cargo-wagon", "processing-unit", "advanced-circuit")
        convert_ingredient("electric-fluid-wagon", "processing-unit", "advanced-circuit")
        convert_ingredient("electric-artillery-wagon", "processing-unit", "advanced-circuit")
        convert_ingredient("electric-train-battery-charging-station", "processing-unit", "advanced-circuit")
        convert_ingredient("experimental-electric-train-battery-charging-station", "processing-unit", "advanced-circuit")

        -- Make the new powerpacks only need tier one module
        data.raw["recipe"]["discharged-speed-battery-pack"].ingredients = {
            { type = "item", name = "speed-module", amount = 1 },
            { type = "item", name = "battery",      amount = 5 }
        }

        data.raw["recipe"]["discharged-acceleration-battery-pack"].ingredients = {
            { type = "item", name = "productivity-module", amount = 1 },
            { type = "item", name = "battery",             amount = 5 }
        }

        data.raw["recipe"]["discharged-efficiency-battery-pack"].ingredients = {
            { type = "item", name = "efficiency-module", amount = 1 },
            { type = "item", name = "battery",           amount = 5 }
        }

        ----------------------

        -- Allow charging in space
        data.raw["assembling-machine"]["electric-train-battery-charging-station"].se_allow_in_space = true
        data.raw["assembling-machine"]["experimental-electric-train-battery-charging-station"].se_allow_in_space = true

        -- Check for the installed version of Space Exploration and handle it.
        old_version = util.split(mods["space-exploration"], ".")
        -- Check if the mod settings for decay are enabled.
        if settings.startup["train-battery-decay-enable-setting"].value == "true" then
            if tonumber(old_version[2]) <= 5 then -- Check if this is pre v0.6.0 SE
                -- Add the new recipes to the recycling category.
                data.raw["recipe"]["refurbish-electric-battery-pack"].subgroup = "space-recycling"
                data.raw["recipe"]["refurbish-speed-battery-pack"].subgroup = "space-recycling"
                data.raw["recipe"]["refurbish-acceleration-battery-pack"].subgroup = "space-recycling"
                data.raw["recipe"]["refurbish-efficiency-battery-pack"].subgroup = "space-recycling"
            else
                -- Add the new recipes to the recycling category.
                data.raw["recipe"]["refurbish-electric-battery-pack"].subgroup = "recycling"
                data.raw["recipe"]["refurbish-speed-battery-pack"].subgroup = "recycling"
                data.raw["recipe"]["refurbish-acceleration-battery-pack"].subgroup = "recycling"
                data.raw["recipe"]["refurbish-efficiency-battery-pack"].subgroup = "recycling"
            end
            -- Recyling stuff
            data.raw["recipe"]["refurbish-electric-battery-pack"].category = "hard-recycling"
            data.raw["recipe"]["refurbish-speed-battery-pack"].category = "hard-recycling"
            data.raw["recipe"]["refurbish-acceleration-battery-pack"].category = "hard-recycling"
            data.raw["recipe"]["refurbish-efficiency-battery-pack"].category = "hard-recycling"
        end
    end
end
