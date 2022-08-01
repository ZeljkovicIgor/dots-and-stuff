from os.path import expanduser


all = {
    "rofi": [
        {
            "path": expanduser("~/.config/rofi/"),
            "repo_path": "./rofi/",
            "name": "config.rasi",
        },
        {
            "path": "/usr/share/rofi/themes/",
            "repo_path": "./rofi/",
            "name": "onedark-igor.rasi",
        },
    ],
}

rofi = all["rofi"] if "rofi" in all.keys() else None
zsh = all["zsh"] if "zsh" in all.keys() else None
