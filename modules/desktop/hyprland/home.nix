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
        "DP-1-2, 1920x1080, 1920x0, 1"
        "eDP-1, 1920x1080, 0x0, 1"
      ];
      workspace = [
        "eDP-1,1"
        "eDP-1,2"
        "eDP-1,3"
        "eDP-1,4"
        "eDP-1,5"
        "DP-1-2,11"
        "DP-1-2,12"
        "DP-1-2,13"
        "DP-1-2,14"
        "DP-1-2,15"
        "DP-1-3,11"
        "DP-1-3,12"
        "DP-1-3,13"
        "DP-1-3,14"
        "DP-1-3,15"
      ];
      exec-once= [
        "eww open-many quote date music clock &"
      ];
      input = {
        kb_layout = "us";
        kb_options = "caps:escape";

        follow_mouse = 1; # 0|1|2|3
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
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        drop_shadow = false;
        shadow_range = 50;
        shadow_render_power = 3;
        "col.shadow" = "rgba(00000099)";
      };
      bind = [
        "CTRLSUPERALT,Q,exit,"
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
        "$MOD, h, movefocus, l"
        "$MOD, j, movefocus, d"
        "$MOD, k, movefocus, u"
        "$MOD, l, movefocus, r"
        "$MOD, h, swapwindow, l"
        "$MOD, j, swapwindow, d"
        "$MOD, k, swapwindow, u"
        "$MOD, l, swapwindow, r"
        
        "$MOD, Tab, cyclenext"
        "$MOD, Tab, bringactivetotop"

        "$MOD, V, togglespecialworkspace"
        # "$MOD, V, exec, 'Toggled special workspace'"
        "$MODSHIFT, V, movetoworkspace, special"

        "$MOD, bracketleft, focusmonitor, -1"
        "$MOD, bracketright, focusmonitor, 1"
        "$MODSHIFT, bracketleft, movewindow, mon:-1"
        "$MODSHIFT, bracketright, movewindow, mon:1"
        "$MOD, Backspace, swapactiveworkspaces, current +1"
        
        "${builtins.concatStringsSep "\n" (builtins.genList (
          x: let
            ws = let
              c = (x + 1) / 10;
            in
              builtins.toString (x + 1 - (c * 10));
          in ''
            bind=$MOD, ${ws}, exec, hyprsome workspace ${toString (x + 1)}
            bind=$MODSHIFT, ${ws}, exec, hyprsome move ${toString (x + 1)}
          ''
        )
        5)}"

        "$MOD, mouse_down, workspace, e-1"
        "$MOD, mouse_up, workspace, e+1"
      ];
      bindm = [
        "$MOD, mouse:272, movewindow"
        "$MOD, mouse:273, resizewindow"
      ];
      binde = [
        # volume controls
        ",XF86AudioRaiseVolume, exec, pamixer -i 5"
        ",XF86AudioLowerVolume, exec, pamixer -d 5"
        ",XF86AudioMute, exec, pamixer -t"
        ",XF86AudioMicMute,exec, pamixer --default-source -t"
        # brightness controls
        ",XF86MonBrightnessUp,exec,light -A 5"
        ",XF86MonBrightnessDown,exec,light -U 5"
      ];
      windowrulev2 = [
        "opacity 0.80 0.80,class:^(Steam)$"
        "opacity 0.80 0.80,class:^(steam)$"
        "opacity 0.80 0.80,class:^(steamwebhelper)$"
        "opacity 0.80 0.80,class:^(Spotify)$"
        "opacity 0.80 0.80,class:^(discord)$"

        "float,class:^(org.keepassxc.KeePassXC)$"
        "size 960 540,class:^(org.keepassxc.KeePassXC)$"
        
        "float,class:^(nemo)$"
        "size 960 540,class:^(nemo)$"

        "float,title:^(Virtual Machine Manager)$"
        "float,title:^(QEMU/KVM - Connection Details)$"
        "size 600 540,title:^(Virtual Machine Manager)$"

        "float,class:^(file_progress)$"
        "float,class:^(imv)$"
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
        "size 350 350,class:^(bgterm)$"
        "noborder,class:^(bgterm)$"
        "noblur,class:^(bgterm)$"
        "noanim,class:^(bgterm)$"
      ];
    };
  };
}
