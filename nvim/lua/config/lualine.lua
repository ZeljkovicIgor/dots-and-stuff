local lualine = require("lualine")
local tokyonight_lualine = require("lualine.themes.tokyonight")

tokyonight_lualine.normal.c.bg = nil
tokyonight_lualine.inactive.c.bg = nil
tokyonight_lualine.inactive.a.bg = nil
tokyonight_lualine.inactive.b.bg = nil

lualine.setup({
    options = {
        theme = tokyonight_lualine,
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            "packer",
            "NvimTree",
        },
    },
    sections = {
        lualine_a = {
            {
                "mode",
                separator = { left = " " },
                right_padding = 2,
            },
        },
        lualine_b = {
            {
                "filename",
                path = 1,
            },
            "branch",
        },
        lualine_c = {
            "diagnostics",
        },
        lualine_x = {},
        lualine_y = { "filetype", "progress" },
        lualine_z = {
            {
                "location",
                separator = { right = " " },
                left_padding = 2,
            },
        },
    },
    inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
    },
})

_G.lsp_progress = function()
    if vim.lsp.buf_get_clients() == 0 then
        return ""
    end

    local lsp = vim.lsp.util.get_progress_messages()[1]
    if lsp then
        local name = lsp.name or ""
        local msg = lsp.message or ""
        local percentage = lsp.percentage or 0
        local title = lsp.title or ""
        return string.format(" %%<%s: %s %s (%s%%%%) ", name, title, msg, percentage)
    end
    return ""
end

print(lsp_progress())
