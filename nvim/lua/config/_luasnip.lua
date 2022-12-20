local luasnip = require("luasnip")
local from_vscode = require("luasnip.loaders.from_vscode")

luasnip.setup({})
luasnip.filetype_extend("blade", { "html" })

from_vscode.lazy_load()
from_vscode.lazy_load({ paths = "~/.config/nvim/snippets" })
