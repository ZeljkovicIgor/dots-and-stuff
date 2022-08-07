from typing import List
from dotapp.dotfile import Dotfile
from dotapp.utils import is_tool


class Dot:

    """Class that represents a dot"""

    def __init__(self, name, text, files: List[Dotfile]):
        """Dot constructor

        :name: name identifier of the dot
        :dotfiles: list of dotfiles related to this dot

        """
        self.name = name
        self.text = text
        self.files = files

    def sync(self):
        """Method for syncing dotfiles from system to repo"""

        if not is_tool(self.name):
            print(f"{self.text} is not installed.\n")
            return

        for file in self.files:
            file.prepare_for_repo()
            file.copy_file()

    def install(self):
        """Method for installing tools and initializing dots on the system

        :returns: void

        """
        pass

    def update(self):
        """Method for updating dotfiles from repo to system

        :returns: void

        """
        pass
