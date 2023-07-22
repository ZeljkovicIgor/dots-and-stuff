local statuscol = require("statuscol")
local builtin = require("statuscol.builtin")

statuscol.setup({
    segments = {
        {
            text = { " %s " },
            click = "v:lua.ScSa",
        },
        {
            text = { builtin.lnumfunc, " " },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
        },
    },
    ft_ignore = { "startup" },
})
