# macro_log configuration
 This details options for `macro_config.cfg`

This line must be included in `macro_config.cfg`
 - `[include ./macro_config/base_includes.cfg]`

Place includes at the top of the file, and
place all settings between

 - `[gcode_macro _CONFIG]`
 - *your settings*
 - `gcode:`


## Internal
```
# ----- Internal ----- #
variable_log_level: 2
variable_printer_bed_clear     : True

variable_printer_surface       : 'PEI_TEXTURED'
variable_printer_filament      : ['ABS','POLYMAKER','BLACK']
variable_printer_nozzle        : 0.4
```

## General settings
```
# ----- General ----- #
variable_printer_has_chamber   : False
variable_printer_has_mmu       : False

variable_printer_probe         :     0.225
variable_printer_speed         :   700
variable_printer_speed_z       :    35
variable_printer_accel         : 10000
variable_printer_accel_z       :   350
variable_printer_decel_factor  :     0.5
variable_printer_scv           :    20
variable_printer_restore_speed :   150
variable_printer_park_speed    :   150

# If not using filament values, these are defaults
variable_printer_pa            :     0.05
variable_printer_pa_st         :     0.03
```

## Print settings
```
# ----- Print ----- #
variable_print_start_z       : 10
variable_print_start_speed   : 150
variable_print_prime         : 15
variable_print_retract       : 10

variable_print_park          : "FRONT"
variable_print_mesh          : True
variable_print_purge         : True
variable_print_eject         : False
```

## Homing
 - bed_screws: `[include ./macro_config/level/bed_screws.cfg]`
 - quad_gantry_level: `[include ./macro_config/level/quad_gantry_level.cfg]`
 - screws_tilt_adjust: `[include ./macro_config/level/screws_tilt_adjust.cfg]`
 - z_tilt: `[include ./macro_config/level/z_tilt.cfg]`
```
# ----- Homing ----- #
variable_home_safety_height    :   20 # Safe Z height
variable_home_safety_speed     :   30 # X/Y z hop speed
variable_home_accel            : 6000 # X/Y home accel
variable_home_bounce           : True # Bounce off X/Y axis
variable_home_bounce_speed     :  120
# X/Y Sensorless settings
variable_home_sensorless       : True # X/Y
variable_home_wait             :  500 # X/Y home wait in ms (for StallGuard to clear)
# variable_home_x_current        : .7   # X stepper current
# variable_home_y_current        : .7   # Y stepper current
# Z settings
variable_home_z_pos            : {"x": -128, "y": -128}
variable_home_z_hop            :  15 # Z hop
variable_home_z_speed          : 100 # X/Y travel speed
```

## Probe
### Klicky
 - `[include ./macro_config/probe/klicky.cfg]`
```
# ----- Probe ----- #
variable_probe_travel_speed  :  300
variable_probe_dock          : {'x': 67.5, 'y': 300, 'z': -128}
variable_probe_dock_move     : {'x': 50  , 'y':   0, 'z':    0}
variable_probe_attach_move   : {'x':  0  , 'y': -50, 'z':    0}
variable_probe_dock_speed    :  50   # Dock speed
variable_probe_release_speed :  50   # Un-attach speed
```
### TAP
 - `[include ./macro_config/probe/tap.cfg]`
```
variable_probe_temp     : 95
```
### Other
 - `[include ./macro_config/probe/generic.cfg]`

## Retraction
```
# ----- Retraction ----- #
variable_retract_enabled  : True # Firmware retraction
# If not using filament values, these are the defaults
variable_retract_length   :   1
variable_unretract_length :   1
variable_retract_speed    :  30
variable_unretract_speed  :  30
```

## Filament
 - `[include ./macro_config/optional/filament.cfg]`
```
# ----- Filament ----- #
variable_filament_spoolman       : True
variable_filament_melting_pool   :  20 # nozzle tip to just below top of nozzle
variable_filament_cooling_tube   :  64 # nozzle tip to start of bowden tube
variable_filament_park_pos       :  80 # nozzle tip to middle of bowden tube
variable_filament_extruder_gears : 118 # nozzle tip to extruder gears

variable_filament_preload        : 10 # Load extra to ensure grip on filament
variable_filament_unload_eject   : 20 # Unload extra to ensure filament is ejected
variable_filament_wait           :  2
```

## Mesh
 - Adaptive mesh: `[include ./macro_config/optional/mesh_adaptive.cfg]`
```
# ----- Mesh ----- #
variable_mesh          : True
variable_mesh_name     : 'print' # Mesh to load on print start
variable_mesh_adaptive : False   # Requires adaptive mesh
variable_mesh_margin   : 0
variable_mesh_fuzz     : 3
variable_mesh_min_area : 2600    # Adaptibe mesh min area
```

## Purge
 - `[include ./macro_config/optional/purge.cfg]`
```
# ----- Purge ----- #
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
```

## Bucket/Brush
 - Bucket: `[include ./macro_config/optional/bucket.cfg]`
 - Brush: `[include ./macro_config/optional/wipe.cfg]`
 - Brush at temp: `[include ./macro_config/optional/loop.cfg]`
```
# ----- Bucket/Brush ----- #
variable_bucket               : True
variable_bucket_zhop          :    5 # z + zhop = XY Z travel height
variable_bucket_z             :   15 # Bucket park z height
variable_bucket_on_x          : True # true: Move on x, else move on y
variable_bucket_left          :    96 # X left  / Y back
variable_bucket_right         :  204 # X right / Y front
variable_bucket_width         :   70 # bucket width (opposite of axis)
variable_bucket_alt           :  305 # Park pos. If on_x is True, it's the y axis position to park
variable_bucket_speed         : 3000 # Travel XY speed
variable_bucket_speed_z       : 2000 # Travel Z speed

variable_bucket_brush         : True
variable_bucket_brush_on_x    : True    # true: brush longwase on x, else on y
variable_bucket_brush_left    :   135   # brush pos X Left / Y back
variable_bucket_brush_right   :   168   # brush pos X right / Y front
variable_bucket_brush_top     :    2.7  # Z top of brush
variable_bucket_brush_width   :     5   # brush width (opposite of axis)
variable_bucket_brush_alt     :   310   # If on_x, y position to brush
variable_bucket_wipe_speed    :  5000   # Nozzle wipe speed in mm/min
variable_bucket_wipe_shakes   :     6   # How many nozzle shakes to perform
variable_bucket_wipes         :    12   # How many full wipes to perform
```

## Scrape
 - `[include ./macro_config/optional/scrape.cfg]`
```
# ----- Scrape ----- #
variable_scrape           : False
variable_scrape_dflt_dist :  12
variable_scrape_dflt_y    : 305
variable_scrape_dflt_x    : 150
variable_scrape_dflt_z    :   0.0
variable_scrape_rel_z     : False # If False, ignore z-offset for height
variable_scrape_park_z    :  10
variable_scrape_speed     : 250
variable_scrape_on_y      : True
```

## Eject
 - `[include ./macro_config/optional/eject.cfg]`
 - Eject at temp: `[include ./macro_config/optional/loop.cfg]`
```
# ----- Eject ----- #
variable_eject       : False
variable_eject_speed :  20
```

## Fans
 - `[include ./macro_config/optional/fans/*.cfg]`
 - Automatic control: `[include ./macro_config/optional/loop.cfg]`
### NEVERMORE
```
# ----- NEVERMORE ----- #
variable_nevermore             : True
variable_nevermore_fan         : 'fan_generic nevermore'
variable_nevermore_name        : 'nevermore'
variable_nevermore_speed       : 0.8
variable_nevermore_replace_in  : 50 # Hours
variable_nevermore_replacement : 'M117 Replace NEVERMORE carbon'
variable_nevermore_time        : -1 # Placeholder
variable_nevermore_filaments   : ['ABS']
```
### Bed Fans
```
# ----- BED FANS ----- #
variable_bedfans           : True
variable_bedfans_name      : 'bed_fans'
variable_bedfans_threshold : 60    # Bed target temp above, enable fans
variable_bedfans_heating   : 0.5   # Fan speed while bed is heating
variable_bedfans_target    : 0.2   # Fan speed once bed temp is reached
```
### MCU Fans
```
# ----- MCU Fans ----- #
variable_mcufans       : False
variable_mcufans_name  : 'mcu_fans'
variable_mcufans_idle  : 60
variable_mcufans_off   : 70
variable_mcufans_print : 55
```

## Image
### Beeper
 - `[include ./macro_config/optional/image/beeper.cfg]`
```
# ----- Beeper ----- #
variable_beeper          : True
variable_beeper_dflt_frq : 1000 # Tone frequency; Use if S is omitted.
variable_beeper_dflt_dur : 100  # Tone duration; Use if P is omitted.
variable_beeper_dflt_vol : 0.1 # Tone volume; Between 0-1, 0.5 is maximum
variable_beeper_name     : '_beeper'
variable_beeper_max_freq : 10000
```

### LEDs
 - `[include ./macro_config/optional/image/leds.cfg]`
```
variable_leds: {
        'Enabled': True,
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
```

## Build Surface
```
# ----- Build surface settings ----- #
# Height is Z-adjust from printer_probe
variable_surfaces: {
        'Enabled': True,
        'PEI_SMOOTH':   {'Height':  0.00 },
        'PEI_TEXTURED': {'Height': -0.05 },
        'G10':          {'Height':  0.00 },
    }
```

## Nozzle values
```
# ----- Nozzle values ----- #
variable_nozzles: {
        'Enabled': True,
        '0.4': {
            'ZAdjust': 0
        }
    }
```

## Filament values
```
# ----- Filament values ----- #
# PA..............Pressure Advance
# PA_ST...........Pressure Advance Smooth Time
# Retract.........Retraction length
# Unretract.......Unretract extra length
# RetractSpeed....Retract speed
# UnretractSpeed..Unretract speed
variable_filaments: {
        'Enabled': True,
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
