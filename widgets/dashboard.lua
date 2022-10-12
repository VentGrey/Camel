local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local icon = '/usr/share/icons/Papirus/32x32/emblems/emblem-system.svg'

local dashboard_widget = wibox.widget {
    {
        image = icon,
        resize = true,
        widget = wibox.widget.imagebox,
    },
    margins = 4,
    widget = wibox.container.margin
}

return dashboard_widget