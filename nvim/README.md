# Neovim Configuration

A modern, modular Neovim configuration built with Lua and lazy.nvim.

## Features

- 🚀 **Fast Startup**: Lazy loading with lazy.nvim
- 🎨 **Dynamic Themes**: Automatic theme switching based on time/location
- 🔧 **LSP Support**: Full language server protocol support with Mason
- 📝 **Smart Completion**: nvim-cmp with luasnip snippets
- 🌳 **File Explorer**: nvim-tree integration
- 🔍 **Fuzzy Finder**: Telescope for file and text search
- 🎯 **Git Integration**: Gitsigns for git status and operations
- 📊 **Diagnostics**: Trouble.nvim for better error handling
- 🎪 **UI Enhancements**: Lualine status bar, statuscol, and more

## Prerequisites

- Neovim 0.8.0 or higher
- Git
- A Nerd Font (for icons)

## Installation

1. Clone this repository:
```bash
git clone <your-repo-url> ~/.config/nvim
```

2. Start Neovim and wait for lazy.nvim to install plugins:
```bash
nvim
```

3. The first startup will take longer as plugins are installed automatically.

## Plugin Management

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management. Plugins are defined in `lua/user/plugins.lua`.

### Key Plugins

- **LSP**: nvim-lspconfig, Mason, none-ls
- **Completion**: nvim-cmp, luasnip
- **UI**: tokyonight/catppuccin themes, lualine, nvim-tree
- **Search**: Telescope with fzf-native
- **Git**: gitsigns, fugitive
- **Development**: treesitter, autopairs, surround, comment

## Keymaps

### Leader Key
- Leader is set to `,`

### General
- `<leader><space>` - Clear search highlights
- `jj` - Exit insert mode
- `<leader>q` - Close buffer without closing window
- `<C-b>` - Toggle file explorer (nvim-tree)
- `<leader>f` - Save without formatting

### Telescope (Fuzzy Finder)
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<C-f>` - Fuzzy find in current buffer
- `<leader>fs` - Grep string
- `<leader>fb` - Find buffers
- `<leader>fh` - Find help tags
- `<leader>fd` - Find diagnostics (current buffer)
- `<leader>fD` - Find diagnostics (workspace)
- `<leader>ss` - Search sessions

### LSP (Language Server Protocol)
- `gd` - Go to definition
- `gi` - Go to implementation
- `gr` - Go to references
- `K` - Hover documentation
- `<leader>rn` - Rename symbol
- `<leader>rng` - Rename symbol (project-wide)
- `<leader>ca` - Code actions
- `<leader>cd` - Show line diagnostics
- `<leader>o` - Outline
- `[e` / `]e` - Navigate diagnostics
- `[E` / `]E` - Navigate errors only

### Diagnostics (Trouble)
- `<leader>xx` - Toggle trouble
- `<leader>xw` - Toggle workspace diagnostics
- `<leader>xd` - Toggle document diagnostics
- `x]` / `x[` - Navigate diagnostics

### Git
- `]c` / `[c` - Navigate hunks

### Laravel (if using Laravel.nvim)
- `<leader>la` - Laravel artisan
- `<leader>lr` - Laravel routes
- `<leader>lm` - Laravel related files

## LSP Configuration

The configuration includes LSP servers for:
- **PHP**: Intelephense
- **TypeScript/JavaScript**: tsserver + ESLint
- **Lua**: lua_ls
- **HTML/CSS**: html + emmet
- **JSON**: jsonls

### Formatting

Formatting is handled by none-ls with:
- **Lua**: stylua
- **PHP**: pint
- **Blade**: blade_formatter
- **Web**: prettier (HTML, CSS, JSON)

Format on save is enabled for supported file types.

## Themes

The configuration supports dynamic theme switching:
- **Dark**: Tokyo Night
- **Light**: Catppuccin
- **Dynamic**: Automatic switching based on time/location (requires settings)

## Configuration Structure

```
nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── user/
│   │   ├── lazy.lua         # Lazy.nvim setup
│   │   ├── options.lua      # Neovim options
│   │   ├── keymaps.lua      # Key mappings
│   │   ├── lsp.lua          # LSP configuration
│   │   ├── plugins.lua      # Plugin definitions
│   │   ├── constants.lua    # Constants
│   │   └── icons.lua        # Icon definitions
│   └── config/
│       ├── _theme.lua       # Theme configuration
│       ├── _telescope.lua   # Telescope setup
│       ├── _lualine.lua     # Status line
│       ├── nvim-cmp.lua     # Completion
│       ├── _none-ls.lua     # Formatting/linting
│       └── ...              # Other plugin configs
└── snippets/                # Snippet files
```

## Customization

### Adding Plugins

Edit `lua/user/plugins.lua` to add new plugins:

```lua
return {
    -- Your existing plugins...
    
    {
        "your-plugin/name",
        config = function()
            require("config.your-plugin")
        end,
    },
}
```

### Adding LSP Servers

Edit `lua/user/lsp.lua` to add new language servers:

```lua
config.your_language_server.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    -- Additional settings...
})
```

### Adding Formatters

Edit `lua/config/_none-ls.lua` to add new formatters:

```lua
null_ls.setup({
    sources = {
        -- Your existing sources...
        formatting.your_formatter,
    },
})
```

## Troubleshooting

### Plugin Issues
- Check `:checkhealth` for plugin status
- Restart Neovim after adding new plugins
- Check lazy.nvim UI with `:Lazy`

### LSP Issues
- Ensure language servers are installed via Mason
- Check `:LspInfo` for server status
- Verify file associations in `lua/user/lsp.lua`

### Performance
- Use `:StartupTime` to profile startup
- Check for conflicting plugins
- Ensure lazy loading is configured properly

## Credits

This configuration is built on top of:
- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configuration
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- And many other excellent plugins

## License

This configuration is provided as-is for personal use. 