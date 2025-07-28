local lualine = require("lualine")

lualine.setup({
    options = {
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            "packer",
            "NvimTree",
            "lspsagaoutline",
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
        },
        lualine_c = {},
        lualine_x = {
            "diagnostics",
        },
        lualine_y = { "filetype", "progress", "location" },
        lualine_z = {
            {
                "branch",
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
    if vim.lsp.get_clients() == 0 then
        return ""
    end

    local lsp = vim.lsp.status()[1]
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
