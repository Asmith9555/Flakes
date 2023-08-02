let
  # set ssh public keys here for your system and user
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAWoc9vR/akCe4PNcwNiJ5+1hxVzPayvBg6lNvViLg2b root@thinkpad";
  user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDYtIdjauoovyEsz6DZMkfO5fK6EhOYHJKr4r7DXN87S wuger@thinkpad";
  allKeys = [system user];
in {
  "secret.age".publicKeys = allKeys;
}
