"""Module with methods for rofi"""
from dotapp import data
from dotapp.utils import copy_file, is_tool


def sync():
    """Copies all rofi files from the system to this repo"""

    if not is_tool("rofi"):
        print("Rofi is not installed.")
        return

    if not data.rofi:
        print("No information about rofi in database")
        return

    for file in data.rofi:
        copy_file(file)


def update():
    """docstring for update"""


def install():
    """docstring for install"""
