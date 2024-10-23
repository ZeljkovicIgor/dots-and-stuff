local startup = require("startup")
local icons = require("user.icons")

local contentNames = {
    sessions = icons.startup.sessions .. " Sessions",
    findFiles = icons.startup.findFiles .. " Find Files",
    findWord = icons.startup.findWord .. " Find Word",
    recentFiles = icons.startup.recentFiles .. " Recent Files",
    fileBrowser = icons.startup.fileBrowser .. " File Browser",
    colorschemes = icons.startup.colorschemes .. " Colorschemes",
    newFile = icons.startup.newFile .. " New File",
}

startup.setup({
    -- every line should be same width without escaped \
    header = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 5,
        content = {
            "",
            "",
            "",
            "",
            "",
            "",
        },
        highlight = "Statement",
        default_color = "",
        oldfiles_amount = 0,
    },
    -- name which will be displayed and command
    body = {
        type = "mapping",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Basic Commands",
        margin = 5,
        content = {
            { contentNames.sessions, "SessionSearch", "<leader>ss" },
            { contentNames.findFiles, "Telescope find_files", "<leader>ff" },
            { contentNames.findWord, "Telescope live_grep", "<leader>lg" },
            { contentNames.recentFiles, "Telescope oldfiles", "<leader>of" },
            { contentNames.fileBrowser, "Telescope file_browser", "<leader>fb" },
            { contentNames.colorschemes, "Telescope colorscheme", "<leader>cs" },
            { contentNames.newFile, "lua require'startup'.new_file()", "<leader>nf" },
        },
        highlight = "String",
        default_color = "",
        oldfiles_amount = 0,
    },

    options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 1, 3, 3, 0 },
    },
    mappings = {
        execute_command = "<CR>",
        open_file = "o",
        open_file_split = "<c-o>",
        open_section = "<TAB>",
        open_help = "?",
    },
    colors = {
        background = "#1f2227",
        folded_section = "#56b6c2",
    },
    parts = { "header", "body" },
})
