# tmux settings

{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    escapeTime = 0;
    baseIndex = 1;

    plugins = with pkgs.tmuxPlugins; [
      sensible
    ];

    # Replaces ~/.tmux.conf
    extraConfig = ''
        set -g mouse on

        set-option -g default-terminal "screen-256color"

        set-option -sg escape-time 10

        # --> Catppuccin
        thm_bg="#1e1e28"
        thm_fg="#dadae8"
        thm_cyan="#c2e7f0"
        thm_black="#15121c"
        thm_gray="#332e41"
        thm_magenta="#c6aae8"
        thm_pink="#e5b4e2"
        thm_red="#e38c8f"
        thm_green="#b1e3ad"
        thm_yellow="#ebddaa"
        thm_blue="#a4b9ef"
        thm_orange="#f9c096"
        thm_black4="#575268"

        # ----------------------------=== Theme ===--------------------------

        # status
        set -g status-position top
        set -g status "on"
        set -g status-bg "#1e1e28"
        set -g status-justify "left"
        set -g status-left-length "100"
        set -g status-right-length "100"

        # messages
        set -g message-style fg="#c2e7f0",bg="#332e41",align="centre"
        set -g message-command-style fg="#c2e7f0",bg="#332e41",align="centre"

        # panes
        set -g pane-border-style fg="#332e41"
        set -g pane-active-border-style fg="#a4b9ef"

        # windows
        setw -g window-status-activity-style fg="#dadae8",bg="#1e1e28",none
        setw -g window-status-separator ""
        setw -g window-status-style fg="#dadae8",bg="#1e1e28",none

        # --------=== Statusline

        set -g status-left ""
        set -g status-right "#[fg=#e5b4e2,bg=#1e1e28,nobold,nounderscore,noitalics]#[fg=#1e1e28,bg=#e5b4e2,nobold,nounderscore,noitalics] #[fg=#dadae8,bg=#332e41] #W #{?client_prefix,#[fg=#e38c8f],#[fg=#b1e3ad]}#[bg=#332e41]#{?client_prefix,#[bg=#e38c8f],#[bg=#b1e3ad]}#[fg=#1e1e28] #[fg=#dadae8,bg=#332e41] #S "

        # current_dir
        setw -g window-status-format "#[fg=#1e1e28,bg=#a4b9ef] #I #[fg=#dadae8,bg=#332e41] #{b:pane_current_path} "
        setw -g window-status-current-format "#[fg=#1e1e28,bg=#f9c096] #I #[fg=#dadae8,bg=#1e1e28] #{b:pane_current_path} "

        # parent_dir/current_dir
        # setw -g window-status-format "#[fg=colour232,bg=colour111] #I #[fg=colour222,bg=colour235] #(echo '#{pane_current_path}' | rev | cut -d'/' -f-2 | rev) "
        # setw -g window-status-current-format "#[fg=colour232,bg=colour208] #I #[fg=colour255,bg=colour237] #(echo '#{pane_current_path}' | rev | cut -d'/' -f-2 | rev) "

        # --------=== Modes
        setw -g clock-mode-colour "#a4b9ef"
        setw -g mode-style "fg=#e5b4e2 bg=#15121c bold"
    '';
  };
}
