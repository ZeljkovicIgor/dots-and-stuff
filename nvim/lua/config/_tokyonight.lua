local theme = require('tokyonight')

theme.setup({
    lualine_bold = true,
    styles = {
        sidebars = "normal",
        floats = "normal"
    },
    on_highlights = function (highlights, colors)
        highlights.StatusLine = {
            bg = colors.bg,
            fg = colors.bg
        }
    end
})

vim.cmd [[colorscheme tokyonight]]
