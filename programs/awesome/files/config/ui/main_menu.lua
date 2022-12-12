local awful = require("awful")
local beautiful = require("beautiful")

local awesome_menu = {
   { "manual", terminal .. " -e man awesome" },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

local main_menu = awful.menu({
    items = {
        { "awesome", awesome_menu, beautiful.awesome_icon },
        { "open terminal", terminal }
    }
})

local launcher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = main_menu
})

return { menu = main_menu, launcher = launcher }
