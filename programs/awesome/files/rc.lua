-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local beautiful = require("beautiful")
local naughty = require("naughty")

-- {{{ Error handling
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification({
        urgency = "critical",
        title = "Oops, an error happened"..(startup and " during startup!" or "!"),
        message = message
    })
end)
-- }}}

-- {{{ Variable definitions
beautiful.init("~/.config/awesome/theme.lua")
terminal = "nixGL kitty"
browser_cmd = "firefox"
screenshot_cmd = "flameshot gui"
lock_cmd = "~/.ksk/scripts/lock.sh"

modkey = "Mod4"
-- }}}

-- {{{ Includes
require("awful.autofocus")          -- Deprecated

-- Config
require("config.autostart")
require("config.binds")
require("config.rules")
require("config.notifications")
require("config.misc")
require("config.ui")
-- }}}

-- {{{ Focus follow mouse
client.connect_signal("mouse::enter", function(c)
    c:activate({ context = "mouse_enter", raise = false })
end)
-- }}}
