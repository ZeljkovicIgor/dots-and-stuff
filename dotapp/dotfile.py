import os
from filecmp import cmp
from os.path import exists
from shutil import copy


class Dotfile:

    """Class that represents a dotfile with its name and system and repo paths"""

    def __init__(self, name, syspath, repopath):
        """Dotfile constructor

        :name: name of a file
        :syspath: system path of a file
        :repopath: git repository path of a file

        """
        self.name = name
        self.syspath = syspath
        self.repopath = repopath

    def copy_file(self, to_repo=True):
        """Copy tool files from system to repo and reverse"""

        if not exists(self.syspath):
            print(f"{self.syspath}{self.name} does not exist.")

            return None

        if cmp(
            self.syspath + self.name,
            self.repopath + self.name,
            False,
        ):
            print(
                f"{self.name} files are same in repo and system. No need to copy them."
            )

            return None

        try:
            print(f"Copying {self.name}...")

            src = self.syspath + self.name
            dest = self.repopath

            if not to_repo:
                src = self.repopath + self.name
                dest = self.syspath

            file_destination = copy(src, dest)
        except Exception as e:
            print("There was an error while copying rofi files: ")
            raise e
        else:
            print(f"{self.name} copied from {src} to " + file_destination)

            return src, file_destination

    def prepare_for_repo(self):
        """docstring for prepare_for_repo"""
        filename = self.get_sys_filename()

        with open(filename, "r", encoding="UTF-8") as file:
            lines = file.readlines()
        with open(filename, "w", encoding="UTF-8") as file:
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
                    file.write(line.replace(os.getlogin(), "USERNAME"))
                    continue

                file.write(line)

    def get_sys_filename(self):
        """get path to file in system"""
        return self.syspath + self.name
