{ config, lib, pkgs, ... }:

{
  programs.fish = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    history.extended = true;

    initExtra = ''
      export TERM="xterm-256color"
      bindkey -e

      # OpenSSL for Rust builds
      export PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig"

      # Foundry to PATH
      export PATH=$PWD/.foundry/bin:$PATH

      # NVM
      mkdir ~/.nvm
      export NVM_DIR="$HOME/.nvm"
      [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
      [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

      # Helios to PATH
      export PATH=$PWD/.helios/bin:$PATH

      # Cargo bins to path
      export PATH="$HOME/.cargo/bin:$PATH"

      # Go bin to path
      export PATH="$HOME/go/bin:$PATH"

      # Python 3.9 bin path
      export PATH="$HOME/Library/Python/3.9/bin:$PATH"

      # Scarb path
      export PATH="$HOME/.local/bin:$PATH"

      # Cairo install from source
      export PATH="$HOME/dev/eq/starknet/cairo/target/release:$PATH"

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

      # Hook Direnv to shell
      eval "$(direnv hook zsh)"

      # Start up Starship shell
      eval "$(starship init zsh)"
    '';
  };
}
