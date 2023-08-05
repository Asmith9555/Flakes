{
  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      # auto_sync = true;
      # sync_frequency = "5m";
      # sync_address = "https://api.atuin.sh";
      search_mode = "prefix";
      dialect = "us";
      update_check = false;
      exit_mode = "return-query";
      style = "compact";
      show_preview = true;
    };
  };
}
