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

require("sunset").setup({
    latitude = 45.2396,
    longitude = 19.8227,
    night_callback = function()
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
    end,
    day_callback = function()
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
    end,
})
-- THEME = "tokyonight"
-- local theme = require(THEME)
--
-- if THEME == "tokyonight" then
--     theme.setup({
--         lualine_bold = true,
--         styles = {
--             sidebars = "normal",
--             floats = "normal",
--         },
--         on_highlights = function(highlights, colors)
--             highlights.StatusLine = {
--                 bg = colors.bg,
--                 fg = colors.bg,
--             }
--         end,
--     })
-- else
--     theme.setup({
--         flavour = "latte",
--         integrations = {
--             gitsigns = true,
--             cmp = true,
--             illuminate = true,
--             lsp_saga = true,
--             mason = true,
--             nvimtree = true,
--             telescope = true,
--             treesitter = true,
--             fidget = true,
--         },
--     })
-- end

-- vim.cmd.colorscheme(THEME)
