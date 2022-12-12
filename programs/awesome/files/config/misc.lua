local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

-- {{{ Tag layout
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.tile,
        awful.layout.suit.floating,
        awful.layout.suit.fair,
        awful.layout.suit.max,
        awful.layout.suit.max.fullscreen,
    })
end)
-- }}}

-- {{{ Wallpaper
screen.connect_signal("request::wallpaper", function(s)
    awful.wallpaper({
        screen = s,
        widget = {
            image = beautiful.wallpaper,
            upscale = true,
            downscale = true,
            horizontal_fit_policy = "fit",
            vertical_fit_policy = "fit",
            widget = wibox.widget.imagebox,
        }
    })
end)
-- }}}
