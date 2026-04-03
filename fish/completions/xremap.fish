complete -c xremap -l device -d 'Limit input devices to the given names or paths. Default is all keyboards' -r
complete -c xremap -l ignore -d 'Ignore input devices with the given names or paths' -r
complete -c xremap -l watch -d 'Watch for new devices or changing configuration files. Default is not watching for either. Examples - xremap --watch config.yml               # watch devices - xremap --watch=config config.yml        # watch configuration files - xremap --watch=config,device config.yml # watch both' -r -f -a "device\t'add new devices automatically'
config\t'reload the config automatically'"
complete -c xremap -l completions -d 'Generate shell completions' -r -f -a "bash\t''
elvish\t''
fish\t''
powershell\t''
zsh\t''"
complete -c xremap -l output-device-name -d 'Choose the name of the created output device. Default is \'xremap\' or \'xremap pid=xx\'' -r
complete -c xremap -l vendor -d 'Choose the vendor value of the created output device. Must be given in hexadecimal with or without a prefix \'0x\'. Default is: 0x1234' -r
complete -c xremap -l product -d 'Choose the product value of the created output device. Must be given in hexadecimal with or without a prefix \'0x\'. Default is: 0x5678' -r
complete -c xremap -l mouse -d 'Listen to mouse devices. Default is false'
complete -c xremap -l list-devices -d 'List info about devices'
complete -c xremap -l device-details -d 'Show device details'
complete -c xremap -l list-windows -d 'List open windows. Use this to get app_class and title. It only works for COSMIC. Since v0.14.10'
complete -c xremap -l no-window-logging -d 'Suppress logging of window title and application changes. Default is false. Since v0.14.10'
complete -c xremap -s h -l help -d 'Print help (see more with \'--help\')'
complete -c xremap -s V -l version -d 'Print version'
