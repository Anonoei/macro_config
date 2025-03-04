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

## Issues
 If you encounter any issues, please install [macro_log](github.com/anonoei/macro_log), and share `ml.log`
