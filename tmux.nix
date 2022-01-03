# tmux settings

{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    escapeTime = 0;
    baseIndex = 1;

    # Replaces ~/.tmux.conf
    extraConfig = ''
        set -g mouse on

        set-option -g default-terminal "screen-256color"

        set-option -sg escape-time 10

        # List of plugins
        set -g @plugin 'tmux-plugins/tpm'
        set -g @plugin 'tmux-plugins/tmux-sensible'
        set -g @plugin 'dracula/tmux'
        # set -g @plugin 'jimeh/tmux-themepack'
        # set -g @themepack 'powerline/double/magenta'
        # source-file "~/.tmux-themepack/powerline/double/orange.tmuxtheme"

        # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
        run -b '~/.tmux/plugins/tpm/tpm'
    '';
  };
}