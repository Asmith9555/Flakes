{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      mpc-cli
    ];
  };
  programs = {
    ncmpcpp = {
      enable = true;
    };
  };
  services = {
    mpd = {
      enable = true;
      musicDirectory = "~/Music";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "PipeWire Sound Server"
        }
      '';
    };
  };
  imports = [
    ./spicetify
    ./cava
  ];
}
