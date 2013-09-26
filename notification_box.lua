local vicious = require("vicious")
local wibox = require("wibox")

local M = {}

-- Notification widget
M = wibox.widget.textbox()
M:set_text("")

vicious.cache(M)

return M
