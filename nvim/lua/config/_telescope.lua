local telescope = require("telescope")

telescope.setup({
    defaults = {
        prompt_prefix = " 🔍 ",
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
