{ self, inputs, ... }:
{
  modules = with inputs; [];
  exportedModules = [
    ./dev.nix
  ];
}