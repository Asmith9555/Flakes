{ config, ... }:
{
  home-manager.users."$config.vars.username}". programs.skim = {
    enable = true;
    defaultCommand = "fd --type f --hidden --exclude '.git'";
    defaultOptions = [ "--height 40%" "--inline-info" ];
    changeDirWidgetCommand = "fd --type d --hidden --exclude '.git'";
    fileWidgetCommand = defaultCommand;
    fileWidgetOptions = [ "--preview 'bat --color always {} 2> /dev/null | head -200; highlight -O ansi -l {} ^ /dev/null | head -200 || cat {} ^ /dev/null | head -200'" ];
    historyWidgetOptions = [ "--tac" ];
  };
}