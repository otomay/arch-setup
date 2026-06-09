local function lid_is_closed()
    local f = io.popen("cat /proc/acpi/button/lid/*/state 2>/dev/null")
    if not f then return false end
    local state = f:read("*a")
    f:close()
    return state ~= nil and state:match("closed") ~= nil
end

local function has_external_monitor()
    local connectors = {
        "/sys/class/drm/card1-HDMI-A-1/status",
        "/sys/class/drm/card1-HDMI-A-2/status",
        "/sys/class/drm/card1-DP-1/status",
        "/sys/class/drm/card1-DP-2/status",
    }
    for _, path in ipairs(connectors) do
        local f = io.open(path, "r")
        if f then
            local status = f:read("*l")
            f:close()
            if status == "connected" then return true end
        end
    end
    return false
end

local laptop_closed = lid_is_closed()
local disable_internal = laptop_closed and has_external_monitor()

hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@60.00",
    position = "1920x200",
    scale    = 1.50,
    disabled = disable_internal,
})

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@120.00",
    position = "0x0",
    scale    = 1.00,
})