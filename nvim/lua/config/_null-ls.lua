-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
    return
end

local formatting = null_ls.builtins.formatting

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    debug = true,
    sources = {
        formatting.stylua.with({
            extra_args = { "--indent-type", "Spaces" },
        }),
        formatting.phpcsfixer.with({
            extra_args = {
                "--rules",
                "@PSR12,-elseif,array_indentation",
                "--cache-file",
                vim.fn.expand("~/.config/nvim/.php-cs-fixer.cache"),
            },
        }),
        formatting.blade_formatter.with({
            extra_args = {
                "--wrap",
                "200",
            },
        }),
    },
    -- configure format on save
    on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        filter = function(client)
                            --  only use null-ls for formatting instead of lsp server
                            return client.name == "null-ls"
                        end,
                        bufnr = bufnr,
                    })
                end,
            })
        end
    end,
})
