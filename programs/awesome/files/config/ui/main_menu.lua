local awful = require("awful")
local beautiful = require("beautiful")

local awesome_menu = {
   { "manual", terminal .. " -e man awesome" },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

return awful.menu({
    items = {
        { "awesome", awesome_menu, beautiful.awesome_icon },
        { "open terminal", terminal }
    }
})
