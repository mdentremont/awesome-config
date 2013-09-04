local awful = require("awful")
local beautiful = require("beautiful")
local vicious   = require("vicious")
local wibox     = require("wibox")

local M = {}

M.icon = wibox.widget.imagebox()
M.icon:set_image(awful.util.getdir("config") .. "/themes/icons/him/mem.png")

M.widget = wibox.widget.textbox()
vicious.register(M.widget, vicious.widgets.mem, "<span>$1%</span>", 1)
vicious.cache(M.widget)

return M
