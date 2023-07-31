{
  programs = {
    git = {
      enable = true;
      userName = "Austin Smith";
      userEmail = "personal@austintrentsmith.com";

      delta = {
        enable = true;
      };
    };
    gh.settings.git_protocol = "ssh";
  };
}
