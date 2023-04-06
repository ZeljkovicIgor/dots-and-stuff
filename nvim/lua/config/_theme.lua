local constants = require("user.constants")
local tokyonight = require("config.themes.tokyonight")
local catppuccin = require("config.themes.catppuccin")

local ok, settings = pcall(require, "user.settings")

if ok then
    if settings.theme == constants.THEME.DYNAMIC then
        require("sunset").setup({
            latitude = settings.location.lat,
            longitude = settings.location.long,
            night_callback = function()
                tokyonight.activate()
            end,
            day_callback = function()
                catppuccin.activate()
            end,
        })
    elseif settings.theme == constants.THEME.DARK then
        tokyonight.activate()
    else
        catppuccin.activate()
    end
else
    tokyonight.activate()
end
