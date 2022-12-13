local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

--- {{{ From awesomewm master
--      See: https://github.com/awesomeWM/awesome/blob/1239cdf4bc9208f57e4bf018d462c2ee63bf0387/lib/awful/titlebar.lua#L864-L887
local capi = { client = client }
local instances = {}

-- Do the equivalent of
--     c:connect_signal(signal, widget.update)
-- without keeping a strong reference to the widget.
local function update_on_signal(c, signal, widget)
    local sig_instances = instances[signal]
    if sig_instances == nil then
        sig_instances = setmetatable({}, { __mode = "k" })
        instances[signal] = sig_instances
        capi.client.connect_signal(signal, function(cl)
            local widgets = sig_instances[cl]
            if widgets then
                for _, w in pairs(widgets) do
                    w.update()
                end
            end
        end)
    end
    local widgets = sig_instances[c]
    if widgets == nil then
        widgets = setmetatable({}, { __mode = "v" })
        sig_instances[c] = widgets
    end
    table.insert(widgets, widget)
end
--- }}}

local client_props = { "floating", "maximized", "maximized_horizontal", "maximized_vertical", "sticky", "ontop" }
local client_chars = { "f", "m", "h", "v", "s", "t" }

local function client_indicator(c)
    local text = wibox.widget.textbox()
    text.font = beautiful.mono_font

    local function update()
        local contents = ""

        for i, prop in ipairs(client_props) do
            char = client_chars[i]

            if c[prop] then
                contents = contents .. char
            else
                contents = contents .. "-"
            end
        end

        text.text = contents
    end

    update()
    text.update = update

    for i, prop in ipairs(client_props) do
        update_on_signal(c, "property::" .. prop, text)
    end

    return text
end

client.connect_signal("request::titlebars", function(c)
    local buttons = {
        awful.button({ }, 1, function()
            c:activate({ context = "titlebar", action = "mouse_move" })
        end),
        awful.button({ }, 3, function()
            c:activate({ context = "titlebar", action = "mouse_resize" })
        end),
    }

    awful.titlebar(c).widget = {
        widget = wibox.container.margin,
        left = beautiful.icon_margin,
        right = beautiful.icon_margin,
        {
            layout = wibox.layout.align.horizontal,
            {
                layout  = wibox.layout.fixed.horizontal,
                spacing = beautiful.icon_margin,
                buttons = buttons,
                {
                    widget = wibox.container.margin,
                    top = beautiful.icon_margin,
                    bottom = beautiful.icon_margin,
                    awful.titlebar.widget.iconwidget(c),
                },
                awful.titlebar.widget.titlewidget(c),
            },
            {
                layout  = wibox.layout.flex.horizontal,
                buttons = buttons
            },
            client_indicator(c)
        }
    }
end)
