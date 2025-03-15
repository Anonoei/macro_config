# macro_log configuration
 Below are valid configurations for `macro_config.cfg`

This line must be included in `macro_config.cfg`
 - `[include ./macro_config/base_includes.cfg]`

## Slicer
### SuperSlicer
#### Printer Settings
##### Start G-Code
```
SET_NOZZLE DIAMETER={nozzle_diameter[initial_extruder]}
PRE_PRINT BED_TEMP=[first_layer_bed_temperature] HOTEND_TEMP={first_layer_temperature[initial_extruder] + extruder_temperature_offset[initial_extruder]} CHAMBER_TEMP={chamber_temperature} TOOL_MACRO="{start_filament_gcode[initial_extruder]}"
PRINT_START
```
##### End G-Code
```
PRINT_END
```
##### Before layer change G-code
```
_LAYER_BEFORE_CHANGE HEIGHT=[layer_z] LAYER=[layer_num]
```
##### After layer change G-code
```
_LAYER_AFTER_CHANGE
```
##### Pause print G-code
```
PAUSE
```
#### Filament settings (if using MMU)
##### Start G-code
Set the material, brand, and color to match _CONFIG_FILAMENTS
```
SET_TOOL MATERIAL='ABS' BRAND='POLYMAKER' COLOR='101820'
```

## Jump to section
 - Required sections
   - [General](#General)
   - [Hardware](#Hardware)
   - [Print](#Print)
   - [Homing](#Homing)
   - [Probe](#Probe)
     - [Dockable](#Dockable)
     - [TAP](#TAP)
     - [Klicky](#Klicky)
     - [Generic](#Generic)
 - Optional sections
   - [Filament](#Filament)
   - [Mesh](#Mesh)
   - [Purge](#Purge)
   - [Bucket](#Bucket)
   - [Wipe](#Wipe)
   - [Surfaces](#Surfaces)
   - [Nozzles](#Nozzles)
   - [Filaments](#Filaments)
   - [Scrape](#Scrape)
   - [Eject](#Eject)
   - [Fans](#Fans)
   - [Image](#Image)
     - [Beeper](#Bepper)
     - [LEDs](#LEDs)

## General
```
# ----- General ----- #
[gcode_macro _CONFIG]
variable_probe         :     -0.370

variable_speed         :   700
variable_speed_z       :    35
variable_accel         : 10000
variable_accel_z       :   350
variable_decel_factor  :     0.5
variable_scv           :    20

variable_restore_speed :   100
variable_park_speed    :   100
variable_park_margin   :    10

# If not using _CONFIG_FILAMENTS, these are defaults
variable_retract_enabled  : True # Firmware retraction
variable_retract_length   :   1
variable_unretract_length :   1
variable_retract_speed    :  30
variable_unretract_speed  :  30

variable_pa            :     0.05
variable_pa_st         :     0.03

# Temperature adjustments from slicer gcode
# variable_temp_hotend   :  15
# variable_temp_bed      :  0

# variable_idle_current  : 0.2
gcode: # -- END CONFIG
```

## Hardware
```
# ----- Hardware ----- #
[gcode_macro _CONFIG_HARDWARE]
variable_has_chamber   : True
variable_has_mmu       : False
variable_steppers      : "x", "y", "z", "z1", "z2", "z3"
gcode: # -- END CONFIG
```

## Print
```
# ----- Print ----- #
[gcode_macro _CONFIG_PRINT]
variable_start_z       : 10
variable_start_speed   : 150
variable_prime         : 15
variable_retract       : 10

variable_park          : "BUCKET"
variable_mesh          : True
variable_purge         : True
variable_eject         : False
variable_wait          : 1000
gcode: # -- END CONFIG
```

## Homing
```
# ----- Homing ----- #
#[include ./macro_config/level/bed_screws.cfg]
#[include ./macro_config/level/quad_gantry_level.cfg]
#[include ./macro_config/level/screws_tilt_adjust.cfg]
#[include ./macro_config/level/z_tilt.cfg]
[gcode_macro _CONFIG_HOMING]
variable_safety_height    :   20 # Safe Z height
variable_speed_z          :   30 # Z hop speed
variable_speed_xy         :   50 # X/Y move speed
variable_accel            : 6000 # X/Y home accel
variable_bounce           : True # Bounce off X/Y axis
variable_bounce_speed     :  120
variable_use_offsets      : True
# X/Y Sensorless settings
variable_sensorless       : True # X/Y
variable_wait             :  500 # X/Y home wait in ms (for StallGuard to clear)
# variable_home_x_current        : .7   # X stepper current
# variable_home_y_current        : .7   # Y stepper current
# Z settings
variable_z_pos            : -128, -128 # X, Y pos, -128 means middle of axis
variable_z_hop            :  15 # Z hop
gcode: # -- END CONFIG
```

## Probe
### Dockable
```
# ----- Probe ----- #
[include ./macro_config/probe/dockable.cfg]
[gcode_macro _CONFIG_PROBE]
variable_dock_pos     : 103, 280, 0
variable_approach_pos : 103, 230, 0
variable_detach_pos   : 150, 280, 0

# variable_probe_extract_pos:
# variable_probe_insert_pos:
variable_travel_speed: 1000
variable_attach_speed: 50
variable_detach_speed: 50
gcode: # -- END CONFIG
```

### TAP
```
# ----- Probe ----- #
[include ./macro_config/probe/tap.cfg]
[gcode_macro _CONFIG_PROBE]
variable_probe_temp     : 95
gcode: # -- END CONFIG
```

### Klicky
 *Use [Dockable](#Dockable) instead*
```
# ----- Probe ----- #
[include ./macro_config/probe/klicky.cfg]
[gcode_macro _CONFIG_PROBE]
variable_travel_speed  :  300
variable_dock          : {'x': 67.5, 'y': 300, 'z': -128}
variable_dock_move     : {'x': 50  , 'y':   0, 'z':    0}
variable_attach_move   : {'x':  0  , 'y': -50, 'z':    0}
variable_dock_speed    :  50   # Dock speed
variable_release_speed :  50   # Un-attach speed
gcode: # -- END CONFIG

```
### Generic
```
# ----- Probe ----- #
[include ./macro_config/probe/generic.cfg]
[gcode_macro _CONFIG_PROBE]
gcode: # -- END CONFIG
```

## Filament
```
# ----- Filament ----- #
[include ./macro_config/optional/filament.cfg]
[gcode_macro _CONFIG_FILAMENT]
variable_filament_spoolman       : True
variable_filament_preload        : 10 # Load extra to ensure grip on filament
variable_filament_unload_eject   : 20 # Unload extra to ensure filament is ejected
variable_filament_wait           :  2

variable_melting_pool   :  20 # nozzle tip to just below top of nozzle
variable_cooling_tube   :  64 # nozzle tip to start of bowden tube
variable_park_pos       :  80 # nozzle tip to middle of bowden tube
variable_extruder_gears : 118 # nozzle tip to extruder gears
gcode: # -- END CONFIG
```

## Mesh
```
# ----- Mesh ----- #
#[include ./macro_config/optional/mesh_adaptive.cfg]
[gcode_macro _CONFIG_MESH]
variable_enabled           : True
variable_load_name         : 'print'
# Adaptive bed mesh settings
variable_adaptive          : False
variable_adaptive_margin   : 0
variable_adaptive_fuzz     : 3
variable_adaptive_min_area : 400
gcode: # -- END CONFIG
```

## Purge
```
# ----- Purge ----- #
[include ./macro_config/optional/purge.cfg]
[gcode_macro _CONFIG_PURGE]
variable_purge             : True
variable_purge_margin      :    3   # Distance the purge will be in front of the print area, default is 10.
variable_purge_height      :     0.4 # Z position of nozzle during purge
variable_purge_amount      :    40   # Amount of filament to purge
variable_purge_rate        :    20   # Flow rate of purge in mm3/s
variable_purge_speed_xy    : 10000   # Purge travel xy movement speed
variable_purge_speed_z     :  3000   # Purge travel z movement speed
variable_purge_prime_speed :   150   # Prime extrude speed
variable_purge_prime       :     5   # Prime nozzle before purge
variable_purge_hop         :     5   # Z hop
variable_purge_use_nozzle  : False # Use nozzle height as purge height, requires Nozzle values enabled
gcode: # -- END CONFIG
```

## Bucket
```
# ----- Bucket ----- #
[include ./macro_config/optional/bucket.cfg]
[gcode_macro _CONFIG_BUCKET]
variable_enabled       : True
variable_zhop          :    5 # z + zhop = XY Z travel height
variable_z             :   15 # Bucket park z height
variable_on_x          : True # true: Move on x, else move on y
variable_left          :  120 # X left  / Y back
variable_right         :  204 # X right / Y front
variable_width         :   70 # bucket width (opposite of axis)
variable_alt           :  305 # Park pos. If on_x is True, it's the y axis position to park
variable_speed         : 3000 # Travel XY speed
variable_speed_z       : 2000 # Travel Z speed
gcode: # -- END CONFIG
```
## Wipe
 - Wipe when hotend at temp: `[include ./macro_config/optional/loop.cfg]`
```
# ----- Wipe ----- #
[include ./macro_config/optional/wipe.cfg]
[gcode_macro _CONFIG_WIPE]
variable_enaled  : True
variable_on_x    : True    # true: brush longwise on x, else on y
variable_left    :   135   # brush pos X Left / Y back
variable_right   :   168   # brush pos X right / Y front
variable_top     :    2.7  # Z top of brush
variable_width   :     5   # brush width (opposite of axis)
variable_alt     :   310   # If on_x, y position to brush
variable_speed   :  5000   # Nozzle wipe speed in mm/min
variable_shakes  :     6   # How many nozzle shakes to perform
variable_wipes   :    12   # How many full wipes to perform
gcode: # -- END CONFIG
```

## Scrape
```
# ----- Scrape ----- #
[include ./macro_config/optional/scrape.cfg]
[gcode_macro _CONFIG_SCRAPE]
variable_enabled   : False
variable_dflt_dist :  12
variable_dflt_y    : 305
variable_dflt_x    : 150
variable_dflt_z    :   0.0
variable_rel_z     : False # If False, ignore z-offset for height
variable_park_z    :  10
variable_speed     : 250
variable_on_y      : True
gcode: # -- END CONFIG
```

## Eject
 - Eject when bed at temp: `[include ./macro_config/optional/loop.cfg]`
```
# ----- Eject ----- #
[include ./macro_config/optional/eject.cfg]
[gcode_macro _CONFIG_EJECT]
variable_eject       : False
variable_eject_speed :  20
gcode: # -- END CONFIG
```

## Fans
```
# ----- Fans ----- #
[include ./macro_config/optional/fans.cfg]
[gcode_macro _CONFIG_FANS]
variable_enabled: True
variable_fans: {
        'filter': {
            'nevermore': {
                'name': 'nevermore',
                'type': 'fan_generic',
                'config': {
                    'filaments': ['ABS', 'ASA'],
                    'replace_time': 50,
                    'replace_action': 'M117 Replace filter carbon',
                    'speed': 0.8,
                },
            },
        },
        'heater': {
            'bedfans': {
                'name': 'bed_fans',
                'type': 'fan_generic',
                'config': {
                    'heater': 'heater_bed',
                    'threshold': 60,
                    'speeds': {
                        'idle': 0.0,
                        'heating': 0.5,
                        'reached': 0.2,
                        'cooling': 0.0,
                    },
                },
            },
        },
        'status': {
            'mcufans': {
                'name': 'mcu_fans',
                'type': 'temperature_fan',
                'config': {
                    'type': 'temperature',
                    'status': {
                        'active': 60,
                        'off': 70,
                        'print': 55,
                    },
                },
            },
        },
    }
gcode: # -- END CONFIG
```

## Image
### Beeper
```
# ----- Beeper ----- #
[include ./macro_config/optional/image/beeper.cfg]
[gcode_macro _CONFIG_BEEPER]
variable_enabled  : True
variable_dflt_frq : 1000 # Tone frequency; Use if S is omitted.
variable_dflt_dur : 100  # Tone duration; Use if P is omitted.
variable_dflt_vol : 0.1 # Tone volume; Between 0-1, 0.5 is maximum
variable_name     : '_beeper'
variable_max_freq : 10000
gcode: # -- END CONFIG
```

### LEDs
```
# ----- LEDs ----- #
[include ./macro_config/optional/image/leds.cfg]
[gcode_macro _CONFIG_LEDS]
variable_enabled: True
# 'names' contains an alias for each LED, along with values
#  'name': the name of the pin
#  'type': one of 'pwm', or 'rgb'
#  'status': what to set it to for different statuses
# Current statuses:
#  off on active printing
#   heating homing leveling parking
#   meshing ejecting loading unloading purging cleaning
variable_leds: {
        'names': {
            'caselight': {
                'name': 'caselight',
                'type': 'pwm',
                'status': {
                    'off':      0.0,
                    'on':       0.4,
                    'active':   0.4,
                    'printing': 0.4,
                }
            },
            'logo': {
                'name': 'th_leds',
                'type': 'rgb',
                'idx': 1,
                'status': {
                    'off':       {'r': 0.00, 'g': 0.00, 'b': 0.00, 'w': 0.0},
                    'on':        {'r': 1.00, 'g': 0.00, 'b': 0.00, 'w': 0.5},
                    'active':    {'r': 1.00, 'g': 0.00, 'b': 0.00, 'w': 0.5},
                    'homing':    {'r': 0.50, 'g': 0.50, 'b': 0.00, 'w': 0.8},
                    'leveling':  {'r': 0.50, 'g': 0.20, 'b': 0.00, 'w': 0.8},
                    'meshing':   {'r': 0.50, 'g': 0.80, 'b': 0.00, 'w': 0.8},
                    'heating':   {'r': 1.00, 'g': 0.00, 'b': 0.00, 'w': 0.8},
                    'loading':   {'r': 1.00, 'g': 0.50, 'b': 0.00, 'w': 0.5},
                    'unloading': {'r': 1.00, 'g': 0.00, 'b': 0.50, 'w': 0.5},
                    'printing':  {'r': 0.70, 'g': 0.70, 'b': 0.70, 'w': 0.5},
                    'cleaning':  {'r': 0.50, 'g': 0.00, 'b': 0.50, 'w': 0.8},
                },
            },
            'nozzle_left': {
                'name': 'th_leds',
                'type': 'rgb',
                'idx': '3',
                'status': {
                    'off':       {'r': 0.00, 'g': 0.00, 'b': 0.00, 'w': 0.0},
                    'on':        {'r': 0.80, 'g': 0.00, 'b': 0.00, 'w': 0.0},
                    'active':    {'r': 0.80, 'g': 0.80, 'b': 0.80, 'w': 0.0},
                    'homing':    {'r': 0.80, 'g': 0.80, 'b': 0.80, 'w': 0.0},
                    'leveling':  {'r': 0.80, 'g': 0.80, 'b': 0.80, 'w': 0.0},
                    'meshing':   {'r': 0.80, 'g': 0.80, 'b': 0.80, 'w': 0.0},
                    'heating':   {'r': 0.80, 'g': 0.80, 'b': 0.80, 'w': 0.0},
                    'loading':   {'r': 0.80, 'g': 0.80, 'b': 0.80, 'w': 0.0},
                    'unloading': {'r': 0.80, 'g': 0.80, 'b': 0.80, 'w': 0.0},
                    'printing':  {'r': 0.80, 'g': 0.80, 'b': 0.80, 'w': 0.0},
                    'cleaning':  {'r': 0.80, 'g': 0.80, 'b': 0.80, 'w': 0.0},
                },
            },
            'nozzle_right': {
                'name': 'th_leds',
                'type': 'rgb',
                'idx': '2',
                'status': {
                    'off':       {'r': 0.00, 'g': 0.00, 'b': 0.00, 'w': 0.0},
                    'on':        {'r': 0.00, 'g': 0.00, 'b': 0.80, 'w': 0.0},
                    'active':    {'r': 0.80, 'g': 0.80, 'b': 0.80, 'w': 0.0},
                    'homing':    {'r': 0.80, 'g': 0.80, 'b': 0.80, 'w': 0.0},
                    'leveling':  {'r': 0.80, 'g': 0.80, 'b': 0.80, 'w': 0.0},
                    'meshing':   {'r': 0.80, 'g': 0.80, 'b': 0.80, 'w': 0.0},
                    'heating':   {'r': 0.80, 'g': 0.80, 'b': 0.80, 'w': 0.0},
                    'loading':   {'r': 0.80, 'g': 0.80, 'b': 0.80, 'w': 0.0},
                    'unloading': {'r': 0.80, 'g': 0.80, 'b': 0.80, 'w': 0.0},
                    'printing':  {'r': 0.80, 'g': 0.80, 'b': 0.80, 'w': 0.0},
                    'cleaning':  {'r': 0.80, 'g': 0.80, 'b': 0.80, 'w': 0.0},
                },
            },
        },
    }
gcode: # -- END CONFIG
```

## Surfaces
```
# ----- Surfaces ----- #
[gcode_macro _CONFIG_SURFACE]
variable_enabled: True
# Height is Z-adjust from printer_probe
variable_surfaces: {
        'PEI_SMOOTH':   {'Height':  0.00 },
        'PEI_TEXTURED': {'Height': -0.05 },
        'G10':          {'Height':  0.00 },
    }
gcode: # -- END CONFIG
```

## Nozzles
```
# ----- Nozzles ----- #
[gcode_macro _CONFIG_NOZZLES]
variable_enabled: True
variable_nozzles: {
        '0.4': {
            'ZAdjust': 0
        }
    }
gcode: # -- END CONFIG
```

## Filaments
```
# ----- Filaments ----- #
[gcode_macro _CONFIG_FILAMENTS]
variable_enabled: True
# PA..............Pressure Advance
# PA_ST...........Pressure Advance Smooth Time
# Retract.........Retraction length
# Unretract.......Unretract extra length
# RetractSpeed....Retract speed
# UnretractSpeed..Unretract speed
variable_filaments: {
        'ABS': {
            'POLYMAKER': {
                'PA':              0.050,
                'PA_ST':           0.025,
                'Retract':         0.75,
                'Unretract':       0,
                'RetractSpeed':   35,
                'UnretractSpeed': 35,
            },
            'HATCHBOX': {
                'PA':              0.055,
                'PA_ST':           0.025,
                'Retract':         0.75,
                'Unretract':       0,
                'RetractSpeed':   35,
                'UnretractSpeed': 35,
            },
        },
        'ASA': {},
        'PETG': {
            'POLYMAKER': {
                'PA':              0.04,
                'PA_ST':           0.02,
                'Retract':         3,
                'Unretract':       0,
                'RetractSpeed':   30,
                'UnretractSpeed': 30,
            },
        },
        'PLA': {
            'POLYMAKER': {
                'PA':              0.08,
                'PA_ST':           0.04,
                'Retract':         1.5,
                'Unretract':       0,
                'RetractSpeed':   30,
                'UnretractSpeed': 30,
            },
            'OVERTURE': {
                'PA':              0.08,
                'PA_ST':           0.02,
                'Retract':         3.0,
                'Unretract':       0,
                'RetractSpeed':   30,
                'UnretractSpeed': 30,
            }
        },
        'PLA+': {
            'OVERTURE': {
                'PA':              0.08,
                'PA_ST':           0.02,
                'Retract':         3.0,
                'Unretract':       0,
                'RetractSpeed':   30,
                'UnretractSpeed': 30,
            }
        }
    }
```
