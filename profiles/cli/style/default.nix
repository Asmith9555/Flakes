{ pkgs, ... }:
{
  environment.defaultPacakges = with pkgs; [
    exa
  ];
}