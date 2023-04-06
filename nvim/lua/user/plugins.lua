-- auto install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

if packer_bootstrap then
    require("packer").sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
    return
end

packer.startup(function(use)
    use("wbthomason/packer.nvim") -- packer can manage itself
    use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP

    -- Theme
    use({ "folke/tokyonight.nvim" })
    use({ "catppuccin/nvim", as = "catppuccin" })

    -- NvimTree
    use({
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("config.tree")
        end,
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icons
        },
    })

    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("config.nvim-cmp")
        end,
    })
    use("hrsh7th/cmp-nvim-lsp-signature-help")
    use({
        "L3MON4D3/LuaSnip",
        config = function()
            require("config._luasnip")
        end,
    })
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("config.surround")
        end,
    })

    use({
        "nvim-lualine/lualine.nvim",
        config = function()
            require("config._lualine")
        end,
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("config.treesitter")
        end,
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })
    use("nvim-treesitter/nvim-treesitter-textobjects")

    use("nvim-lua/plenary.nvim")
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        config = function()
            require("config._telescope")
        end,
        requires = {
            { "nvim-lua/plenary.nvim" },
        },
    })

    use({
        "windwp/nvim-autopairs",
        config = function()
            require("config.autopairs")
        end,
    })

    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })

    use({
        "startup-nvim/startup.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require("config.startup")
        end,
    })

    use({
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            })
        end,
    })

    use({
        "rmagatti/session-lens",
        requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
        config = function()
            require("session-lens").setup({ --[[your custom config--]]
            })
        end,
    })

    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("config.gitsigns")
        end,
    })

    use("lewis6991/impatient.nvim")
    use({
        "RRethy/vim-illuminate",
        config = function()
            require("config.illuminate")
        end,
    })
    use({ "onsails/lspkind.nvim" })

    -- managing & installing lsp servers, linters & formatters
    use({
        "williamboman/mason.nvim",
        config = function()
            require("config._mason")
        end,
    }) -- in charge of managing lsp servers, linters & formatters
    use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

    -- formatting & linting
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("config._null-ls")
        end,
    }) -- configure formatters & linters
    use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

    use("sheerun/vim-polyglot")

    use({
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup({})
        end,
    })

    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("config._saga")
        end,
        requires = { { "nvim-tree/nvim-web-devicons" } },
    })

    use("dstein64/vim-startuptime")
    use({
        "nathom/filetype.nvim",
        config = function()
            require("filetype").setup({})
        end,
    })

    use({
        "JManch/sunset.nvim",
        config = function()
            require("config._theme")
        end,
    })
end)
