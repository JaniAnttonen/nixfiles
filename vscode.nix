{ config, lib, pkgs, vscode-utils, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.Nix
    ]
    ++ vscode-utils.extensionsFromVscodeMarketplace [
      bungcip.better-toml
      chenxsan.vscode-standardjs
      christian-kohler.npm-intellisense
      christian-kohler.path-intellisense
      dbaeumer.vscode-eslint
      dracula-theme.theme-dracula
      EditorConfig.EditorConfig
      esbenp.prettier-vscode
      firefox-devtools.vscode-firefox-debug
      flowtype.flow-for-vscode
      formulahendry.auto-close-tag
      gaearon.subliminal
      GitHub.github-vscode-theme
      GitHub.vscode-pull-request-github
      gleam-syntax.gleam-syntax
      golang.go
      GraphQL.vscode-graphql
      hbenl.vscode-mocha-test-adapter
      hbenl.vscode-test-explorer
      JakeBecker.elixir-ls
      James-Yu.latex-workshop
      JamesBirtles.svelte-vscode
      jock.svg
      joelday.docthis
      joshpeng.sublime-babel-vscode
      JuanBlanco.solidity
      maximedenes.vscoq
      mjmcloug.vscode-elixir
      mkxml.vscode-filesize
      monokai.theme-monokai-pro-vscode
      mrmlnc.vscode-scss
      ms-azuretools.vscode-docker
      ms-dotnettools.csharp
      ms-python.python
      ms-python.vscode-pylance
      ms-toolsai.jupyter
      ms-toolsai.jupyter-keymap
      ms-toolsai.jupyter-renderers
      ms-vscode-remote.remote-containers
      ms-vscode.azure-account
      ms-vscode.cpptools
      ms-vscode.test-adapter-converter
      ms-vsliveshare.vsliveshare
      mscgenjs.vscode-mscgen
      msjsdiag.debugger-for-chrome
      MythX.mythxvsc
      naumovs.color-highlight
      patrys.vscode-code-outline
      PKief.material-icon-theme
      QassimFarid.ejs-language-support
      robinbentley.sass-indented
      rust-lang.rust
      rvest.vs-code-prettier-eslint
      sdras.night-owl
      silvenon.mdx
      teabyii.ayu
      vincaslt.highlight-matching-tag
      vscode-icons-team.vscode-icons
      vscodevim.vim
      waderyan.gitblame
      zxh404.vscode-proto3
    ];
    userSettings = {
      "editor.fontFamily" = "hack";
      "editor.fontSize" = 13;
      "editor.tabSize" = 2;
      "editor.cursorStyle" = "block";
      "editor.cursorBlinking" = "solid";
      "editor.renderWhitespace" = "all";
      "editor.renderControlCharacters" = true;
      "editor.renderIndentGuides" = true;
      "editor.wordWrap" = "on";
      "window.menuBarVisibility" = "compact";
      "typescript.check.npmIsInstalled" = false;
      "git.confirmSync" = false;
      "git.enableSmartCommit" = true;
      "auto-close-tag.SublimeText3Mode" = true;
      "files.insertFinalNewline" = true;
      "material-icon-theme.showUpdateMessage" = false;
      "workbench.colorTheme" = "GitHub Dark Default";
      "workbench.iconTheme" = "vscode-icons";
      "python.disablePromptForFeatures" = [
        "pylint"
      ];
      "solidity.packageDefaultDependenciesContractsDirectory" = "";
      "solidity.packageDefaultDependenciesDirectory" = "node_modules";
      "git.autofetch" = true;
      "window.restoreWindows" = "none";
      "explorer.confirmDragAndDrop" = false;
      "javascript.updateImportsOnFileMove.enabled" = "always";
      "flow.useNPMPackagedFlow" = true;
      "window.titleBarStyle" = "custom";
      "search.exclude" = {
        "**/node_modules" = false;
      };
      "latex-workshop.view.pdf.viewer" = "browser";
      "vsicons.dontShowNewVersionMessage" = true;
      "go.useLanguageServer" = true;
      "latex-workshop.message.update.show" = false;
      "javascript.format.enable" = false;
      "javascript.validate.enable" = false;
      "standard.enable" = false;
      "standard.autoFixOnSave" = false;
      "standard.validate" = [
        "javascript"
        "javascriptreact"
      ];
      "terminal.integrated.shell.linux" = "/usr/bin/fish";
      "editor.formatOnSave" = true;
      "editor.codeActionsOnSave" = {
        "source.organizeImports" = true;
      };
      "prettier.requireConfig" = true;
      "typescript.updateImportsOnFileMove.enabled" = "always";
      "tabnine.experimentalAutoImports" = true;
      "[typescriptreact" = {
        "editor.defaultFormatter" = "rvest.vs-code-prettier-eslint";
      };
      "[typescript" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "json.maxItemsComputed" = 50000;
      "[json" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
    };
  };
}
