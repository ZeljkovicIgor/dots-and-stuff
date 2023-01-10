local config = require("lspconfig")
local icons = require("user.icons")
require("lspconfig.ui.windows").default_options.border = "single"

vim.fn.sign_define("DiagnosticSignError", { text = icons.diagnostics.Error, texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = icons.diagnostics.Warning, texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = icons.diagnostics.Information, texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = icons.diagnostics.Hint, texthl = "DiagnosticSignHint" })

vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(current_client, bufnr)
    require("user.keymaps").lsp(current_client, bufnr)
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach_with_format = function(current_client, bufnr)
    on_attach(current_client, bufnr)

    if current_client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({
                    filter = function(client)
                        return client.name == current_client.name
                    end,
                    bufnr = bufnr,
                })
            end,
        })
    end
end

config.intelephense.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
        licenceKey = "EducationalCode",
        usePlaceholders = true,
    },
})

config.html.setup({
    capabilities = capabilities,
    on_attach = on_attach_with_format,
    init_options = {
        provideFormatter = false,
    },
    filetypes = { "html", "blade" },
})

config.emmet_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "html", "blade", "css" },
})

config.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach_with_format,
    settings = {
        javascript = {
            format = {
                insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
            },
            suggest = {
                completeFunctionCalls = true,
            },
        },
        completions = {
            completeFunctionCalls = true,
        },
    },
})

config.jsonls.setup({
    capabilities = capabilities,
    on_attach = on_attach_with_format,
})

config.sumneko_lua.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace",
            },
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})
