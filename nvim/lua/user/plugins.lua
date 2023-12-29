return {
    "lewis6991/impatient.nvim",

    "neovim/nvim-lspconfig", -- Configurations for Nvim LSP

    -- Theme
    "folke/tokyonight.nvim",
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("config.tree")
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("config.nvim-cmp")
        end,
    },
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-signature-help",

    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("config._luasnip")
        end,
        dependencies = {
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip",
        },
    },
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("config.surround")
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("config._lualine")
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("config.treesitter")
        end,
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
    "JoosepAlviste/nvim-ts-context-commentstring",

    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        config = function()
            require("config._telescope")
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    "benfowler/telescope-luasnip.nvim",

    {
        "windwp/nvim-autopairs",
        config = function()
            require("config.autopairs")
        end,
    },

    {
        "numToStr/Comment.nvim",
        config = function()
            require("config._comment")
        end,
    },

    {
        "startup-nvim/startup.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require("config.startup")
        end,
    },
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            })
        end,
    },
    {
        "rmagatti/session-lens",
        dependencies = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
        config = function()
            require("session-lens").setup({})
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("config.gitsigns")
        end,
    },
    {
        "RRethy/vim-illuminate",
        config = function()
            require("config.illuminate")
        end,
    },
    { "onsails/lspkind.nvim" },

    -- managing & installing lsp servers, linters & formatters
    {
        "williamboman/mason.nvim",
        config = function()
            require("config._mason")
        end,
    }, -- in charge of managing lsp servers, linters & formatters
    "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

    -- formatting & linting
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("config._null-ls")
        end,
    }, -- configure formatters & linters
    "jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

    "sheerun/vim-polyglot",

    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
    },

    {
        "nvimdev/lspsaga.nvim",
        config = function()
            require("config._saga")
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- optional
            "nvim-tree/nvim-web-devicons", -- optional
        },
    },

    "dstein64/vim-startuptime",

    {
        "JManch/sunset.nvim",
        config = function()
            require("config._theme")
        end,
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    },

    {
        "luukvbaal/statuscol.nvim",
        config = function()
            require("config._statuscol")
        end,
    },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },

    {
        "adalessa/laravel.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-dotenv",
            "MunifTanjim/nui.nvim",
        },
        cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
        keys = {
            { "<leader>la", ":Laravel artisan<cr>" },
            { "<leader>lr", ":Laravel routes<cr>" },
            { "<leader>lm", ":Laravel related<cr>" },
            {
                "<leader>lt",
                function()
                    require("laravel.tinker").send_to_tinker()
                end,
                mode = "v",
                desc = "Laravel Application Routes",
            },
        },
        event = { "VeryLazy" },
        config = function()
            require("laravel").setup({
                lsp_server = "intelephense",
            })
            require("telescope").load_extension("laravel")
        end,
    },
}
