-- dwindle/master resize binds (no-ops in scrolling)
hl.bind(mainMod .. " + CTRL + F", hl.dsp.exec_cmd("hyprctl dispatch resizeactive exact 100%"))

hl.bind(mainMod .. " + code:20", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { description = "Expand window left" })
hl.bind(mainMod .. " + code:21", hl.dsp.window.resize({ x = 100, y = 0, relative = true }),  { description = "Shrink window left" })

hl.bind(mainMod .. " + minus",        hl.dsp.exec_cmd("hyprctl dispatch resizeactive -10% 0"), { repeating = true })
hl.bind(mainMod .. " + equal",        hl.dsp.exec_cmd("hyprctl dispatch resizeactive 10% 0"),  { repeating = true })
hl.bind(mainMod .. " + SHIFT + minus", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -10%"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + equal", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 10%"),  { repeating = true })
