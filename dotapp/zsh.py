from dotapp.utils import copy_file, is_tool, prepare_for_repo
from dotapp import data


def sync():
    """Copies all zsh files from the system to this repo"""
    if not is_tool("zsh"):
        print("Zsh is not installed.")
        return

    if not data.zsh:
        print("No information about zsh in database")
        return

    # sync_ohmyzsh()
    # sync_theme()
    # sync_p10k()

    for file in data.zsh:
        src, dest = copy_file(file)
        prepare_for_repo(f"{dest}.zshrc")


def update():
    """docstring for update"""


def install():
    """docstring for install"""
