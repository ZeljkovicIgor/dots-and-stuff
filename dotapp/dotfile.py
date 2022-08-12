import os
from os.path import exists
from shutil import copy
import sys

from dotapp.textcolors import print_success


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

    def copy_sync(self):
        """docstring for copy_sync"""
        if not exists(self.get_sys_filename()):
            print(f"{self.get_sys_filename()} does not exist.")

            return

        try:
            if not exists(self.get_repo_filename()):
                if not exists(self.repopath):
                    print(
                        f"Repo directory {self.repopath} not found. Creating directory..."
                    )
                    os.makedirs(self.repopath)

                print(f"Copying {self.name}...")

                copy(self.get_sys_filename(), self.repopath)
            else:
                if self.equal():
                    print(
                        f"{self.name} files are same in repo and system. No need to copy them."
                    )

                    return

                print(f"Copying {self.name}...")

                copy(self.get_sys_filename(), self.get_repo_filename())

                self.replace_username()
        except Exception as e:
            print("There was an error while copying rofi files: ")
            raise e
        else:
            print_success(
                f"{self.name} copied from {self.get_sys_filename()} to "
                + self.get_repo_filename()
            )

    def replace_username(self):
        """docstring for replace_username"""
        with open(self.get_repo_filename(), "r") as file:
            lines = file.readlines()
        with open(self.get_repo_filename(), "w") as file:
            for line in lines:
                file.write(
                    line.replace(os.getlogin(), "DOTS-USERNAME")
                    if self.ignore_username(line) and os.getlogin() in line
                    else line
                )

    def ignore_username(self, line):
        """docstring for ignore_username"""
        return "##dots-ignore-username##" in line

    def equal(self):
        """docstring for equal"""

        def user_in_line(line):
            """docstring for user_in_line"""
            if self.ignore_username(line) and (
                "USERNAME" in line or os.getlogin() in line
            ):
                return False
            return True

        try:
            print("Comparing files in system and repo...")

            with open(self.get_sys_filename(), "r") as filesys, open(
                self.get_repo_filename(), "r"
            ) as filerepo:
                filesys_fil = list(filter(user_in_line, filesys))
                filerepo_fil = list(filter(user_in_line, filerepo))

                if len(filerepo_fil) != len(filesys_fil):
                    print(
                        f"{self.name} has {len(filesys_fil)} lines in system file and {len(filerepo_fil)} in repo file."
                    )
                    return False

                for index, linesys in enumerate(filesys_fil):
                    if linesys != filerepo_fil[index]:
                        return False

                return True
        except Exception as e:
            raise e

    def get_sys_filename(self):
        """get path to file in system"""
        return self.syspath + self.name

    def get_repo_filename(self):
        """get path to file in repo"""
        return self.repopath + self.name
