let
  common = import ../common;
in
[
  ./imgview
  ./launcher
  ./notice
  ./mpv
  ./kooha
  ./swww
] ++ common
