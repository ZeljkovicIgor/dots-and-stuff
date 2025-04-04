local saga = require("lspsaga")
-- local colors = require("tokyonight.colors").default
local icons = require("user.icons")

-- local saga_colors = {
--     normal_bg = colors.bg,
--     red = colors.red,
--     magenta = colors.magenta,
--     orange = colors.orange,
--     yellow = colors.yellow,
--     green = colors.green,
--     cyan = colors.cyan,
--     blue = colors.blue,
--     purple = colors.purple,
--     white = colors.white,
--     black = colors.black,
-- }

saga.setup({
    finder = {
        silent = true,
    },
    diagnostic = {
        on_insert = false,
    },
    lightbulb = {
        virtual_text = false,
    },
    symbol_in_winbar = {
        folder_level = 0,
    },
    outline = {
        close_after_jump = true,
    },
    ui = {
        theme = "round",
        code_action = icons.diagnostics.BoldHint,
        border = "rounded",
    },
})
