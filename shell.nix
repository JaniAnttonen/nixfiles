{ config, lib, pkgs, ... }:

{
  programs.fish = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    history.extended = true;

    initExtra = ''
      export TERM="xterm-256color"
      bindkey -e

      # OpenSSL for Rust builds
      export PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig"

      # Foundry to PATH
      export PATH=$PWD/.foundry/bin:$PATH

      # Helios to PATH
      export PATH=$PWD/.helios/bin:$PATH

      # Cargo bins to path
      export PATH="$HOME/.cargo/bin:$PATH"

      # pip installs to PATH
      export PATH=$PWD/Library/Python/3.8/bin/:$PATH

      # Script ensuring nix installation
      if nix --version ; then
          echo "Nix installation found"
      else
          sudo rm /etc/bashrc.backup-before-nix
          sudo rm /etc/bash.bashrc.backup-before-nix
          sudo rm /etc/zshrc.backup-before-nix
          yes | sh <(curl -L https://nixos.org/nix/install)
      fi

      # Start up Starship shell
      eval "$(starship init zsh)"
    '';
  };
}
