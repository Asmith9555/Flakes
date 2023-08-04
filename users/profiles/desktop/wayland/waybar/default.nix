{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    style = ''
            * {
              font-family: "JetBrainsMono Nerd Font";
              font-size: 12pt;
              font-weight: bold;
              border-radius: 0px;
              transition-property: background-color;
              transition-duration: 0.5s;
            }
            @keyframes blink_red {
              to {
                background-color: rgb(180,99,122);
                color: rgb(250,244,237);
              }
            }
            .warning, .critical, .urgent {
              animation-name: blink_red;
              animation-duration: 1s;
              animation-timing-function: linear;
              animation-iteration-count: infinite;
              animation-direction: alternate;
            }
            window#waybar {
              background-color: transparent;
            }
            window > box {
              margin-left: 5px;
              margin-right: 5px;
              margin-top: 5px;
              background-color: rgb(250, 244, 237);
            }
      #workspaces {
              padding-left: 0px;
              padding-right: 4px;
            }
      #workspaces button {
              padding-top: 5px;
              padding-bottom: 5px;
              padding-left: 6px;
              padding-right: 6px;
              color: rgb(86,148,159);
            }
      #workspaces button.active {
              background-color: rgb(86,148,159);
              color: rgb(250, 244, 237);
            }
      #workspaces button.urgent {
              color: rgb(250, 244, 237);
            }
      #workspaces button:hover {
              background-color: rgb(40,105,131);
              color: rgb(250,244,237);
            }
            tooltip {
               background: rgb(40,105,131);
             }
            tooltip label {
               color: rgb(250,244,237);
            }
      #custom-launcher {
              font-size: 20px;
              padding-left: 8px;
              padding-right: 2px;
              color: rgb(86,148,159);
            }
      #mode, #clock, #memory, #temperature,#cpu,#mpd, #custom-wall, #temperature, #backlight, #pulseaudio, #network, #battery, #custom-powermenu, #custom-cava-internal {
              padding-left: 10px;
              padding-right: 10px;
            }
            /* #mode { */
            /* 	margin-left: 10px; */
            /* 	background-color: rgb(248, 189, 150); */
            /*     color: rgb(87,82,121); */
            /* } */
      #memory {
              color: rgb(86,148,159);
            }
      #cpu {
              color: rgb(86,148,159);
            }
      #clock {
              color: rgb(87,82,121);
            }
      #custom-wall {
              color: rgb(144,122,169);
         }
      #temperature {
              color: rgb(215,130,126);
            }
      #backlight {
              color: rgb(234,157,52);
            }
      #pulseaudio {
              color: rgb(87,82,121);
            }
      #network {
              color: rgb(144,122,169);
            }
      #network.disconnected {
              color: rgb(180,99,122);
            }
      #battery.charging {
              color: rgb(86,148,159);
            }
      #battery.full {
              color: rgb(144,122,169);
            }
      #battery.discharging {
              color: rgb(215,130,126);
            }
      #battery.critical:not(.charging) {
              color: rgb(180,99,122);
            }
      #custom-powermenu {
              color: rgb(87,82,121);
            }
      #tray {
              padding-right: 12px;
              padding-left: 12px;
            }
      #mpd.paused {
              color: rgb(152,147,165);
              font-style: italic;
            }
      #mpd.stopped {
              background: transparent;
            }
      #mpd {
              color: rgb(87,82,121);
            }
      #custom-cava-internal{
              color: rgb(215,130,126)
            }
    '';
    settings = [
      {
        "layer" = "top";
        "position" = "top";
        modules-left = [
          "custom/launcher"
          "wlr/workspaces"
          "temperature"
          "custom/wall"
          "mpd"
          "custom/cava-internal"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "pulseaudio"
          "backlight"
          "memory"
          "cpu"
          "network"
          "battery"
          "custom/powermenu"
        ];
        "custom/launcher" = {
          "format" = " ";
          "on-click" = "pkill rofi || ~/.config/rofi/launcher.sh";
          "tooltip" = false;
        };
        "custom/wall" = {
          "on-click" = "wallpaper_random";
          "on-click-middle" = "default_wall";
          "on-click-right" = "killall dynamic_wallpaper || dynamic_wallpaper &";
          "format" = " ﴔ ";
          "tooltip" = false;
        };
        "custom/cava-internal" = {
          "exec" = "sleep 1s && cava-internal";
          "tooltip" = false;
        };
        "wlr/workspaces" = {
          "format" = "{icon}";
          "on-click" = "activate";
          # "on-scroll-up" = "hyprctl dispatch workspace e+1";
          # "on-scroll-down" = "hyprctl dispatch workspace e-1";
        };
        "backlight" = {
          "device" = "intel_backlight";
          "on-scroll-up" = "light -A 5";
          "on-scroll-down" = "light -U 5";
          "format" = "{icon} {percent}%";
          "format-icons" = ["󰃞" "󰃝" "󰃟" "󰃠"];
        };
        "pulseaudio" = {
          "scroll-step" = 1;
          "format" = "{icon} {volume}%";
          "format-muted" = "󰝟 Muted";
          "format-icons" = {
            "default" = ["󰕿" "" "󰕾"];
          };
          "on-click" = "pamixer -t";
          "tooltip" = false;
        };
        "battery" = {
          "interval" = 10;
          "states" = {
            "warning" = 20;
            "critical" = 10;
          };
          "format" = "{icon} {capacity}%";
          "format-icons" = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂"];
          "format-full" = "󰁹";
          "format-charging" = "󰂄 {capacity}%";
          "tooltip" = false;
        };
        "clock" = {
          "interval" = 1;
          "format" = "{:%I:%M %p  %A %b %d}";
          "tooltip" = true;
          /*
          "tooltip-format"= "{=%A; %d %B %Y}\n<tt>{calendar}</tt>"
          */
          "tooltip-format" = "<tt>{calendar}</tt>";
        };
        "memory" = {
          "interval" = 1;
          "format" = "󰍛 {percentage}%";
          "states" = {
            "warning" = 85;
          };
        };
        "cpu" = {
          "interval" = 1;
          "format" = "󰻠 {usage}%";
        };
        "mpd" = {
          "max-length" = 25;
          "format" = "󰝚 {title}";
          "format-paused" = "<span foreground='#d7827e'>󰝛</span> {title}";
          "format-stopped" = "󰝛";
          "format-disconnected" = "<span foreground='#b4637a'></span>";
          "on-click" = "mpc --quiet toggle";
          "on-click-right" = "mpc update; mpc ls | mpc add";
          "on-click-middle" = "kitty --class='ncmpcpp' ncmpcpp ";
          "tooltip-format" = "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
        };
        "network" = {
          "interval" = 1;
          "format-wifi" = "󰖩 ";
          "format-ethernet" = "󰈀 ";
          "format-linked" = "󰚥 ";
          "format-disconnected" = "󰌙 ";
          "tooltip-format" = "{ifname}";
          "tooltip-format-wifi" = "{essid} ({signalStrength}%) 󰖩";
          "tooltip-format-ethernet" = "{ifname} 󰈀";
          "tooltip-format-disconnected" = "Disconnected";
          "max-length" = 50;
        };
        "temperature" = {
          "tooltip" = false;
          "format" = " {temperatureF}°F";
        };
        "custom/powermenu" = {
          "format" = "";
          "on-click" = "pkill rofi || ~/.config/rofi/powermenu.sh";
          "tooltip" = false;
        };
      }
    ];
  };
}
