
-- Inherit the base locomotive equipment grid.
local function inherit_grid(base_name, copy_to_name)
  -- Ensure that base technologies exist.
  if not data.raw[base_name] or not data.raw[base_name][base_name] or not data.raw[base_name][copy_to_name] then
    log("Technology doesn't exist")
    return
  end

  -- Skip inheriting if something else has already given the prototype an equipment grid.
  if data.raw[base_name][copy_to_name].equipment_grid then
    log("New prototype already has a grid.")
    return
  end

  -- We also only want to inherit if there's something *to* inherit.
  local new_grid = data.raw[base_name][base_name].equipment_grid
  if not new_grid then
    log("Existing prototype '" .. base_name .. "' does not have an equipment grid.")
    return
  end

  data.raw[base_name][copy_to_name].equipment_grid = new_grid
  log("Successfully inherited equipment grid '" .. new_grid .. "' from " .. base_name .. " to " .. copy_to_name .. ".")
end

inherit_grid("locomotive", "electric-locomotive")
inherit_grid("cargo-wagon", "electric-cargo-wagon")
inherit_grid("fluid-wagon", "electric-fluid-wagon")
