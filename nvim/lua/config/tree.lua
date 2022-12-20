local tree = require("nvim-tree")

tree.setup({
    hijack_cursor = true,
    filters = {
        dotfiles = true,
    },
    diagnostics = {
        enable = true,
    },
    update_focused_file = {
        enable = true,
        update_root = true,
    },
})
