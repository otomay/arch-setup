hl.window_rule({
    name  = "suppress-event-maximize",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "float-pavucontrol",
    match = { class = "^(org.pulseaudio.pavucontrol)$", title = "^(Volume Control)$" },
    float = true,
})

hl.window_rule({
    name  = "float-clipse",
    match = { class = "clipse" },
    float = true,
})

hl.window_rule({
    name  = "size-clipse",
    match = { class = "clipse" },
    size  = { 800, 800 },
})

hl.window_rule({
    name  = "float-gnome-text-editor",
    match = { class = "(org.gnome.TextEditor)" },
    float = true,
})

hl.window_rule({
    name  = "size-gnome-text-editor",
    match = { class = "(org.gnome.TextEditor)" },
    size  = { 400, 500 },
})

hl.window_rule({
    name  = "tile-wezterm",
    match = { class = "^(org%.wezfurlong%.wezterm)$" },
    float = false,
    border_size = 0,
})

hl.window_rule({
    name  = "rounding-gnome",
    match = { class = "^(org%.gnome%.)" },
    rounding    = 12,
    border_size = 0,
})

hl.window_rule({
    name  = "tile-gnome-control-center",
    match = { class = "^(gnome-control-center)$" },
    float = false,
})

hl.window_rule({
    name  = "tile-pavucontrol",
    match = { class = "^(pavucontrol)$" },
    float = false,
})

hl.window_rule({
    name  = "tile-nm-connection-editor",
    match = { class = "^(nm-connection-editor)$" },
    float = false,
})

hl.window_rule({
    name  = "float-gnome-calculator",
    match = { class = "^(gnome-calculator)$" },
    float = true,
})

hl.window_rule({
    name  = "float-galculator",
    match = { class = "^(galculator)$" },
    float = true,
})

hl.window_rule({
    name  = "float-blueman-manager",
    match = { class = "^(blueman-manager)$" },
    float = true,
})

hl.window_rule({
    name  = "float-nautilus",
    match = { class = "^(org%.gnome%.Nautilus)$" },
    float = true,
})

hl.window_rule({
    name  = "float-steam",
    match = { class = "^(steam)$" },
    float = true,
})

hl.window_rule({
    name  = "float-xdg-desktop-portal",
    match = { class = "^(xdg-desktop-portal)$" },
    float = true,
})

hl.window_rule({
    name  = "no-border-alacritty",
    match = { class = "^(Alacritty)$" },
    border_size = 0,
})

hl.window_rule({
    name  = "no-border-zen",
    match = { class = "^(zen)$" },
    border_size = 0,
})

hl.window_rule({
    name  = "no-border-ghostty",
    match = { class = "^(com%.mitchellh%.ghostty)$" },
    border_size = 0,
})

hl.window_rule({
    name  = "no-border-kitty",
    match = { class = "^(kitty)$" },
    border_size = 0,
})

hl.window_rule({
    name  = "float-firefox-pip",
    match = { class = "^(firefox)$", title = "^(Picture-in-Picture)$" },
    float = true,
})

hl.window_rule({
    name  = "float-zoom",
    match = { class = "^(zoom)$" },
    float = true,
})

hl.window_rule({
    name  = "opacity-tiled-unfocused",
    match = { float = false, focus = false },
    opacity = "0.9",
})

hl.layer_rule({
    name  = "no-anim-quickshell",
    match = { namespace = "^(quickshell)$" },
    no_anim = true,
})
