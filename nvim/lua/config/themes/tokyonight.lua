require("tokyonight").setup({
    style = "storm",
    lualine_bold = true,
    styles = {
        sidebars = "normal",
        floats = "normal",
    },
    on_highlights = function(highlights, colors)
        highlights.StatusLine = {
            bg = colors.bg,
            fg = colors.bg,
        }
    end,
})

local M = {}

M.activate = function()
    vim.cmd.colorscheme("tokyonight-storm")
    local lualine = require("lualine")
    local theme_lualine = require("lualine.themes.tokyonight")

    theme_lualine.normal.c.bg = nil
    theme_lualine.inactive.c.bg = nil
    theme_lualine.inactive.a.bg = nil
    theme_lualine.inactive.b.bg = nil

    lualine.setup({
        options = {
            theme = theme_lualine,
        },
    })
end

return M
