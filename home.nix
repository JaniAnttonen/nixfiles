{ config, pkgs, ... }:

let
  imports = [
    ./tmux.nix
    ./shell.nix
    ./neovim.nix
    #./vscode.nix
  ];

in {
  inherit imports;
  
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jani";
  home.homeDirectory = "/Users/jani";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Golang
  programs.go.enable = true;

  # Starship
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  # Packages
  home.packages = with pkgs; [
    awscli
    bat
    cachix
    curl
    docker
    docker-compose
    docker-machine
    elixir
    erlang
    fzf
    graphviz
    gnupg
    nodejs
    pinentry_mac
    podman
    protobuf
    fish
    rustup
    vscode
    wasmer
    wget
    yarn
    zola
    python3
    tmux
    tectonic
  ];

  # Git config
  programs.git = {
    enable = true;
    userName = "JaniAnttonen";
    userEmail = "jani.anttonen@protonmail.ch";
  };
}
