-- layout toggle
hl.bind(mainMod .. " + SPACE", function()
    if current_layout == "scrolling" then
        current_layout = "dwindle"
        hl.config({ general = { layout = "dwindle" } })
    else
        current_layout = "scrolling"
        hl.config({ general = { layout = "scrolling" } })
    end
end)

-- layout-aware SUPER + F: fullscreen em dwindle, colresize +conf em scrolling
hl.bind(mainMod .. " + F", function()
    if current_layout == "scrolling" then
        hl.dispatch(hl.dsp.layout("colresize +conf"))
    else
        hl.dispatch(hl.dsp.window.fullscreen({ mode = 1 }))
    end
end)

-- layout-aware brackets: preselect em dwindle, swapcol em scrolling
hl.bind(mainMod .. " + bracketleft", function()
    if current_layout == "scrolling" then
        hl.dispatch(hl.dsp.layout("swapcol l"))
    else
        hl.dispatch(hl.dsp.layout("preselect l"))
    end
end)

hl.bind(mainMod .. " + bracketright", function()
    if current_layout == "scrolling" then
        hl.dispatch(hl.dsp.layout("swapcol r"))
    else
        hl.dispatch(hl.dsp.layout("preselect r"))
    end
end)

-- apps
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W",      hl.dsp.window.close())
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + Alt_L", hl.dsp.layout("togglesplit"))

-- fullscreen (always native; SHIFT+F is true fullscreen, F is mode=1 via script)
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())

-- screenshot
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("flameshot gui"))
hl.bind(mainMod .. " + Escape",    hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-monitor.sh"))
hl.bind(mainMod .. " + F11", hl.dsp.exec_cmd("~/.config/hypr/scripts/opacity.sh down"))
hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd("~/.config/hypr/scripts/opacity.sh up"))

-- dms
hl.bind(mainMod .. " + R",     hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind(mainMod .. " + V",     hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd("dms ipc call settings toggle"))
hl.bind(mainMod .. " + N",     hl.dsp.exec_cmd("dms ipc call notifications toggle"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("dms ipc call notepad toggle"))
hl.bind(mainMod .. " + Y",     hl.dsp.exec_cmd("dms ipc call dankdash wallpaper"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("dms ipc call lock lock"))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("dms ipc call powermenu toggle"))
hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd("dms ipc call processlist toggle"))

-- brightness (media keys)
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- grimblast
hl.bind("XF86Launch1",          hl.dsp.exec_cmd("grimblast copy area"),  { locked = true })
hl.bind("CTRL + XF86Launch1",   hl.dsp.exec_cmd("grimblast copy screen"), { locked = true })
hl.bind("ALT + XF86Launch1",    hl.dsp.exec_cmd("grimblast copy active"), { locked = true })
hl.bind("Print",                hl.dsp.exec_cmd("grimblast copy area"),   { locked = true })
hl.bind("CTRL + Print",         hl.dsp.exec_cmd("grimblast copy screen"),  { locked = true })
hl.bind("ALT + Print",          hl.dsp.exec_cmd("grimblast copy active"),  { locked = true })

-- dpms
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.dpms({ action = "disable" }))

-- focus movement
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + H",     hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + J",     hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + K",     hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + L",     hl.dsp.focus({ direction = "r" }))

-- window movement
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + H",     hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + J",     hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + K",     hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + L",     hl.dsp.window.move({ direction = "r" }))

-- focus first/last
hl.bind(mainMod .. " + Home", hl.dsp.exec_cmd("hyprctl dispatch focuswindow first"))
hl.bind(mainMod .. " + End",  hl.dsp.exec_cmd("hyprctl dispatch focuswindow last"))

-- workspaces
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- special workspaces
hl.bind(mainMod .. " + Q",          hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + Q",  hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + A",          hl.dsp.workspace.toggle_special("llm"))
hl.bind(mainMod .. " + SHIFT + A",  hl.dsp.window.move({ workspace = "special:llm" }))

-- scroll workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- groups
hl.bind("ALT + Z",             hl.dsp.group.toggle())

--hl.bind("ALT + Tab",            hl.dsp.window.cycle_next({ next = false }))
--hl.bind("ALT + SHIFT + Tab",   hl.dsp.window.cycle_next({ next = true }))
hl.bind("ALT + Tab",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + Tab",   hl.dsp.group.next())

-- mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true, description = "Move window" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })

-- media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- lid switch (usa script inteligente: disabled com externo, DPMS sem externo)
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("~/.config/hypr/scripts/lid-handler.sh open"), { locked = true })
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("~/.config/hypr/scripts/lid-handler.sh close"), { locked = true })
