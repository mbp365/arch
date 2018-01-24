import json
import os
import sys

os.system("wal -i " + sys.argv[1])

with open('/home/max/.cache/wal/colors.json') as data_file:
    data = json.load(data_file)

colorscheme = {"icons": ["awesome-fonts"],
               "defaults": {
                   "padding": " ",
                   "separator": "◀",
                   "separator-block-width": 0,
                   "warning": {"fg": data["special"]["foreground"], "bg": data["colors"]["color2"]},
                   "critical": {"fg": data["special"]["foreground"], "bg": data["colors"]["color3"]},
                   "bg": data["special"]["background"],
                   "fg": data["colors"]["color1"]},
               "mpd": {"padding": "",
                       "playing": {"prefix": " "},
                       "paused": {"prefix": " "},
                       "stopped": {"prefix": ""},
                       "prev": {"prefix": ""},
                       "next": {"prefix": ""},
                       "shuffle-on": {"prefix": ""},
                       "shuffle-off": {"prefix": ""},
                       "repeat-on": {"prefix": "  "},
                       "repeat-off": {"prefix": "  "}
                       }
               }

with open('/usr/share/bumblebee-status/themes/wal.json', 'w') as outfile:
    json.dump(colorscheme, outfile, sort_keys=True, indent=4,
              ensure_ascii=False)
with open('/home/max/.config/cava/config_template', 'r') as myfile:
    text_data = myfile.read()
with open('/home/max/.config/cava/config', 'w') as myfile:
    myfile.write(text_data.format(data["colors"]["color1"],data["colors"]["color3"]))
