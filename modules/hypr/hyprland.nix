{ config, pkgs, ... }:
let
    terminal = "kitty";
    menu = "rofi -show drun";
in {
    home.file.".config/hypr/hyprland".source = ./../../files/hyprland.conf;
    wayland.windowManager.hyprland = {
        enable = false;
        monitor = [
            "DP-1, preferred, 0x0, auto"
            "DP-2, preferred, 0x0, auto"
            "HDMI-A-1, preferred, 0x0, auto"
            "eDP-1, 2880x1800@120, auto, 1.5"
        ];
        exec-once = [
            "swww-daemon"
            "quickshell"
        ];
        env = [
            "XCURSOR"
        ];
    };
}