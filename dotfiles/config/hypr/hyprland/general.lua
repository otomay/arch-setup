hl.config({
    general = {
        gaps_in  = 4,
        gaps_out = 8,
        border_size = 1,
        col = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing    = false,
        layout = "dwindle",
    },
    decoration = {
        rounding       = 8,
        rounding_power = 2,
        active_opacity   = 0.92,
        inactive_opacity = 0.9,
        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },
        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },
    input = {
        kb_layout  = "br",
        kb_variant = "abnt2",
        kb_model   = "abnt2",
        kb_options = "",
        kb_rules   = "",
        follow_mouse = 1,
        sensitivity = -0.5,
        touchpad = {
            natural_scroll = false,
        },
    },
    misc = {
        force_default_wallpaper   = -1,
        disable_hyprland_logo     = true,
        disable_splash_rendering  = true,
        vrr                       = 1,
        on_focus_under_fullscreen = 1,
    },
})

hl.config({
    group = {
        groupbar = {
            enabled      = true,
            col = {
                active   = "rgba(ffffffdd)",
                inactive = "rgba(99999988)",
            },
            font_size    = 12,
            height       = 20,
            render_titles = true,
            rounding     = 5,
        },
    },
})

hl.config({
    dwindle = {
        preserve_split       = true,
        force_split          = 2,
        special_scale_factor = 0.9,
    },
})

hl.config({
    master = {
        new_status = "master",
        mfact      = 0.75,
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = false,
        focus_fit_method         = 0,
        follow_focus             = true,
        column_width             = 0.8,
    },
})

hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})
