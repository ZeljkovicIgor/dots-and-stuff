class Dot:

    """Class that represents a dot"""

    def __init__(self, name, dotfiles):
        """Dot constructor

        :name: name identifier of the dot
        :dotfiles: list of dotfiles related to this dot

        """
        self._name = name
        self._dotfiles = dotfiles

    def sync(self):
        """Method for syncing dotfiles from system to repo

        :returns: void

        """
        pass

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
