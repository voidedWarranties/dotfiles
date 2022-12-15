local wibox = require("wibox")

local base_path = os.getenv("HOME") .. "/.ksk/assets/feather/"

return function(icon_name, color)
    local widget = wibox.widget.imagebox()
    widget.resize = true

    function widget:set_icon(new_name)
        if new_name then
            self.image = base_path .. new_name .. ".svg"
        else
            self.image = nil
        end
    end

    widget:set_icon(icon_name)

    if color then
        widget.stylesheet = string.format("* { stroke: %s; }", color)
    end

    return widget
end
