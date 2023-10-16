local telescope = require("telescope")
local trouble = require("trouble.providers.telescope")

telescope.setup({
    defaults = {
        prompt_prefix = " 🔍 ",
        file_ignore_patterns = { ".sql", "vendor", ".git" },
        path_display = { "truncate" },
        mappings = {
            i = { ["<leader>t"] = trouble.smart_open_with_trouble },
            n = { ["<leader>t"] = trouble.smart_open_with_trouble },
        },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        buffers = {
            mappings = {
                i = {
                    ["<c-d>"] = "delete_buffer",
                },
            },
        },
    },
})

telescope.load_extension("fzf")
telescope.load_extension("session-lens")
telescope.load_extension("luasnip")
