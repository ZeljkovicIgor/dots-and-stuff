local gitsigns = require("gitsigns")
local keymaps = require("user.keymaps")

gitsigns.setup({
    attach_to_untracked = false,
    current_line_blame = true,
    on_attach = keymaps.gitsigns,
})
