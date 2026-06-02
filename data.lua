require("prototypes/entities/charging-station")
require("prototypes/entities/electric-trains-and-wagons")

require("prototypes/battery-pack/battery-pack-acceleration")
require("prototypes/battery-pack/battery-pack-alkaline")
require("prototypes/battery-pack/battery-pack-efficiency")
require("prototypes/battery-pack/battery-pack-electric")
require("prototypes/battery-pack/battery-pack-speed")
require("prototypes/battery-pack/category")

require("prototypes/technology/technology")

if mods["elevated-rails"] then
    require("__electric-trains__.prototypes.entities.sloped-electric-trains-updates").apply_all_base()
end
