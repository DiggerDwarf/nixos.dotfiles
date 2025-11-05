{ config, pkgs, ... }:
let
    font_family = "Maple Mono NF CN";
    monitor = "";
in {
    programs.hyprlock.enable = true;
    programs.hyprlock.settings = {
        general = {
            hide_cursor = true;
            ignore_empty_input = true;
        };

        animations = {
            bezier = [ "linear, 1, 1, 0, 0" ];
            animation = [
                "fadeIn, 1, 5, linear"
                "fadeOut, 1, 5, linear"
                "inputFieldDots, 1, 2, linear"
            ];
        };

        background = [{
            path = "screenshot";
            blur_passes = 3;
            blur_size = 8;
        }];

        input-field = [{
            inherit monitor;
            size = "20%, 5%";
            outline_thickness = 3;
            inner_color = "rgba(0, 0, 0, 0.0)"; # no fill

            outer_color = "rgba(33ccffee) rgba(00ff99ee) 45deg";
            check_color = "rgba(00ff99ee) rgba(ff6633ee) 120deg";
            fail_color = "rgba(ff6633ee) rgba(ff0066ee) 40deg";

            font_color = "rgb(143, 143, 143)";
            fade_on_empty = false;
            rounding = 15;

            inherit font_family;
            placeholder_text = "Input password...";
            fail_text = "$PAMFAIL";

            dots_spacing = 0.3;
            
            position = "0, -20";
            halign = "center";
            valign = "center";
        }];

        label = [{
            inherit monitor;
            text = " $TIME";
            font_size = 90;
            inherit font_family;

            position = "0, -20%";

            halign = "center";
            valign = "top";
        }];
        # image = [{
        #     inherit monitor;
        #     path = "$HOME/Pictures/wallpapers/pink_sky.jpg";
        # }];
    };
}