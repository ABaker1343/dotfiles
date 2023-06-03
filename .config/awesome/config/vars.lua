modkey = "Mod4" -- super key
--terminal = "WINIT_X11_SCALE_FACTOR=1.0 alacritty"
terminal = "kitty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
