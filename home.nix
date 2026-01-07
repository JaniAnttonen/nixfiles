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

  # texlive
  programs.texlive.enable = true;

  # Starship
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  # Wezterm


  # Packages
  home.packages = with pkgs; [
    alacritty
    act
    #awscli
    awscli2
    bat
    bun
    cachix
    curl
    direnv
    docker
    docker-compose
    elixir
    erlang
    fzf
    graphviz
    gnupg
    libiconv
    leiningen
    lcov
    nodejs
    nodePackages.pnpm
    nodePackages.node-gyp
    openssl
    perl
    pinentry_mac
    pkg-config
    podman
    protobuf
    fish
    rustup
    #vscode-with-extensions
    #vscode-utils
    wezterm
    wget
    yarn
    zola
    python3
    tmux
    tectonic
    solc
    restic
  ];
  
  # Git config
  programs.git = {
    enable = true;
    userName = "JaniAnttonen";
    userEmail = "jani.anttonen@protonmail.ch";
  };

  # Fix fcitx5 compatibility issue with recent nixpkgs
  i18n.inputMethod = {
    enabled = null;
    fcitx5.fcitx5-with-addons = pkgs.kdePackages.fcitx5-with-addons or pkgs.emptyDirectory;
  };
}
