from os.path import expanduser
from dotapp.dot import Dot


DATA = [
    {
        "name": "rofi",
        "text": "Rofi",
        "class": Dot,
        "files": [
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
    },
    {
        "name": "zsh",
        "text": "Zsh",
        "class": Dot,
        "files": [{"path": expanduser("~/"), "repo_path": "./", "name": ".zshrc"}],
    },
]
