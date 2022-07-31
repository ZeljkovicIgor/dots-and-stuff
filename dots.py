#!/usr/bin/python
""" Script for working with dot files """

from os.path import exists
from posixpath import expanduser
from shutil import copy, which
from filecmp import cmp

data = {
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


def is_tool(name):
    """Check whether `name` is on PATH and marked as executable"""

    return which(name) is not None


def copy_files(files, to_repo=True):
    """Copy tool files from system to repo and reverse"""

    for file in files:
        if not exists(file["path"]):
            print(f"{file['path']}{file['name']} does not exist.")
            continue

        if cmp(
            file["path"] + file["name"],
            file["repo_path"] + file["name"],
            False,
        ):
            print(
                f"{file['name']} files are same in repo and system. No need to copy them."
            )
            continue

        try:
            print(f"Copying {file['name']}...")

            src = file["path"] + file["name"]
            dest = file["repo_path"]

            if not to_repo:
                src = file["repo_path"] + file["name"]
                dest = file["path"]

            file_destination = copy(src, dest)

            print(f"{file['name']} copied from {src} to " + file_destination)
        except Exception as e:
            print("There was an error while copying rofi files: ")
            raise e


def sync_all():
    """Go through all listed dots and sync from the system to this repo"""

    for dot_name, dot_files in data.items():

        if not is_tool(dot_name):
            print(f"{dot_name} is not installed.")
            return

        copy_files(dot_files)


# rofi
def sync_rofi():
    """Copies all rofi files from the system to this repo"""

    if not is_tool("rofi"):
        print("Rofi is not installed.")
        return

    copy_files(data["rofi"])


def sync_zsh():
    """Copies all zsh files from the system to this repo"""
    # proveri postoji li .zshrc
    # sync_ohmyzsh()
    # sync_theme()
    # sync_p10k()
    # kopiraj .zshrc
    # izmeni potrebne reci u fajlu
    pass


def sync_ohmyzsh():
    """Copies all ohmyzsh files from the system to this repo"""
    pass


def sync_theme():
    """docstring for sync_p10k"""
    pass


def sync_p10k():
    """docstring for sync_p10k"""
    pass


def add_aliases_to_zsh():
    """docstring for add_aliases"""
    pass


def sync_konsole():
    """docstring for sync_konsole"""
    pass


def sync_vim():
    """docstring for sync_vim"""
    pass


def sync_neovim():
    """docstring for sync_neovim"""
    pass


sync_all()
