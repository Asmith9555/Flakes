{ inputs, pkgs, ... }:

{
  imports = [
    (import ./env.nix)
    (import ./scripts.nix)
  ];
  programs = {
    bash = {
      initExtra = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
           exec  Hyprland
        fi
      '';
    };
  };
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    systemdIntegration = true;
    enableNvidiaPatches = true;
    extraConfig = ''
      bind = $MOD, R, submap, resize
      submap = resize
      binde = , L, resizeactive, 10 0
      binde = , H, resizeactive, -10 0
      binde = , K, resizeactive, 0 -10
      binde = , J, resizeactive, 0 10
      bind = , escape, submap, reset
      submap = reset
    '';
    settings = {
      "$MOD" = "SUPER";
      monitor = [
        "DP-1-3, 1920x1080, 1920x0, 1"
        "eDP-1, 1920x1080, 0x0, 1"
      ];
      exec-once= [
        "mako &"
        "eww open-many quote date music clock &"
        "nm-applet --indicator &"
      ];
      input = {
        kb_layout = "us";
        kb_options = "caps:escape";

        follow_mouse = 2; # 0|1|2|3
        touchpad = {
          natural_scroll = true;
        };
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
        force_no_accel = 1;
      };
      general = {
        gaps_in = 5;
        gaps_out = 7;
        border_size = 1.5;
        "col.active_border" = "0xffe0def4";
        "col.inactive_border" = "0x006e6a86";
        layout = "dwindle"; # master|dwindle 
      };
      animation = {
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };
      dwindle = {
        no_gaps_when_only = false;
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_is_master = true;
      };
      decoration = {
        rounding = 0;
        multisample_edges = true;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        # blur_xray = true;
        drop_shadow = false;
        shadow_range = 50;
        shadow_render_power = 3;
        "col.shadow" = "rgba(00000099)";
      };
      bind = [
        "$MOD, Escape, exec, wlogout -p layer-shell"
        "$MOD, V, exec, wf-recorder -f ~/Videos/$(date +%Y-%m-%d_%H-%M-%S).mp4"
        "$MODSHIFT, V, exec, killall -s SIGINT wf-recorder"
        "$MODSHIFT, X, exec, alacritty --class='bgterm' -e hyprpicker"
        "$MOD, D, exec, pkill rofi || ~/.config/rofi/launcher.sh"
        "$MODSHIFT, D, exec, bash ~/.config/rofi/powermenu.sh"

        "$MOD, Return, exec, kitty fish"
        "$MODSHIFT, Return, exec, kitty --class='termfloat' fish"
        "$MOD, I, exec, alacritty --class='bgterm'"
        "$MODSHIFT, L, exec, myswaylock"

        "$MOD, Q, killactive"
        "$MOD, F, fullscreen"
        "$MOD, Space, togglefloating"
        "$MOD, P, pseudo"
        "$MOD, E, togglesplit"

        "$MOD, Tab, cyclenext"
        "$MOD, Tab, bringactivetotop"

        "$MOD, A, togglespecialworkspace"
        "$MOD, A, exec, 'Toggled special workspace'"
        "$MODSHIFT, A, movetoworkspace, special"
        "$MOD, C, exec, hyprctl dispatch centerwindow"

        "${builtins.concatStringsSep "\n" (builtins.genList (
          x: let
            ws = let
              c = (x + 1) / 10;
            in
              builtins.toString (x + 1 - (c * 10));
          in ''
            bind = $MOD, ${ws}, workspace, ${toString (x + 1)}
            bind = $MODSHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}
          ''
        )
        10)}"

        "$MOD, mouse_down, workspace, e-1"
        "$MOD, mouse_up, workspace, e+1"
      ];
      bindm = [
        "$MOD, mouse:272, movewindow"
        "$MOD, mouse:273, resizewindow"
      ];
      windowrulev2 = [
        "opacity 0.80 0.80,class:^(Steam)$"
        "opacity 0.80 0.80,class:^(steam)$"
        "opacity 0.80 0.80,class:^(steamwebhelper)$"
        "opacity 0.80 0.80,class:^(Spotify)$"
        "opacity 0.80 0.80,class:^(discord)$"

        
        "float,title:^(Nemo)$"
        "move 25%-,title:^(Nemo)$"
        "size 960 540,title:^(Nemo)$"


        "float,class:^(file_progress)$"
        "float,class:^(confirm)$"
        "float,class:^(dialog)$"
        "float,class:^(download)$"
        "float,class:^(notification)$"
        "float,class:^(error)$"
        "float,class:^(confirmreset)$"
        "float,title:^(Open File)$"
        "float,title:^(branchdialog)$"
        "float,title:^(File Operation Progress)$"

        "idleinhibit focus, class:^(mpv|.+exe)$"
        "idleinhibit focus, class:^(firefox)$, title:^(.*YouTube.*)$"

        "float,class:^(termfloat)$"
        "move 25%-,class:^(termfloat)$"
        "size 960 540,class:^(termfloat)$"
        "rounding 5,class:^(termfloat)$"
      
        "float,class:^(bgterm)$"
        "move 25%- 25%+,class:^(bgterm)$"
        "size 350 350,class:^(bgterm)$"
        "noborder,class:^(bgterm)$"
        "noblur,class:^(bgterm)$"
        "noanim,class:^(bgterm)$"
      ];
    };
  };
}
