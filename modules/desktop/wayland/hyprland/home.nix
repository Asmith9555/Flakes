{ config, lib, pkgs, ... }:

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
    systemdIntegration = true;
    nvidiaPatches = true;
    settings = {
      "$MOD" = "SUPER";
      exec-one= [
        "mako &"
        "nm-applet --indicator &"
      ];
      input = {
        kb_layout = "us";
        kb_options = "caps:escape";

        follow_mouse = 1; # 0|1|2|3
        touchpad {
          natural_scroll = yes;
        };
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
        force_no_accel = 1;
      };
      general = {
        gaps_in = 3;
        gaps_out = 5;
        border_size = 1;
        "col.active_border" = "eb6f92";
        "col.inactive_border" = "#6e6a86";
        layout = dwindle; # master|dwindle 
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
        rounding = 2;
        multisample_edges = true;
        blur = true;
        blur_size = 4;
        blur_passes = 2;
        blur_new_optimizations = true;
        blur_ignore_opacity = true;
        drop_shadow = false;
        shadow_ignore_window = true;
        shadow_offset = "0 5";
        shadow_range = 50;
        shadow_render_power = 3;
        "col.shadow" = "rgba(00000099)";
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
      "$VIDEODIR" = "$HOME/Videos";
      "$NOTIFY" = "notify-send -h string:x-canonical-private-synchronouse:hypr-cfg -u low";
      "$SCREENSHOT" = "~/.config/hypr/scripts/screensht";
      "$COLORPICKER" = "~/.config/hypr/scripts/colorpicker";
      bind = [
        "$MOD, Escape, exec, wlogout -p layer-shell"
        "$MOD, V, exec, wf-recorder -f $VIDEODIR/$(date +%Y-%m-%d_%H-%M-%S).mp4"
        "$MOD, V, exec, $NOTIFY 'Recording started'"
        "$MODSHIFT, V, exec, killall -s SIGINT wf-recorder"
        "$MODSHIFT, V, exec, $NOTIFY 'Recording stopped'"

        ", Print, exec, $SCREENSHOT full"
        "$MODSHIFT, S, exec, $SCREENSHOT area"
        "$MODSHIFT, X, exec, $COLORPICKER"
        "$MOD, B, exec, firefox"
        "$MOD, M, exec, kitty --class='termfloat' --hold sh -c 'ncmpcpp'"
        "$MOD, D, exec, pkill rofi || ~/.config/rofi/launcher.sh"
        "$MODSHIFT, D, exec, bash ~/.config/rofi/powermenu.sh"

        "$MOD, Return, exec, kitty fish"
        "$MODSHIFT, Return, exec, kitty --class='termfloat' fish"
        "$MODSHIFT, L, exec, loginctl lock-session"

        "$MOD, Q, killactive"
        "$MODSHIFT, Q, exit"
        "$MOD, F, fullscreen"
        "$MOD, Space, togglefloating"
        "$MOD, P, pseudo"
        "$MOD, S, togglesplit"

        "$MODSHIFT, Space, workspaceopt, allfloat"
        "$MODSHIFT, Space, exec, $NOTIFY 'Toggled All floating'"
        "$MODSHIFT, P, workspaceopt, allpseudotile"
        "$MODSHIFT, P, exec, $NOTIFY ' Toggled All pseudotile'"

        "$MOD, Tab, cyclenext"
        "$MOD, Tab, bringactivetotop"

        "$MOD, A, togglespecialworkspace"
        "$MOD, A, exec, $NOTIFY 'Toggled special workspace'"
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
        "opacity 0.80 0.80,class:^(file-roller)$"
        "opacity 0.80 0.80,class:^(qt5ct)$"
        "opacity 0.80 0.80,class:^(discord)$"
        "opacity 0.80 0.70,class:^(pavucontrol)$"
        "opacity 0.80 0.70,class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "opacity 0.80 0.80,class:^(code-url-handler)$"
        "float,class:^(nemo)$"
        "move 25%-,class:^(nemo)$"
        "size 960 540,class:^(nemo)$"


        "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "float,class:^(pavucontrol)$"
        "float,title:^(Media viewer)$"
        "float,title:^(Volume Control)$"
        "float,title:^(Picture-in-Picture)$"
        "float,class:^(Viewnior)$"
        "float,title:^(DevTools)$"
        "float,class:^(file_progress)$"
        "float,class:^(confirm)$"
        "float,class:^(dialog)$"
        "float,class:^(download)$"
        "float,class:^(notification)$"
        "float,class:^(error)$"
        "float,class:^(confirmreset)$"
        "float,title:^(Open File)$"
        "float,title:^(branchdialog)$"
        "float,title:^(Confirm to replace files)$"
        "float,title:^(File Operation Progress)$"

        "noshadow, floating:0"

        "tile, title:^(Spotify)$"
        "workspace 9 silent, title:^(Spotify)$"
        "workspace 3, title:^(.*(Disc|WebC)ord.*)$"

        "idleinhibit focus, class:^(mpv|.+exe)$"
        "idleinhibit focus, class:^(firefox)$, title:^(.*YouTube.*)$"
        "idleinhibit fullscreen, class:^(firefox)$"

        "float,class:^(termfloat)$"
        "move 25%-,class:^(termfloat)$"
        "size 960 540,class:^(termfloat)$"
        "rounding 5,class:^(termfloat)$"
      
      
        "rounding 0, xwayland:1, floating:1"
        "center, class:^(.*jetbrains.*)$, title:^(Confirm Exit|Open Project|win424|win201|splash)$"
        "size 640 400, class:^(.*jetbrains.*)$, title:^(splash)$"

        "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "nofocus,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
      ];
    };
  };
}
