local saga = require("lspsaga")
local icons = require("user.icons")

saga.init_lsp_saga({
    code_action_icon = icons.diagnostics.BoldHint,
    code_action_lightbulb = {
        enable = true,
        sign = false,
        enable_in_insert = false,
    },
})
