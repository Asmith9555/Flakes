{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraLibraries = (pkgs: [ pkgs.openssl pkgs.nghttp2 pkgs.libidn2 pkgs.rtmpdump pkgs.libpsl pkgs.curl pkgs.krb5 pkgs.keyutils ]);
    };
  };
}