# Reference

## base
### aliases
- `STEPPERS_OFF`, runs M84 to turn steppers off
- `ESTOP`, runts M112 to emergency stop

### config
- `GET_CONFIG SECT=<section> NAME=<name> [SAVED=0]`, get an item from the configuration
  - `<section>`: the section of the config, such as `SECT=PRINT`, or `SECT=HOMING`
  - `<name>`: the name of the key
  - If `SAVED=1`, print the saved value instead of runtime value
- `SET_CONFIG SECT=<section> NAME=<name> TO=<value> [SAVE=0] [PRINT=0]`, set an item in the configuration
  - `<section>`: the section of the config, such as `SECT=PRINT`, or `SECT=HOMING`
  - `<name>`: the name of the key
  - `<value>`: what to set it to
  - If `SAVE=1`, additionally write the value to saved variables
  - If `PRINT=1`, after setting, runs `GET_CONFIG SECT=<section> NAME=<name>`

### park
- `PARK [POS=<position>]`, park the toolhead
  - `<position>`: where to park, defaults to parking in the center
  - If `<position>` is `PRINT`, park at `_CONFIG_PRINT.park`, and don't move Z below print height
  - If `<position>` is `BUCKET`, runs `_PARK_BUCKET`
  - Z position
    - If `TOP` in `<position>`, move to 90% max Z
    - If `BOTTOM` in `<position>`, move to 10% max Z
  - Y position
    - If `FRONT` in `<position>`, move to `min Y + _CONFIG.park_margin`
    - If `BACK` in `<position>`, move to `max Y - _CONFIG.park_margin`
  - X position
    - If `LEFT` in `<position>`, move to `min X + _CONFIG.park_margin`
    - If `RIGHT` in `<position>`, move to `max X - _CONFIG.park_margin`

### QoL
- `OFF_IN [T=15]`
   - `T` is how many minutes to wait before turning off
   - If `T=0`, disable the timer
- `FORCE_HOME`, cancels macro if printer isn't currently homed
- `FORCE_CLEAR`, cancels macro if printer bed isn't cleared
- `BED_CLEARED`, sets the BED_CLEARED flag to true
- `BED_STATUS`, shows BED_CLEARED status

### sync
- `SET_SURFACE [MATERIAL=_CONFIG_BASE.surface]`, tweaks Z-offset based on bed surface material
   - Materials and offsets are set in `_CONFIG_SURFACES`
- `SET_FILAMENT MATERIAL=<material> BRAND=<brand> [COLOR=<color>]`, tweaks pressure advance and retraction based on filament type
   - If `<material>` is unspecified or `NONE`, reset filament configuration
   - Materials and brands are specified in `_CONFIG_FILAMENTS`
- `SET_NOZZLE [DIAMETER=_CONFIG_BASE.nozzle]`, tweaks Z-offset based on nozzle diameter
   - Nozzle sizes and offsets are configured in `_CONFIG_NOZZLES`

## level
## move
### leveling
- `LEVEL`, levels the printer, based on which configuration was included in `macro_config/level`
- `LEVEL_MANUAL`, runs manually leveling
- `CLEVEL`, runs `LEVEL` if the printer isn't already leveled

## optional
### image
#### beeper
- `PLAY NOTE=<note> [OCTAVE=4] [DURATION=_CONFIG_BEEPER.dflt_dur] [VOLUME=_CONFIG_BEEPER.dflt_vol]`
  - `<note>` is one of c|bs, cs|df, d, ds|ef, e|ff, f|es, fs, g, gs, a, as, b|cf
    - bs means B sharp, and cf means C flat

### mmu
#### QoL
- `SET_MMU_GATE GATE=<gate> [SPOOL_ID=-1] [AVAIL=1] [MATERIAL=] [BRAND=] [COLOR=]`
  - If `MATERIAL=`, `BRAND=` and `COLOR=` are not specified, runs `MMU_GATE_MAP GATE= SPOOLID= AVAILABLE=`
- `MMU_GATES [GATE=-1] [MATERIAL=NONE]`, prints the status of MMU gates
  - With no arguments, prints status of every gate
  - If `MATERIAL` is provided, prints only gates matching the material
- `VERIFY_TOOL MATERIAL=<material> [BRAND=NONE] [COLOR=none]`, checks if selected tool matches paramaters

### fans
- `RESET_FILTER`, resets filter timer
- `QUERY_FILTER`, shows filter runtime

### filament
- `FILAMENT_LOAD [TEMP=235]`, helper for loading filament
- `FILAMENT_UNLOAD [TEMP=235]`, helper for unloading filament
- `FILAMENT_CHANGE [TEMP=235]`, runs `FILAMENT_UNLOAD`, waits for `_CONFIG_FILAMENT.wait` seconds before `FILAMENT_LOAD`

### heatsoak
- `SOAK_BED [TEMP=110] [TIME=15]`, heat-soaks bed for `TIME` minutes
- `SOAK_CHAMBER [BED_TEMP=110] [TEMP=40] [TIME=15] SENSOR=<sensor>`, heat-soaks chamber
- `SOAK_INT [TARGET=110] [TIME=15]`, interruptable heat-soak for `TIME` minutes
- `SOAK_INT_CANCEL`, cancels `SOAK_INT`, if it's running

### loop
- `DELAYED_WIPE TEMP=<temp>`, runs `NOZZLE_WIPE` once hotend reaches `<temp>`
- `DELAYED_EJECT TEMP=<temp>`, runs `EJECT_PARTS`, once hotend reaches `<temp>`

### wipe
- `NOZZLE_WIPE [SHAKES=_CONFIG_WIPE.shakes] [WIPES=_CONFIG_WIPE.wipes] [SPEED=_config_WIPE.speed]`, wipes nozzle on brush


## print
## probe
