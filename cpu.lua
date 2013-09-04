local awful = require("awful")
local beautiful = require("beautiful")
local wibox     = require("wibox")
local vicious   = require("vicious")

local M = {}

M.icon = wibox.widget.imagebox()
M.icon:set_image(awful.util.getdir("config") .. "/themes/icons/him/cpuinfo-blue.png")

M.widget = wibox.widget.textbox()
vicious.register(M.widget, vicious.widgets.cpu, "<span>$1%</span>", 3)
vicious.cache(M.widget)

return M
