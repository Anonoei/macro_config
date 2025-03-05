# Macro Config
 Modular klipper macro configuration

## Moonraker update manager
```
[update_manager macro_config]
type: git_repo
path: ~/printer_data/config/macro_config
origin: https://github.com/anonoei/macro_config.git
primary_branch: main
install_script: install.sh
managed_services: klipper
```

## Installation
```
cd ~/printer_data/config
git clone https://github.com/Anonoei/macro_config.git
cd macro_config
./install.sh
```

### Configuration
 1. Add `[include macro_config.cfg]` to your printer.cfg
 2. Edit `macro_config.cfg` for your printer
    - See [configuration.md](https://github.com/Anonoei/macro_config/blob/main/configuration.md) for more information
    - Check [_examples/settings.cfg](https://github.com/Anonoei/macro_config/blob/main/_examples/settings.cfg) for the default config
    - Check [_examples/extras.cfg](https://github.com/Anonoei/macro_config/blob/main/_examples/extras.cfg) for recommended klipper includes/settings

#### Examples
 - Voron 2.4 DOOMCUBE [Palladium](https://github.com/Anonoei/Palladium/blob/main/printer_data/config/macro_config.cfg)
 - Sovol SV07 Plus [Rhodium](https://github.com/Anonoei/Rhodium/blob/main/printer_data/config/macro_config.cfg)

## Issues
 If you encounter any issues, please install [macro_log](github.com/anonoei/macro_log), and share `ml.log`
