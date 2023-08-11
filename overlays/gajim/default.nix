self: super:
{
  gajim = pkgs.gajim.override { enableOmemoPluginDependencies = true; };
}
