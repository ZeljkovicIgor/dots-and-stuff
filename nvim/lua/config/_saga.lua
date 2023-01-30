local saga = require("lspsaga")
local colors = require("tokyonight.colors").default
local icons = require("user.icons")

saga.setup({
    diagnostic = {
        show_code_action = false,
    },
    lightbulb = {
        virtual_text = false,
    },
    symbol_in_winbar = {
        enable = false,
    },
    ui = {
        theme = "round",
        code_action = icons.diagnostics.BoldHint,
        border = "rounded",
        colors = {
            normal_bg = colors.bg,
            red = colors.red,
            magenta = colors.magenta,
            orange = colors.orange,
            yellow = colors.yellow,
            green = colors.green,
            cyan = colors.cyan,
            blue = colors.blue,
            purple = colors.purple,
            white = colors.white,
            black = colors.black,
        },
    },
})
