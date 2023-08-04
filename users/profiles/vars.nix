{ self, ... }:

{
  vars = rec {
    color = "groove";
    colorPath = "${self}/users/colors/${color}.nix";
  };
} 