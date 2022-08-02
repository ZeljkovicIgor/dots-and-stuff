"""Module with methods for rofi"""
from dotapp import data
from dotapp.dot import Dot
from dotapp.utils import copy_file, is_tool


class Rofi(Dot):

    """Class that represents rofi dotfiles"""

    def __init__(self, name, dotfiles):
        super(name, dotfiles).__init__()

    def sync(self):
        """Copies all rofi files from the system to this repo"""

        if not is_tool("rofi"):
            print("Rofi is not installed.")
            return

        if not data.rofi:
            print("No information about rofi in database")
            return

        for file in data.rofi:
            copy_file(file)

    def update(self):
        """docstring for update"""

    def install(self):
        """docstring for install"""
