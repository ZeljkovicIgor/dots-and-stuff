local config = require("lspconfig")
local icons = require("user.icons")
local constants = require("user.constants")
local ok, user_settings = pcall(require, "user.settings")

require("lspconfig.ui.windows").default_options.border = "single"

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = icons.diagnostics.Warning,
            [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = icons.diagnostics.Information,
        },
    },
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

    if current_client:supports_method("textDocument/formatting") then
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

local function get_js_on_attach()
    if ok then
        if user_settings.js_formatter == constants.JS_FORMATTERS.TSSERVER then
            return on_attach_with_format
        end
    end

    return on_attach
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
    on_attach = on_attach,
    init_options = {
        provideFormatter = false,
    },
    settings = {
        format = {
            enabled = false,
        },
    },
    filetypes = { "html", "blade" },
})

config.emmet_language_server.setup({
    filetypes = {
        "css",
        "html",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "blade",
    },
})

config.ts_ls.setup({
    capabilities = capabilities,
    on_attach = get_js_on_attach(),
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

config.eslint.setup({
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end,
})

config.jsonls.setup({
    capabilities = capabilities,
    on_attach = on_attach_with_format,
})

config.lua_ls.setup({
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
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false, -- avoid annoying prompts
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})
