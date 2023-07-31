{ pkgs, ... }:
{
  environment.defaultPacakges = with pkgs; [
    bind
  ];
}