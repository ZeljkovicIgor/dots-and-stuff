class Dotfile:

    """Class that represents a dotfile with its name and system and repo paths"""

    def __init__(self, name, syspath, repopath):
        """Dotfile constructor

        :name: name of a file
        :syspath: system path of a file
        :repopath: git repository path of a file

        """
        self._name = name
        self._syspath = syspath
        self._repopath = repopath
