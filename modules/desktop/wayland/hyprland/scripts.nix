{ config, lib, pkgs, ... }:

let
  cava-internal = pkgs.writeShellScriptBin "cava-internal" ''
    cava -p ~/.config/cava/config1 | sed -u 's/;//g;s/0/▁/g;s/1/▂/g;s/2/▃/g;s/3/▄/g;s/4/▅/g;s/5/▆/g;s/6/▇/g;s/7/█/g;'
  '';
  wallpaper_random = pkgs.writeShellScriptBin "wallpaper_random" ''
    killall dynamic_wallpaper
    swww img $(find ~/Pictures/wallpaper/. -name "*.png" | shuf -n1) --transition-type random
  '';
  myswaylock = pkgs.writeShellScriptBin "myswaylock" ''
    swaylock  \
           --screenshots \
           --clock \
           --indicator \
           --indicator-radius 100 \
           --indicator-thickness 7 \
           --effect-blur 7x5 \
           --effect-vignette 0.5:0.5 \
           --ring-color eb6f92 \
           --key-hl-color ebbcba \
           --line-color 00000000 \
           --inside-color 00000088 \
           --separator-color 00000000 \
           --grace 3000\
           --fade-in 0.3
  '';
  # myi3lock = pkgs.writeShellScriptBin "myi3lock" ''
  # '';
  dynamic_wallpaper = pkgs.writeShellScriptBin "dynamic_wallpaper" ''
    swww img $(find ~/Pictures/wallpaper/. -name "*.png" | shuf -n1) --transition-type random
    OLD_PID=$!
    while true; do
        sleep 120
    swww img $(find ~/Pictures/wallpaper/. -name "*.png" | shuf -n1) --transition-type random
        NEXT_PID=$!
        sleep 5
        kill $OLD_PID
        OLD_PID=$NEXT_PID
    done
  '';
  default_wall = pkgs.writeShellScriptBin "default_wall" ''
    killall dynamic_wallpaper
    swww img "${../../wallpaper/default.png}" --transition-type random
  '';
in
{
  home.packages = with pkgs; [
    cava-internal
    wallpaper_random
    myswaylock
    dynamic_wallpaper
    default_wall
  ];
}
