require("catppuccin").setup({
    flavour = "latte",
    integrations = {
        gitsigns = true,
        cmp = true,
        illuminate = true,
        lsp_saga = true,
        mason = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        fidget = true,
    },
})

local M = {}

M.activate = function()
    vim.cmd.colorscheme("catppuccin")
    local lualine = require("lualine")
    local theme_lualine = require("lualine.themes.catppuccin")

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
