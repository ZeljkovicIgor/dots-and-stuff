local cmp = require("cmp")
local luasnip = require("luasnip")
local keymaps = require("user.keymaps")
local lspkind = require("lspkind")

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert(keymaps.cmp(cmp, luasnip, has_words_before)),
    sources = cmp.config.sources({
        { name = "path" },
        { name = "nvim_lsp", max_item_count = 10 },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lua" },
        { name = "buffer", max_item_count = 5, keyword_length = 5 },
        { name = "luasnip", max_item_count = 5 },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
            menu = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
            },
        }),
    },
    experimental = {
        ghost_text = true,
    },
})
