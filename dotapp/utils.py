"""Module with useful functions to use throughout the project"""


from filecmp import cmp
import os
from os.path import exists
from shutil import copy, which


def is_tool(name):
    """Check whether `name` is on PATH and marked as executable"""

    return which(name) is not None


def copy_file(file, to_repo=True):
    """Copy tool files from system to repo and reverse"""

    if not exists(file["path"]):
        print(f"{file['path']}{file['name']} does not exist.")
        return

    if cmp(
        file["path"] + file["name"],
        file["repo_path"] + file["name"],
        False,
    ):
        print(
            f"{file['name']} files are same in repo and system. No need to copy them."
        )
        return

    try:
        print(f"Copying {file['name']}...")

        src = file["path"] + file["name"]
        dest = file["repo_path"]

        if not to_repo:
            src = file["repo_path"] + file["name"]
            dest = file["path"]

        file_destination = copy(src, dest)

        print(f"{file['name']} copied from {src} to " + file_destination)

        return src, file_destination
    except Exception as e:
        print("There was an error while copying rofi files: ")
        raise e


def prepare_for_repo(filename):
    """docstring for prepare_for_repo"""

    with open(filename, "r") as f:
        lines = f.readlines()
    with open(filename, "w") as f:
        is_ignore = False
        for line in lines:
            if "!ignorestart!" in line:
                is_ignore = True
                continue
            elif "!ignoreend!" in line:
                is_ignore = False
                continue

            if "!ignoreline!" in line or is_ignore:
                continue

            if os.getlogin() in line:
                f.write(line.replace(os.getlogin(), "USERNAME"))
                continue

            f.write(line)
