local opt = vim.opt

opt.signcolumn = "yes:1"
opt.relativenumber = true
opt.number = true
opt.linebreak = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.splitright = true
opt.splitbelow = true
opt.list = true
opt.listchars = {
    tab = "│·",
    trail = "·",
}
opt.scrolloff = 16
opt.hidden = true
opt.fixeol = true
opt.termguicolors = true
opt.completeopt = { "menu", "menuone", "noselect" }
opt.updatetime = 250

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- polyglot settings
vim.g["polyglot_disabled"] = { "autoindent" }
