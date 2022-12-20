-- If you want insert `(` after select function or method item
local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

npairs.setup {}

-- add spaces between parentheses
local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
npairs.add_rules {
    Rule(' ', ' ')
        :with_pair(function(opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({
                brackets[1][1] .. brackets[1][2],
                brackets[2][1] .. brackets[2][2],
                brackets[3][1] .. brackets[3][2],
            }, pair)
        end)
}

for _, bracket in pairs(brackets) do
    npairs.add_rules {
        Rule(bracket[1] .. ' ', ' ' .. bracket[2])
            :with_pair(function() return false end)
            :with_move(function(opts)
                return opts.prev_char:match('.%' .. bracket[2]) ~= nil
            end)
            :use_key(bracket[2])
    }
end
