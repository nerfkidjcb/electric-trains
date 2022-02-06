function registerLocomotive(data)
    local newLocomotive = data
    if game.entity_prototypes[data[1]].valid then
        if data[2] ~= nil and game.item_prototypes[data[2]].valid then
            newLocomotive[3] = game.item_prototypes[data[2]].fuel_value
        else
            newLocomotive[2] = "No storage"
            newLocomotive[3] = 0
        end
        if global.locomotiveList == nil then
            global.locomotiveList = {}
        end
        table.insert(global.locomotiveList, newLocomotive)
    end
end

remote.add_interface("space-trains", {
    status = function()
        debugLog("Charging trains: " .. table.tostring(global.chargingTrains))
        debugLog("EEIs: " .. table.tostring(game.surfaces[1].find_entities_filtered {
            name = "space-locomotive-charging-dummy"
        }))
        debugLog("Locomotive dictionary: " .. table.tostring(global.locomotiveList))
    end,

    register = function(entity_name, dummy_fuel_name)
        registerLocomotive({entity_name, dummy_fuel_name})
    end
})

local waitStation = defines.train_state.wait_station

script.on_init(function()
    global.chargingTrains = {}
    global.locomotiveList = {}
end)

script.on_load(function()
    if next(global.chargingTrains) ~= nil then
        script.on_nth_tick(23, tick)
    end
end)

script.on_configuration_changed(function()
    global.locomotiveList = {}
    registerLocomotive({"space-locomotive", "space-locomotive-fuel-dummy"})
end)

function locomotiveMatch(entity_name)
    for i, v in pairs(global.locomotiveList) do
        if v[1] == entity_name then
            return true
        end
    end
end

function entity_built(event)
    if locomotiveMatch(event.created_entity.name) then
        event.created_entity.burner.currently_burning = "space-locomotive-fuel-dummy"
        event.created_entity.burner.remaining_burning_fuel = 100000
    end
end
script.on_event(defines.events.on_built_entity, entity_built)
script.on_event(defines.events.on_robot_built_entity, entity_built)

function train_changed_state(event)
    if event.train.state == waitStation then
        local locomotives = {}
        for i, v in pairs(event.train.locomotives) do -- for the list of locomotives...
            for j, w in pairs(v) do -- for the forward/backward sublists of locomotives in that list...
                for k, x in pairs(global.locomotiveList) do -- if it shows up in the registered list of chargeable locomotives...
                    if x[1] == w.name and x[3] > 0 and x[3] > w.burner.remaining_burning_fuel then -- AND has internal max storage greater than whatever it's using now, add to the charging list
                        if w.burner.currently_burning ~= nil and w.burner.currently_burning.name ~= x[2] then
                            local burnt_result = game.item_prototypes[w.burner.currently_burning.name].burnt_result
                            if burnt_result ~= nil then
                                w.burner.burnt_result_inventory.insert({
                                    name = burnt_result.name
                                })
                                w.burner.currently_burning = x[2]
                            end
                        end
                        local charger = game.surfaces[w.surface.index].create_entity {
                            name = "space-locomotive-charging-dummy",
                            position = w.position,
                            force = w.force
                        }
                        charger.electric_buffer_size = x[3]
                        charger.energy = w.burner.remaining_burning_fuel
                        table.insert(locomotives, {w, charger, x[3]})
                        break
                    end
                end
            end
        end

        if next(locomotives) ~= nil then
            global.chargingTrains[event.train.id] = {event.train, locomotives}
            activateTicker()
        end
    elseif event.old_state == waitStation and global.chargingTrains[event.train.id] ~= nil then
        for i, v in pairs(global.chargingTrains[event.train.id][2]) do
            v[2].destroy()
        end
    end
end
script.on_event(defines.events.on_train_changed_state, train_changed_state)

function activateTicker()
    if next(global.chargingTrains) ~= nil then
        script.on_nth_tick(23, tick)
    end
end

function tick()
    for i, v in pairs(global.chargingTrains) do
        if not v[1].valid or v[1].state ~= waitStation or #v[2] == 0 then
            for j, w in pairs(v[2]) do
                w[2].destroy()
            end
            global.chargingTrains[i] = nil
        else
            for j, w in pairs(v[2]) do
                w[1].burner.remaining_burning_fuel = w[2].energy
                if w[1].burner.remaining_burning_fuel == w[3] then
                    w[2].destroy()
                    table.remove(v[2], j)
                end
            end
        end
    end

    if next(global.chargingTrains) == nil then
        script.on_nth_tick(nil)
    end
end
