-- Mostly from https://github.com/elenapan/dotfiles/issues/149 (github: iojcde)
-- Signals volume changes, depends on a PulseAudio-compatible environment (pactl)

local awful = require("awful")

local sink = "@DEFAULT_SINK@"
local get_vol_cmd = string.format("pactl get-sink-volume %s", sink)
local get_mute_cmd = string.format("pactl get-sink-mute %s", sink)

local set_vol_cmd_template = string.format("pactl set-sink-volume %s %%s%%%%", sink)
local mute_cmd_template = string.format("pactl set-sink-mute %s %%s", sink)

local volume
local muted

local function emit_volume_info()
    awful.spawn.easy_async(get_vol_cmd, function(vol_stdout)
        awful.spawn.easy_async(get_mute_cmd, function(mute_stdout)
            local new_vol = tonumber(vol_stdout:match("(%d+)%% /"))
            local new_mute = mute_stdout:match("Mute: (%l+)") == "yes"

            if volume ~= new_vol or muted ~= new_mute then
                volume = new_vol
                muted = new_mute

                awesome.emit_signal("widget::volume", volume, muted)
            end
        end)
    end)
end

emit_volume_info()

-- LANG=C: disable localization
-- --line-buffered: buffer non-interactive output based on newlines and not set number of bytes
local volume_script = [[
    bash -c "
    LANG=C pactl subscribe 2> /dev/null | grep --line-buffered \"Event 'change' on sink #\"
    "
]]

awful.spawn.easy_async({
    "pkill", -- kill old instances
    "--full", -- match full cmd
    "--uid", os.getenv("USER"),
    "^pactl subscribe"
}, function()
    awful.spawn.with_line_callback(volume_script, {
        stdout = function(line)
            emit_volume_info()
        end
    })
end)

-- Handle volume set

local setting_volume = false

awesome.connect_signal("signal::volume_change", function(opts)
    if setting_volume then
        return
    end

    if opts.inc or opts.dec then
        local vol

        local target_vol
        if opts.inc then
            target_vol = volume + opts.inc
        else
            target_vol = volume - opts.dec
        end

        target_vol = math.max(math.min(target_vol, 100), 0)
        if target_vol == volume and not muted then
            -- nothing to change, show overlay and do nothing else
            awesome.emit_signal("widget::volume", volume, muted)
            return
        end

        setting_volume = true
        local function set_vol()
            awful.spawn.easy_async(string.format(set_vol_cmd_template, tostring(target_vol)), function()
                setting_volume = false
            end)
        end

        if was_muted then
            awful.spawn.easy_async(string.format(mute_cmd_template, "0"), set_vol)
        else
            set_vol()
        end
    elseif opts.mute then
        if opts.mute ~= "toggle" then
            local should_mute = opts.mute == 1

            if should_mute == muted then
                awesome.emit_signal("widget::volume")
                return
            end
        end

        setting_volume = true
        awful.spawn.easy_async(string.format(mute_cmd_template, tostring(opts.mute)), function()
            setting_volume = false
        end)
    end
end)
