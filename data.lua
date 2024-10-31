-- -- Mod assertions
-- require(kr_data_compatibility_path .. "mod-assertions")
---------------------------------------------------------------------------
-- -- -- CONTENTS INITIALIZATION (data stage)
---------------------------------------------------------------------------
-- -- Adding new achievements
require("prototypes/prototype-initialization")
require("vanilla-changes/recipes")

if mods["elevated-rails"] then
    require(
        "__electric-trains__.prototypes.entities.sloped-electric-trains-updates").apply_all_base()
end

data:extend({
    {type = "fuel-category", name = "electrical"},
    {type = "recipe-category", name = "electrical"},
    {type = "recipe-category", name = "faster-electrical"}
})
