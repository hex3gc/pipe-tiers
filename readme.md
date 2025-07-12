# Pipe Tiers
When using various mods that add new pipes to the game, I felt there was a lack of progression to make anything but the default iron pipes worth using. To make high-tech modded pipes an appealing option, they are each assigned a **tier** which grants them different extents and pumping speeds:

#### Tier 1 - Basic
*Early game iron pipes with reduced stats.*

Max. extent: **128**
Pump speed: **600**

> Examples: Vanilla iron pipes

#### Tier 2 - Mid-level
*Mid-tech, more expensive pipes that inherit similar stats to vanilla.*

Max. extent: **256**
Pump speed: **1200**

> Examples: K2 Steel Pipes, Pyanodons niobium pipes

#### Tier 3 - Advanced
*High-tech utility pipes with a significant edge over vanilla.*

Max. extent: **512**
Pump speed: **2400**

> Examples: Paracelsin zinc pipes, Pyanodons multi-purpose pipes

#### Tier 4 - Mass Fluid Transportation
*Big pipes with massive throughput, satisfying all your fluid moving needs.*

Max. extent: **8192**
Pump speed: **24000**

> Examples: Fluid Must Flow ducts

![image](https://github.com/hex3gc/pipe-tiers/blob/main/images/pipeTiers_img1.png)

If you don't like any of the numbers, they're easy to change. See **Configuration**.

### Usage
When added to vanilla Factorio, this mod doesn't do much except downgrade your pipes. It's intended to be included in a larger set of mods to make their additions more valuable. The below example uses [K2 Steel Pipes](https://mods.factorio.com/mod/k2-steel-pipes), [Planet Paracelsin](https://mods.factorio.com/mod/Paracelsin), and [Planet Maraxsis](https://mods.factorio.com/mod/maraxsis) with [Fluid Must Flow](https://mods.factorio.com/mod/FluidMustFlow), forming a nice progression.

![image](https://github.com/hex3gc/pipe-tiers/blob/main/images/pipeTiers_imgProgression.png)

I highly recommend at least using K2 Steel Pipes since they're configured to have similar stats to vanilla pipes by default, or using something else you can assign to Tier 2.

### Configuration
Each tier has its own **pipeline extent** and **pump speed**:

> **Extent** is the maximum size of a pipeline. For example, the default value of 128 for Tier 1 pipes means that you cannot create a pipeline larger than 128 pipes in length or width. If you add a Tier 1 pipe to a length of Tier 3s, the entire line will be downgraded to Tier 1 extent.

> **Pump speed** determines how much fluid is moved through a pump per second, limiting the throughput of the pipe tier by its pumps. Vanilla pumps are at a higher tier by default due to there being no built-in alternatives.

![image](https://github.com/hex3gc/pipe-tiers/blob/main/images/pipeTiers_imgConfig.png)

The settings to configure these for your pipes include:
> **Default tier:** All pipes not covered by the mod are assigned to this tier.

> **Custom overrides:** See **Adding custom pipes**.

> **Tier options:** With the drop-down options you can assign each type of pipe per-mod to a different tier.

> **Pipe extent/speed options:** Here you can change the values for each tier.

Mod options will show/hide automatically depending on which mods are installed.

### Adding custom pipes
Adding pipes from non-supported mods or overriding existing tier settings can be done through the **Custom overrides** entries on the mod settings menu. Just add the entity name of any pipe, tank or pump and its settings will be overwritten with those from the given tier. **Entity names must be separated by commas.**

![image](https://github.com/hex3gc/pipe-tiers/blob/main/images/pipeTiers_imgOverrides.png)

You can find the entity name of any building by pressing **F4** to open the debug menu, enabling **show-debug-info-in-tooltips**, and hovering over the building with your cursor.

![image](https://github.com/hex3gc/pipe-tiers/blob/main/images/pipeTiers_imgEntityNames.png)

### Special thanks

- **notnotmelon** for writing [Extents Begone](https://mods.factorio.com/mod/extents-begone), which I adapted most of the extent updating code from.