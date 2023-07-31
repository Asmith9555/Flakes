{ config, ... }:
{
  home-manager.users."${config.vars.username}" = {
    services.sxhkd = {
      enable = true;
      keybindings = {
        #use ` xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }' ` will get the key name
        "super + Return" = "kitty fish";
        "super + shift + Return" = "kitty --class='termfloat' fish";
        "super + Escape" = "pkill -USER1 -x sxhkd";
        "super + shift + p" = "bspc node -c";
        "super + shift + {q,r}" = "bspc {quit,wm -r}";
        "super + shift + space" = "bspc node focused -t \~floating";
        "super + shift + g" = "bspc config window_gap 5";
        "super + g" = "bspc config window_gap 0";
        "super + k" = "bspc desktop -l next";
        "super + s" = "bspc node -s biggest.window";
        "super + y" = "bspc node newest.marked.local -n newest.!automatic.local";
        "super + ctrl + {m,x,y,z}" = "bspc node -g {marked,locked,sticky,private}";
        "super + ctrl + {p,b,comma,period}" = "bspc node -f @{parent,brother,first,second}";
        "super + shift + {comma,period}" = "bspc node -f {prev,next}.local.!hidden.window";
        "super + {comma,period}" = "bspc desktop -f {prev,next}.local";
        "super + {grave,Tab}" = "bspc {node,desktop} -f last";
        "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";
        "super + {_,shift + }{Left,Down,Up,Right}" = "bspc node -{f,s} {west,south,north,east}";
        "super + ctrl + {h,j,k,l}" = "bspc node -p {\~west,\~south,\~north,\~east}";
        "super + ctrl + {Left,Down,Up,Right}" = "bspc node -v {-20 0,0 20,0 -20,20 0}";
        "ctrl + shift + {Left,Down,Up,Right}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";
        "Contril_L + super + shift + {h,j,k,l}" = "bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}";
        "super + ctrl + {1-9}" = "bspc node -o 0.{1-9}";
        "super + f" = "bspc node -t \~fullscreen";
        "super + p" = "bspc node -t \~pseudo_tiled";
        "super + ctrl + t" = "bspc node -t \~tiled";
        "super + v" = "bspc node -g hidden";
        "super + shift + v" = "bspc node {,$(bspc query -N -n .hidden | tail -n1)} -g hidden=off";
        "XF86AudioRaiseVolume" = "pamixer -i 5";
        "XF86AudioLowerVolume" = "pamixer -d 5";
        "XF86AudioMute" = "pamixer -t";
        "XF86AudioMicMute" = "pamixer --default-source -t";
        "XF86MonBrightnessUp" = "light -A 5";
        "XF86MonBrightnessDown" = "light -U 5";
        "XF86AudioPlay" = "mpc -q toggle";
        "XF86AudioNext" = "mpc -q next";
        "XF86AudioPrev" = "mpc -q prev";
        "super + b" = "nvidia-offload firefox";
        "super + m" = "netease-cloud-music-gtk4";
        "super + shift + m" = "kitty --class='musicfox' 'musicfox'";
        "super + shift +d" = "kitty  --class='danmufloat' --hold sh -c 'cd /home/ruixi/Codelearning/go/src/bilibili_live_tui/  && export TERM=xterm-256color && go run main.go -c config.toml'";
        "super + t" = "telegram-desktop";
        "super + q" = "nvidia-offload icalingua-plus-plus";
        "super + a" = "flameshot_watermark";
        "super + d" = "pkill rofi || bash ~/.config/rofi/launcher.sh";
        "super + shift + d" = "bash ~/.config/rofi/powermenu.sh";
        "super + o" = "polybar-msg cmd toggle";
        "super + shift +x" = "i3lock-fancy -p";
        "super + w" = ''feh --randomize --bg-fill $(find ~/Pictures/wallpaper/. -name "*.png" | shuf -n1)'';
      };
    };
  };
}
