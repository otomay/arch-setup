terminal       = "kitty"
fileManager    = "dolphin"
mainMod        = "SUPER"
current_layout = "scrolling"

package.loaded["hyprland.keybinds.globais"] = nil
package.loaded["hyprland.keybinds.dwindle"] = nil
package.loaded["hyprland.keybinds.scroll"]  = nil

require("hyprland.keybinds.globais")
require("hyprland.keybinds.dwindle")
require("hyprland.keybinds.scroll")
