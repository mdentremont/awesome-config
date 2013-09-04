local awful     = require("awful")
local beautiful = require("beautiful")
local vicious   = require("vicious")
local wibox     = require("wibox")

local M = {}

M.icon = wibox.widget.imagebox()
M.icon:set_image(awful.util.getdir("config") .. "/themes/icons/him/volw-green.png")

M.widget = wibox.widget.textbox()
vicious.register(M.widget, vicious.widgets.volume,
        function(widget, args)
            if args[2] == "♩" then
                -- Muted
                return "--"
            end
            return args[1]
        -- "-D pulse" is needed to work around a defect in amixer
        end, 3, "-D pulse Master")

volumeButtons = awful.util.table.join(
    -- "-D pulse ... 1+" is needed to work around a defect in amixer
    awful.button({ }, 1, function () awful.util.spawn("amixer -q -D pulse set Master 1+ toggle", false) end),
    awful.button({ }, 4, function () awful.util.spawn("amixer -q set Master 1dB+", false) end),
    awful.button({ }, 5, function () awful.util.spawn("amixer -q set Master 1dB-", false) end)
)

M.icon:buttons(volumeButtons)
M.widget:buttons(volumeButtons)

vicious.cache(M.widget)

return M
