{ config, pkgs, ... }:
{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "hyprlock";
        unlock_cmd = "pkill hyprlock -USR1";
      };
      listener = [{
        timeout = 900;
        on-timeout = "loginctl lock-session";
        on-resume = "";
      }];
    };
  };
}