{ lib, stdenv, fetchGitHub, ... }:

stdenv.mkDerivation rec {
  pname = "berkeley-mono-font";
  version = "1.0.0";
  
   src = fetchFromGitHub {
      owner = "Asmith9555";
      repo = "berkeley-mono-font";
      rev = "9d214f4ecdac02bb5c4ac5925a474622d93e89cf";
      sha256 = "03c4b734d8be254fe81b1834eee799f75a93c51e75e837b3a2fb3338144968d2";
   };

  installPhase = ''
    mkdir -p $out/share/fonts/truetype/BerkeleyMono/
    mv $src/TTF/* $out/share/fonts/truetype/BerkeleyMono/
  '';

  meta = {
      description = "Berkeley Mono Font Package";
  };
}
