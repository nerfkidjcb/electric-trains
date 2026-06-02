if mods["space-age"] then

    local one_gravity_condition = { { property = "gravity", min = 1 } }

    data.raw["locomotive"]["electric-locomotive"].surface_conditions = one_gravity_condition
    data.raw["locomotive"]["electric-locomotive-wagon"].surface_conditions = one_gravity_condition
    data.raw["cargo-wagon"]["electric-cargo-wagon"].surface_conditions = one_gravity_condition
    data.raw["fluid-wagon"]["electric-fluid-wagon"].surface_conditions = one_gravity_condition
    data.raw["artillery-wagon"]["electric-artillery-wagon"].surface_conditions = one_gravity_condition

    --------------------------- Add weights and default import planets --------------------------- --

    data.raw["item-with-entity-data"]["electric-locomotive"].default_import_location = "fulgora"
    data.raw["item-with-entity-data"]["electric-locomotive"].weight = 1000 * kg
    data.raw["item-with-entity-data"]["electric-locomotive-wagon"].default_import_location = "fulgora"
    data.raw["item-with-entity-data"]["electric-locomotive-wagon"].weight = 1000 * kg
    data.raw["item-with-entity-data"]["electric-cargo-wagon"].default_import_location = "fulgora"
    data.raw["item-with-entity-data"]["electric-cargo-wagon"].weight = 1000 * kg
    data.raw["item-with-entity-data"]["electric-fluid-wagon"].default_import_location = "fulgora"
    data.raw["item-with-entity-data"]["electric-fluid-wagon"].weight = 1000 * kg
    data.raw["item-with-entity-data"]["electric-artillery-wagon"].default_import_location = "fulgora"
    data.raw["item-with-entity-data"]["electric-artillery-wagon"].weight = 1000 * kg
    data.raw["item"]["electric-train-battery-charging-station"].default_import_location = "fulgora"
    data.raw["item"]["electric-train-battery-charging-station"].weight = 100 * kg
    data.raw["item"]["charged-electric-battery-pack"].default_import_location = "fulgora"
    data.raw["item"]["charged-electric-battery-pack"].weight = 10 * kg
    data.raw["item"]["discharged-electric-battery-pack"].weight = 10 * kg

    if settings.startup["train-battery-decay-enable-setting"].value == "true" then
        data.raw["item"]["destroyed-electric-battery-pack"].weight = 10 * kg
    end

end
