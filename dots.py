#!/usr/bin/python
""" Script for working with dot files this being the main file where the menu is made """

import os
from dotapp import all, data, rofi, zsh, vim, neovim, konsole
from dotapp.dot import Dot
from dotapp.dotfile import Dotfile
from dotapp.rofi import Rofi

main_menu_options = {1: "Install", 2: "Update", 3: "Sync", 4: "Exit"}
tool_menu_options = {
    1: "All",
    2: "rofi",
    3: "zsh",
    4: "vim",
    5: "neovim",
    6: "konsole",
    7: "Back",
}

menu_functions = {}
dot_inventory = []

for dotname, dotfiles in data.all.items():

    dotfiles = map(
        lambda file: Dotfile(file["name"], file["sys_path"], file["repo_path"]),
        dotfiles,
    )

    if dotname == "rofi":
        dot_inventory.append(Rofi(dotname, dotfiles))
    elif dotname == "zsh":
        dot_inventory.append(Zsh(dotname, dotfiles))
    elif dotname == "vim":
        dot_inventory.append(Vim(dotname, dotfiles))
    elif dotname == "neovim":
        dot_inventory.append(Neovim(dotname, dotfiles))
    elif dotname == "konsole":
        dot_inventory.append(Konsole(dotname, dotfiles))
    else:
        print("There is something wrong with the data")
        break

for tool_key, tool in tool_menu_options.items():
    function_obj = None
    tool_obj = all

    if tool == "rofi":
        tool_obj = rofi
    if tool == "zsh":
        tool_obj = zsh
    if tool == "vim":
        tool_obj = vim
    if tool == "neovim":
        tool_obj = neovim
    if tool == "konsole":
        tool_obj = konsole

    menu_functions[tool_key] = {}

    for action_key, action in main_menu_options.items():
        if action == main_menu_options[1]:
            menu_functions[tool_key][action_key] = tool_obj.install
        elif action == main_menu_options[2]:
            menu_functions[tool_key][action_key] = tool_obj.update
        elif action == main_menu_options[3]:
            menu_functions[tool_key][action_key] = tool_obj.sync


def print_menu(menu_options):
    for key in menu_options.keys():
        print(key, "--", menu_options[key])


def submenu(action):
    """docstring for submenu"""

    submenu_showing = True
    while submenu_showing:
        print_menu(tool_menu_options)
        tool = ""
        try:
            tool = int(input("Enter your choice: "))
        except:
            print("Wrong input. Please enter a number")

        os.system("clear")

        if tool == 7:
            print("Going back")
            submenu_showing = False
        elif tool not in tool_menu_options.keys():
            print("Invalid option. Please enter a number between 1 and 4.")
        else:
            menu_functions[tool][action]()


def menu():
    """docstring for menu"""

    menu_showing = True
    while menu_showing:
        print_menu(main_menu_options)
        option = ""
        try:
            option = int(input("Enter your choice: "))
        except:
            print("Wrong input. Please enter a number...")

        os.system("clear")

        if option not in main_menu_options.keys():
            print("Invalid option. Please enter a number between 1 and 4.")
        elif option == 4:
            print("Thanks message before exiting")
            menu_showing = False
            exit()
        else:
            submenu(option)


menu()
