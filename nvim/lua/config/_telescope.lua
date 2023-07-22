local telescope = require("telescope")

telescope.setup({
    defaults = {
        prompt_prefix = " 🔍 ",
        file_ignore_patterns = { ".sql", "vendor" },
        path_display = { "truncate" },
    },
    pickers = {
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
