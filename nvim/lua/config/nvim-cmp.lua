local cmp = require("cmp")
local luasnip = require("luasnip")
local keymaps = require("user.keymaps")
local lspkind = require("lspkind")
local ts_utils = require("nvim-treesitter.ts_utils")

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local filter_emmet_in_jsx = function(entry, ctx)
    local lsp_name = entry.source.source.client.config.name
    local node = ts_utils.get_node_at_cursor()

    if
        ctx.filetype == "javascriptreact"
        and lsp_name == "emmet_ls"
        and node
        and (node:type() ~= "jsx_text" and node:type() ~= "jsx_expression")
    then
        return false
    end

    return true
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
        {
            name = "nvim_lsp",
            max_item_count = 10,
            entry_filter = function(entry, ctx)
                return filter_emmet_in_jsx(entry, ctx)
            end,
        },
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
