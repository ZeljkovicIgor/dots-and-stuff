local illuminate = require('illuminate')

illuminate.configure({
    filetypes_denylist = {
        'TelescopePrompt',
        'NvimTree'
    },
    delay = 500
})
