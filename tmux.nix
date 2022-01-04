# tmux settings

{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    escapeTime = 0;
    baseIndex = 1;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      dracula
    ];

    # Replaces ~/.tmux.conf
    extraConfig = ''
        set -g mouse on

        set-option -g default-terminal "screen-256color"

        set-option -sg escape-time 10
    '';
  };
}
