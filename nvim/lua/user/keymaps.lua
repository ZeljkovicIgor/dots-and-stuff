local g = vim.g
local keymap = vim.keymap.set

g.mapleader = ","

local opts = { noremap = true, silent = true }

local telescope_builtin = require("telescope.builtin")
local telescope = require("telescope")

-- MISC
keymap("n", "<leader><space>", "<cmd>noh<cr>", opts) -- remove highlight from search pattern
keymap("i", "jj", "<ESC>", opts) -- exit insert mode
keymap("n", "gf", "<cmd>edit <cfile><cr>", opts) -- open file on path (WIP)

keymap("n", "<C-b>", "<cmd>NvimTreeFindFileToggle<cr>", opts) -- toggle NvimTree

keymap("n", "<leader>gts", "<cmd>Gitsigns toggle_signs<cr>", opts) -- toggle git signs

-- DIAGNOSTICS
keymap("n", "[d", function()
    vim.diagnostic.goto_prev({ float = false })
end, opts) -- go to previous diagnostic
keymap("n", "]d", function()
    vim.diagnostic.goto_next({ float = false })
end, opts) -- go to next diagnostic

-- TELESCOPE
keymap("n", "<leader>ff", telescope_builtin.find_files, opts) -- find files
keymap("n", "<leader>fg", telescope_builtin.live_grep, opts) -- find in all files
keymap("n", "<leader>fs", telescope_builtin.grep_string, opts) -- find help_tags
keymap("n", "<leader>fb", telescope_builtin.buffers, opts) -- find buffers
keymap("n", "<leader>fh", telescope_builtin.help_tags, opts) -- find help_tags
keymap("n", "<leader>fd", function()
    telescope_builtin.diagnostics({ bufnr = 0 })
end, opts) -- find all diagnostic data in whole workspace
keymap("n", "<leader>fD", telescope_builtin.diagnostics, opts) -- find all diagnostic data in whole workspace
keymap("n", "<leader>ss", telescope.extensions["session-lens"].search_session, opts) -- search sessions

local M = {}

-- LSP
---@diagnostic disable-next-line: unused-local
function M.lsp(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
    keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", bufopts)
    keymap("n", "gd", telescope_builtin.lsp_definitions, bufopts)
    keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
    keymap("n", "gi", telescope_builtin.lsp_implementations, bufopts)
    keymap("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    keymap("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })
    keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
    keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })
    keymap("n", "gr", telescope_builtin.lsp_references, bufopts)
    keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
    keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
    keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
    keymap("n", "<space>f", function()
        vim.lsp.buf.format({ async = false })
    end, bufopts)
end

-- CMP
function M.cmp(cmp, luasnip, has_words_before)
    return {
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<cr>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<C-p>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }
end

return M
