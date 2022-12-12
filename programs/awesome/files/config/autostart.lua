local awful = require("awful")

-- Autostart
awful.spawn.with_shell("pgrep albert || nixGL albert")
