local theme_assets = require("beautiful.theme_assets")
local rnotification = require("ruled.notification")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

-- Load colors from Nix theme
local colors = require("generated.colors")

theme.font = "IBM Plex Sans 10"
theme.mono_font = "IBM Plex Mono 10"

theme.bg_normal = colors.bg1
theme.bg_focus = colors.bg2
theme.bg_minimize = colors.bg_min
theme.bg_urgent = colors.hl1

theme.bg_systray = colors.bg1

theme.fg_normal = colors.fg1
theme.fg_focus = colors.fg1
theme.fg_urgent = colors.fg1
theme.fg_minimize = colors.fg1

theme.useless_gap = dpi(2)
theme.border_width = dpi(1)
theme.border_color_normal = colors.bg1
theme.border_color_active = colors.bg2
theme.border_color_marked = "#91231c"

-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
theme.taglist_fg_focus = colors.fg1
theme.taglist_fg_occupied = colors.fg2
theme.taglist_fg_empty = colors.fg3
theme.taglist_fg_urgent = colors.hl1

theme.hotkeys_fg = colors.fg1
theme.hotkeys_modifiers_fg = colors.fg2

-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

theme.icon_margin = dpi(4)

-- Wibar
theme.wibar_height = dpi(30)
theme.corner_radius = dpi(8)

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(15)
theme.menu_width = dpi(150)

theme.wallpaper = "~/.config/awesome/wallpaper.jpg"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.wibar_height, theme.fg_focus, theme.bg_normal
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "Papirus-Dark"

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule({
        rule = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' }
    })
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
