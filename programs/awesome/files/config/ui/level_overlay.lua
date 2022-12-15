-- Multi-purpose overlay for "level" (percentage) settings like volume and brightness
-- Based on: https://github.com/Stardust-kyun/dotfiles/blob/a2ed3097c899337629836c0b2d7f2ad987f9636c/home/.config/awesome/themes/linear/volume.lua

local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local feather_icon = require("utils.feather_icon")

local overlay = wibox({
    width = dpi(240),
    height = dpi(40),
    bg = beautiful.bg_normal,
    ontop = true,
    visible = false,
    shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, beautiful.corner_radius)
    end
})

local icon = feather_icon(nil, beautiful.fg_normal)

local slider_val = 0
local slider = wibox.widget({
    widget = wibox.widget.slider,
    minimum = 0,
    maximum = 100,
})

-- "disable" the slider
slider:connect_signal("property::value", function(self, new)
    self.value = slider_val
end)

local function set_slider(val)
    slider_val = val
    slider.value = val
end

local text = wibox.widget({
    widget = wibox.widget.textbox,
    forced_width = dpi(40), -- prevent text changing size -> change slider size
    halign = "right",
})

local function set_text(num)
    text.text = tostring(num) .. "%"
end

overlay:setup({
    widget = wibox.container.margin,
    left = beautiful.corner_radius,
    right = beautiful.corner_radius,
    {
        layout = wibox.layout.align.horizontal,
        {
            widget = wibox.container.margin,
            top = dpi(9),
            bottom = dpi(9),
            icon,
        },
        {
            widget = wibox.container.margin,
            left = dpi(10),
            right = dpi(10),
            slider
        },
        text
    }
})

local timer = gears.timer({
    timeout = 2,
    single_shot = true,
    callback = function()
        overlay.visible = false
    end
})

local function show()
    -- Handle placement
    local top_margin
    local left_margin = beautiful.useless_gap * 2

    if client.focus.fullscreen then
        top_margin = left_margin
    else
        top_margin = left_margin * 2 + beautiful.wibar_height
    end

    awful.placement.top_left(
        overlay,
        {
            margins = {
                top = top_margin,
                left = left_margin
            },
            parent = awful.screen.focused()
        }
    )

    -- Show
    overlay.visible = true
    timer:again()
end

local function show_volume(volume, muted)
    show()

    local icon_name

    if muted then
        icon_name = "volume-x"
    elseif volume >= 67 then
        icon_name = "volume-2"
    elseif volume >= 33 and volume <= 66 then
        icon_name = "volume-1"
    else
        icon_name = "volume"
    end

    icon:set_icon(icon_name)
    set_slider(volume)
    set_text(volume)
end

awesome.connect_signal("widget::volume", show_volume)
