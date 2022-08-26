local awful = require("awful")
local gears = require("gears")

local themeFuncs = {}

function themeFuncs.themeWibar(screen, visible)
    return awful.wibar({
        screen = screen,
        visible = visible,
        position = "top",
        width = screen.geometry.width * 0.99,
        height = screen.geometry.height * 0.027,
        border_width = 4,
        ontop = false,

        shape = function (cr, width, height)
            return gears.shape.partially_rounded_rect(cr,width,height,
            true, true, true, true, 10)
        end
    })
end

function themeFuncs.startCompositor()
    local handle = io.popen("pidof picom")
    if not handle then return end
    local result = handle:read("*a")
    handle:close()
    if not result == "\n" then
        awful.spawn.with_shell("killall picom && picom --experimental-backend --config ~/.config/picom/picomdefault.conf")
    else
        awful.spawn.with_shell("picom --experimental-backend --config ~/.config/picom/picomdefault.conf")
    end
end

return themeFuncs
