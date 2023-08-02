final: prev: with prev; {
  swww = final.callPackage ./swww.nix {};
  berkeley-mono-font = final.callPackage ./berkeley-mono-font.nix {};
}
