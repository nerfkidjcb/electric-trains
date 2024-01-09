# Factorio Electric Train Mod

![thumbnail](thumbnail.png)

This mod adds electric trains to the game. It is based on the original [Space train](https://mods.factorio.com/mod/se-space-trains) mod by FragJacker.

Electric Trains was created for both my love of the vanilla game, but my obsession with train logistics. I rebranded "Space train" from the original mod along with some recipe, physical and entity tweaks, since I wanted this mod to feel more down to earth. (Literally). I also love the idea of adding a new logistical fuelling challenge to the game.

The reward for both the resource and infrastructure expense is slightly faster, and cool sounding/looking locomotives.

The original idea for a new infinite research was going to be a max speed modifier, but unfortunately the game doesn't allow for that. So I decided to go with a braking force modifier instead.

Once again I would like to thank FragJacker for creating the original mod, and for allowing me to fork it.

## Features

- Electric train research, which unlocks the electric locomotive and electric cargo and fluid wagons. These can run on your existing rail network. The electric locomotive has about a 20% increase in power to weight ratio over the vanilla locomotive and a 518Km/h max speed but uses a lot of Train Powerpacks.

  ![Electric Locomotive](graphics/icons/space-locomotive.png)
  ![Electric Cargo Wagon](graphics/icons/space-cargo-wagon.png)
  ![Electric Fluid Wagon](graphics/icons/space-fluid-wagon.png)

- Train Powerpacks (stack-size 60-Empty 20-Charged 20-Destroyed), that are charged in a new Train Powerpack Charging Station or an Experimental Train Powerpack Charging Station. These are used to power the electric trains. The Train Powerpack Charging Station is a new building that is unlocked with the electric train research. It can charge 3X faster than normal but has an increased chance of destroying the powerpack and a large energy consumption.

  ![Discharged Powerpack](graphics/icons/discharged-battery.png)

  ![Powerpack Charging Station](graphics/icons/space-train-charging-station.png)
  ![Charged Powerpack](graphics/icons/battery.png)

Or,

![Experimental Powerpack Charging Station](graphics/icons/experimental-space-train-charging-station.png)
![Experimental Charged Powerpack](graphics/icons/fast-battery.png)

- (0.1.2+) an Experimental Train Powerpack Charging Station which works much faster, but uses considerably more power, and has a much higher chance of destroying the powerpack.

- Train PowerPacks have a 1% chance of becoming destroyed when charging normally, and a 15% chance of becoming destroyed when charging in the experimental charging station.

  ![Destroyed Powerpack](graphics/icons/destroyed-battery.png)

- You can refurbish old powerpacks in a vanilla chemical plant with a new recipe.

  ![Refurbished Powerpack](public/refurbishment.png)

- Electric trains have subtly different MiniMap icons to distinguish them from vanilla trains:

  ![MiniMap Icons](graphics/entity/vehicles/space-trains/space-locomotive-minimap-representation.png)
  ![MiniMap Icons](graphics/entity/vehicles/space-trains/space-cargo-wagon-minimap-representation.png)
  ![MiniMap Icons](graphics/entity/vehicles/space-trains/space-fluid-wagon-minimap-representation.png)

- Electric Wagon Locomotive, which is the same as a normal Electric Locomotive with the visual properties of an Electric Wagon. You can also select the colour of the entity.

  ![Electric Wagon Locomotive](graphics/icons/electric-locomotive-wagon.png)

- New infinite research to increase the braking force of trains as a result of your testing and research into the new electric trains.

- ![Electric Tech](public/technology.png)

## Planned Features

- Long distance locomotives that have a greater fuel slot size? (Maybe)
- Express versions of the electric locomotive and wagons that are even faster, but use more powerpacks? (Maybe)

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for details.

## Contributing

Contributions are welcome. Please feel free to open an issue or submit a pull request. :)
