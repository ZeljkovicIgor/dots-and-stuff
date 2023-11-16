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
keymap("n", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts) -- close buffer without closing window

keymap("n", "<C-b>", "<cmd>NvimTreeFindFileToggle<cr>", opts) -- toggle NvimTree

keymap("n", "<leader>f", "<cmd>noa w<cr>", opts) -- save without formatting

-- TELESCOPE
keymap("n", "<leader>ff", telescope_builtin.find_files, opts) -- find files
keymap("n", "<leader>fg", telescope_builtin.live_grep, opts) -- find in all files
keymap("n", "<C-f>", telescope_builtin.current_buffer_fuzzy_find, opts) -- find in all files
keymap("n", "<leader>fs", telescope_builtin.grep_string, opts) -- find help_tags
keymap("n", "<leader>fb", telescope_builtin.buffers, opts) -- find buffers
keymap("n", "<leader>fh", telescope_builtin.help_tags, opts) -- find help_tags
keymap("n", "<leader>fd", function()
    telescope_builtin.diagnostics({ bufnr = 0 })
end, opts) -- find all diagnostic data in whole workspace
keymap("n", "<leader>fD", telescope_builtin.diagnostics, opts) -- find all diagnostic data in whole workspace
keymap("n", "<leader>ss", telescope.extensions["session-lens"].search_session, opts) -- search sessions

-- TODO COMMENTS
keymap("n", "<leader>ft", "<cmd>TodoTelescope<CR>", opts)

-- TROUBLE
keymap("n", "<leader>xx", function()
    require("trouble").toggle()
end)
keymap("n", "<leader>xw", function()
    require("trouble").toggle("workspace_diagnostics")
end)
keymap("n", "<leader>xd", function()
    require("trouble").toggle("document_diagnostics")
end)
keymap("n", "x]", function()
    require("trouble").next({ skip_groups = true, jump = true })
end)
keymap("n", "x[", function()
    require("trouble").previous({ skip_groups = true, jump = true })
end)

-- LSPSAGA
keymap("n", "gh", "<cmd>Lspsaga finder<CR>")
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")
keymap("n", "<leader>rng", "<cmd>Lspsaga rename ++project<CR>")
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>")
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[E", function()
    require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]E", function()
    require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

local M = {}

-- LSP
---@diagnostic disable-next-line: unused-local
function M.lsp(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
    keymap("n", "gd", telescope_builtin.lsp_definitions, bufopts)
    keymap("n", "gi", telescope_builtin.lsp_implementations, bufopts)
    keymap("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    keymap("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    keymap("n", "gr", telescope_builtin.lsp_references, bufopts)
    keymap({ "n", "v" }, "<space>f", function()
        vim.lsp.buf.format({ async = false })
        vim.cmd("noa w") -- save without running autocommands
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
        ["<C-j>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable() then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable() then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }
end

-- Gitsigns
function M.gitsigns()
    local gs = package.loaded.gitsigns

    local nextHunk = function()
        if vim.wo.diff then
            return "]c"
        end
        vim.schedule(function()
            gs.next_hunk()
        end)
        return "<Ignore>"
    end

    local previousHunk = function()
        if vim.wo.diff then
            return "[c"
        end
        vim.schedule(function()
            gs.prev_hunk()
        end)
        return "<Ignore>"
    end

    keymap("n", "]c", nextHunk, { expr = true })
    keymap("n", "[c", previousHunk, { expr = true })
end

return M
