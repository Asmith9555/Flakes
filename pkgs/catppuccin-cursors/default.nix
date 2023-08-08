{ lib, stdenv, fetchzip, ... }:
stdenv.mkDerivation rec {
  pname = "cattpuccin-cursors";
  version = "1";
  src = fetchzip {
    url ="https://github.com/catppuccin/cursors/releases/download/v0.2.0/Catppuccin-Frappe-Flamingo-Cursors.zip";
    sha256 = 
    "sha256-Lzf5RsITdxDfUBoSBDvZjY7elIslgaLHz07CnEllc3Y=";
  };
  installPhase = ''
    mkdir -p $out/share/icons/Catppuccin-Frappe-Flamingo
    cp -va index.theme cursors $out/share/icons/Catppuccin-Frappe-Flamingo
  '';
  meta = {
    description = "Soothing pastel mouse cursors";
  };
}
