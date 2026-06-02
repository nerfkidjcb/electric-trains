if settings.startup["electric-locomotive-speed-setting"].value == "238 km/h (Vanilla)" then
    data.raw["locomotive"]["electric-locomotive"].max_speed = 1.1
    data.raw["locomotive"]["electric-locomotive-wagon"].max_speed = 1.1
    data.raw["cargo-wagon"]["electric-cargo-wagon"].max_speed = 1.1
    data.raw["fluid-wagon"]["electric-fluid-wagon"].max_speed = 1.1
    data.raw["artillery-wagon"]["electric-artillery-wagon"].max_speed = 1.1
elseif settings.startup["electric-locomotive-speed-setting"].value == "378 km/h" then
    data.raw["locomotive"]["electric-locomotive"].max_speed = 1.75
    data.raw["locomotive"]["electric-locomotive-wagon"].max_speed = 1.75
    data.raw["cargo-wagon"]["electric-cargo-wagon"].max_speed = 1.75
    data.raw["fluid-wagon"]["electric-fluid-wagon"].max_speed = 1.75
    data.raw["artillery-wagon"]["electric-artillery-wagon"].max_speed = 1.75
elseif settings.startup["electric-locomotive-speed-setting"].value == "714 km/h (Extended)" then
    data.raw["locomotive"]["electric-locomotive"].max_speed = 3.3
    data.raw["locomotive"]["electric-locomotive-wagon"].max_speed = 3.3
    data.raw["cargo-wagon"]["electric-cargo-wagon"].max_speed = 3.3
    data.raw["fluid-wagon"]["electric-fluid-wagon"].max_speed = 3.3
    data.raw["artillery-wagon"]["electric-artillery-wagon"].max_speed = 3.3
end

----------------------

if settings.startup["electric-cargo-wagon-capacity-setting"].value == "40 Slots (Vanilla)" then
    data.raw["cargo-wagon"]["electric-cargo-wagon"].inventory_size = 40
elseif settings.startup["electric-cargo-wagon-capacity-setting"].value == "120 Slots (Extended)" then
    data.raw["cargo-wagon"]["electric-cargo-wagon"].inventory_size = 120
end

----------------------

if settings.startup["electric-fluid-wagon-capacity-setting"].value == "50.000 (Vanilla)" then
    data.raw["fluid-wagon"]["electric-fluid-wagon"].capacity = 50000
elseif settings.startup["electric-fluid-wagon-capacity-setting"].value == "150.000 (Extended)" then
    data.raw["fluid-wagon"]["electric-fluid-wagon"].capacity = 150000
end

----------------------

if settings.startup["train-battery-pack-energy-density-setting"].value == "80 MJ" then
    data.raw["assembling-machine"]["electric-train-battery-charging-station"].energy_usage = "3.3MW"
    data.raw["assembling-machine"]["experimental-electric-train-battery-charging-station"].energy_usage = "33MW"
    data.raw["assembling-machine"]["experimental-electric-train-battery-charging-station"].max_power = "33MW"

    data.raw["item"]["charged-electric-battery-pack"].fuel_value = "80MJ"
    data.raw["item"]["charged-acceleration-battery-pack"].fuel_value = "64MJ"
    data.raw["item"]["alkaline-electric-battery-pack"].fuel_value = "240MJ"
    data.raw["item"]["charged-efficiency-battery-pack"].fuel_value = "480MJ"
    data.raw["item"]["charged-speed-battery-pack"].fuel_value = "64MJ"
end

----------------------

if settings.startup["extended-train-spacing"].value == "true" then
    local updated_joint_distance = 5.6
    local updated_connection_length = 3.4
    local updated_collision_box = { { -0.6, -3.4 }, { 0.6, 3.4 } }

    data.raw["locomotive"]["electric-locomotive"].joint_distance = updated_joint_distance
    data.raw["locomotive"]["electric-locomotive"].connection_distance = updated_connection_length
    data.raw["locomotive"]["electric-locomotive"].collision_box = updated_collision_box

    data.raw["locomotive"]["electric-locomotive-wagon"].joint_distance = updated_joint_distance
    data.raw["locomotive"]["electric-locomotive-wagon"].connection_distance = updated_connection_length
    data.raw["locomotive"]["electric-locomotive-wagon"].collision_box = updated_collision_box

    data.raw["cargo-wagon"]["electric-cargo-wagon"].joint_distance = updated_joint_distance
    data.raw["cargo-wagon"]["electric-cargo-wagon"].connection_distance = updated_connection_length
    data.raw["cargo-wagon"]["electric-cargo-wagon"].collision_box = updated_collision_box

    data.raw["fluid-wagon"]["electric-fluid-wagon"].joint_distance = updated_joint_distance
    data.raw["fluid-wagon"]["electric-fluid-wagon"].connection_distance = updated_connection_length
    data.raw["fluid-wagon"]["electric-fluid-wagon"].collision_box = updated_collision_box

    data.raw["artillery-wagon"]["electric-artillery-wagon"].joint_distance = updated_joint_distance
    data.raw["artillery-wagon"]["electric-artillery-wagon"].connection_distance = updated_connection_length
    data.raw["artillery-wagon"]["electric-artillery-wagon"].collision_box = updated_collision_box
end

----------------------
