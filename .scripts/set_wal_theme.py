import json
import os
import sys

os.system("wal -i "+sys.argv[1])

with open('/home/max/.cache/wal/colors.json') as data_file:
    data = json.load(data_file)

colorscheme = {"icons": ["awesome-fonts"],
                "defaults":{
                    "separator":"◀",
                    "separator-block-width": 0,
                    "suffix":" ",
                    "warning":{"fg": data["special"]["foreground"], "bg": data["colors"]["color2"]},
                    "critical":{"fg": data["special"]["foreground"], "bg": data["colors"]["color3"]},
                    "bg":data["special"]["background"],
                    "fg":data["colors"]["color1"]}}

with open('/usr/share/bumblebee-status/themes/wal.json', 'w') as outfile:
    json.dump(colorscheme, outfile, sort_keys=True, indent=4,
              ensure_ascii=False)
