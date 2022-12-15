local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local main_menu = require("config.ui.main_menu")

-- Create a textclock widget
clock = wibox.widget({
    widget = wibox.widget.textclock,
    format = "%m.%d %H:%M:%S",
    refresh = 1,
})

local launcher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = main_menu
})

screen.connect_signal("request::desktop_decoration", function(s)
    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    s.layoutbox = awful.widget.layoutbox({ screen = s })

    s.taglist = awful.widget.taglist({
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = {
            awful.button({ }, 1, function(t) t:view_only() end),
            awful.button(
                { modkey }, 1,
                function(t)
                    if client.focus then
                        client.focus:move_to_tag(t)
                    end
                end
            ),
            awful.button({ }, 3, awful.tag.viewtoggle),
            awful.button(
                { modkey }, 3,
                function(t)
                    if client.focus then
                        client.focus:toggle_tag(t)
                    end
                end
            ),
        },
        widget_template = {
            {
                id     = "text_role",
                widget = wibox.widget.textbox,
            },
            margins = dpi(4),
            widget  = wibox.container.margin,
        }
    })

    local function tasklist_update(self, this_client, idx, objects)
        self:get_children_by_id("text_role")[1]:set_visible(this_client == client.focus)
    end

    s.tasklist = awful.widget.tasklist({
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = {
            awful.button({ }, 1, function(c)
                c:activate({ context = "tasklist", action = "toggle_minimization" })
            end),
            awful.button({ }, 3, function() awful.menu.client_list({ theme = { width = 250 } }) end),
        },
        layout = {
            layout = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    layout = wibox.layout.fixed.horizontal,
                    spacing = dpi(4),
                    {
                        {
                            id = "icon_role",
                            widget = wibox.widget.imagebox,
                        },
                        widget = wibox.container.margin,
                        top = beautiful.icon_margin,
                        bottom = beautiful.icon_margin,
                    },
                    {
                        id = "text_role",
                        widget = wibox.widget.textbox,
                    },
                },
                widget = wibox.container.margin,
                left = dpi(10),
                right = dpi(10),
            },
            id = "background_role",
            widget = wibox.container.background,

            update_callback = tasklist_update,
            create_callback = tasklist_update,
        },
    })

    local function rounded_rect(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, beautiful.corner_radius)
    end

    s.wibox = awful.wibar({
        position = "top",
        screen = s,
        margins = {
            top = beautiful.useless_gap * 2,
        },
        bg = "#00000000",
        widget = {
            layout = wibox.layout.align.horizontal,
            expand = "none",
            {
                widget = wibox.container.margin,
                left = beautiful.useless_gap * 2,
                {
                    widget = wibox.container.background,
                    bg = beautiful.bg_normal,
                    shape = rounded_rect,
                    {
                        widget = wibox.container.margin,
                        left = beautiful.corner_radius,
                        right = beautiful.corner_radius,
                        {
                            layout = wibox.layout.fixed.horizontal,
                            spacing = beautiful.corner_radius,
                            {
                                widget = wibox.container.margin,
                                top = beautiful.corner_radius,
                                bottom = beautiful.corner_radius,
                                launcher,
                            },
                            s.taglist,
                        }
                    }
                }
            },
            {
                widget = wibox.container.background,
                shape = rounded_rect,
                s.tasklist,
            },
            {
                widget = wibox.container.background,
                bg = beautiful.bg_normal,
                shape = function(cr, width, height)
                    gears.shape.partially_rounded_rect(
                        cr, width, height,
                        true, false, false, true,
                        beautiful.corner_radius
                    )
                end,
                {
                    layout = wibox.layout.fixed.horizontal,
                    spacing = beautiful.corner_radius,
                    {
                        widget = wibox.container.margin,
                        left = beautiful.corner_radius,
                        wibox.widget.systray(),
                    },
                    clock,
                    {
                        widget = wibox.container.margin,
                        margins = dpi(3),
                        s.layoutbox,
                    }
                }
            }
        }
    })
end)
