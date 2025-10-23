{ config, pkgs, ... }:
{
  programs.hypridle = {
    enable = true;
    settings = {
      listener = [{
        timeout = 5;
        on-timeout = "kitten notify sadge";
        on-resume = "kitten notify yippee";
      }];
    };
  };
}