local statuscol = require("statuscol")
local builtin = require("statuscol.builtin")

statuscol.setup({
    DiagnosticSignError = builtin.diagnostic_click,
    DiagnosticSignHint = builtin.diagnostic_click,
    DiagnosticSignInfo = builtin.diagnostic_click,
    DiagnosticSignWarn = builtin.diagnostic_click,
    GitSignsTopdelete = builtin.gitsigns_click,
    GitSignsUntracked = builtin.gitsigns_click,
    GitSignsAdd = builtin.gitsigns_click,
    GitSignsChange = builtin.gitsigns_click,
    GitSignsChangedelete = builtin.gitsigns_click,
    GitSignsDelete = builtin.gitsigns_click,
})
