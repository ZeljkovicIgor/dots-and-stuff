from dotapp import data
from dotapp.utils import copy_file, is_tool


def sync():
    """Go through all listed dots and sync from the system to this repo"""

    for dot_name, dot_files in data.all.items():

        if not is_tool(dot_name):
            print(f"{dot_name} is not installed.")
            return

        for file in dot_files:
            copy_file(file)


def install():
    """docstring for install"""


def update():
    """docstring for update"""
