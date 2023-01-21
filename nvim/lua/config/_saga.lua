local saga = require("lspsaga")
local colors = require("tokyonight.colors").default

saga.setup({
    diagnostic = {
        show_code_action = false,
    },
    rename = {
        whole_project = false,
    },
    symbol_in_winbar = {
        enable = false,
    },
    ui = {
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
