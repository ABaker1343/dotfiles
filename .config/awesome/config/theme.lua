local theme = "default"
local cThemePath = string.format("%s/.config/awesome/themes/currentTheme", os.getenv("HOME"))

local themeFile = io.open(cThemePath)
if themeFile then
    theme = themeFile:read("*a")
    themeFile:close()
    theme = theme:sub(1, -2) -- remove the newline
    gears.debug.print_warning(theme)
    gears.debug.print_warning("theme found")
else
    gears.debug.print_warning("couldnt read current theme file")
end

local themepath = string.format("%s/.config/awesome/themes/%s/", os.getenv("HOME"), theme)

beautiful.init(themepath .. "theme.lua")
themeFuncs = dofile(themepath .. "imports.lua")
