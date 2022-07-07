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

      # Bun PATH
      export PATH="$HOME/.bun/bin:$PATH"

      # Start up Starship shell
      eval "$(starship init zsh)"
    '';
  };
}
