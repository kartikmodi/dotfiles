{
  pkgs,
  username,
  nixgl,
  nixglPkgs,
  lib,
  ...
}:
let
  homeDir = "/home/${username}";
  venvsDir = "${homeDir}/.venvs";
  globalEnvPath = "${venvsDir}/global";
  uvBin = "${pkgs.uv}/bin/uv";
  npmBin = "${pkgs.nodejs}/bin/npm";
in

{
  home.username = username;
  home.homeDirectory = homeDir;

  home.packages = with pkgs; [
    # #graphics
    # libva
    # libvdpau
    # vaapiVdpau
    # libva-utils
    # # libva-nvidia-driver
    # vulkan-loader
    # vulkan-tools
    # vulkan-headers
    # nvidia-vaapi-driver
    # mesa
    # intel-media-driver
    # libdrm
    # vaapiIntel
    # libGL
    # libsForQt5.kde-gtk-config
    # libsForQt5.breeze-gtk

    #hardware
    solaar
    htop
    # cudatoolkit

    # nix
    nixfmt-rfc-style
    # nixglPkgs.nixGLIntel
    # nixglPkgs.nixVulkanIntel
    nil

    # dev
    gh
    github-desktop
    github-copilot-cli

    drawio
    postgresql
    # mongodb
    nodejs
    clickhouse
    clickhouse-cli
    # duckdb # does not work very well, install the offical way
    #nodePackages.npm
    #nodePackages.dotenv-cli

    # pandoc
    # texlive
    bash-language-server # mads-hartmann.bash-ide-vscode dep
    shfmt # foxundermoon.shell-format and mads-hartmann.bash-ide-vscode dep
    shellcheck # mads-hartmann.bash-ide-vscode dep
    # ansible-lint
    direnv
    # dotenv-cli
    # nix-direnv
    alacritty
    kitty
    zellij
    wezterm
    gnupg
    gpgme
    awscli2
    aws-vault
    parquet-tools
    arrow-cpp

    # AI
    # n8n
    # lmstudio
    # ollama-cuda
    # open-webui
    # librechat

    # warp-terminal
    # chatbox # desktop app, android also available
    # private-gpt
    # streamlit
    # gradio
    # langchain
    # text-generation-webui

    # Version and environment managers
    # asdf-vm
    uv
    # mise

    # cloud storage
    # pcloud # not available for aarch64
    # dropbox
    #cozy-drive
    #rclone
    #rclone-ui
    # megasync

    # communication
    # zoom-us # not available for aarch64
    # slack # not available for aarch64-linux

    # security
    bitwarden-desktop
    _1password-cli
    _1password-gui

    # browsers
    #google-chrome
    #firefox-bin
    #brave

    # multimedia
    gimp3-with-plugins
    # openshot-qt
    vlc
    # stremio # requires qtwebengine (long build on aarch64)

    # obs-plugins
    obs-studio
    inkscape-with-extensions
    #kdePackages.kdenlive
    krita

    # vpn
    #protonvpn-gui
    #tailscale

    # terminal
    byobu # tmux
    hollywood

    # notes
    joplin-desktop

    # productivity
    # qalculate-qt #may require qtwebengine
    # pdfsam-basic # not available for aarch64
    flameshot

    # gaming
    goverlay
    mangohud
    mangojuice

    # p2p
    #biglybt
    #tribler
    #frostwire-bin

    # network
    wget2
    whois
    wireshark
    curlFull

    # files
    tree
    rsync
    unison
    aria2
    uget
    uget-integrator
    yt-dlp
    ytdl-sub
    google-drive-ocamlfuse

    # remote desktop
    #remmina
    # rustdesk-flutter
    # rustdesk
    # rustdesk-server

    # android
    # android-tools
    # androidenv.androidPkgs.platform-tools
    # scrcpy
    # qtscrcpy

    # xapp, libindicator, libindicator-gtk3
    # ananicy-cpp
    # bfg-repo-cleaner

    # cloud flare tunnel

  ];
  home.stateVersion = "25.11";

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      timonwong.shellcheck
      foxundermoon.shell-format
      mads-hartmann.bash-ide-vscode
      ms-python.python
      ms-python.vscode-pylance
      redhat.ansible
      redhat.vscode-yaml
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-ssh-edit
      # saoudrizwan.claude-dev # cline

    ];
    # roo code
    # ext install rxliuli.joplin-vscode-plugin
    # ext install dvirtz.parquet-viewer
    # direnv plugin

    profiles.default.userSettings = {
      "yaml.format.enable" = true;
      "yaml.validate" = true;
      "editor.defaultFormatter" = "redhat.vscode-yaml";
      "editor.formatOnSave" = true;
      "editor.formatOnSaveMode" = "file";
      "bashIde.explainshellEndpoint" = "https://explainshell.com/"; # host explainshell if things are slower and useful
      "python.languageServer" = "Pylance";
      "editor.largeFileOptimizations" = false;
      "files.autoSave" = "afterDelay";
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil"; # or test with nixd
      "nix.serverSettings" = {
        "nil" = {
          "formatting" = {
            "command" = [ "nixfmt" ];
          };
        };
      };
      "nixd" = {
        "formatting" = {
          "command" = [ "nixfmt" ];
        };

      };

      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
      };
      "[shellscript]" = {
        "editor.defaultFormatter" = "mads-hartmann.bash-ide-vscode";
      };
      "[ignore]" = {
        "editor.defaultFormatter" = "foxundermoon.shell-format";
      };
      "workbench.colorTheme" = "Default Light+";
      "roo-cline.allowedCommands" = [
        "npm test"
        "npm install"
        "tsc"
        "git log"
        "git diff"
        "git show"
      ];

    };
    # settings = { "editor.tabSize" = 2; };
  };

  programs.vim = {
    enable = true;

    extraConfig = ''
      set number
      set relativenumber
      set mouse=a
      syntax enable
      set showmatch
      set cursorline
      set wildmenu
      set backspace=indent,eol,start
      set showcmd
      set undofile
      set clipboard=unnamedplus
      set expandtab
      set shiftwidth=4
      set softtabstop=4
      set smartindent
      set list
      set listchars=tab:▸\ ,trail:·
      set backupdir=/tmp
      set directory=/tmp
      set ttyfast
      set nowrap
      set termguicolors
      set ttymouse=sgr
    '';

    # plugins = with pkgs.vimPlugins; [
    #   vim-plug
    # ];
  };
  # home.file.".npmrc".text = "prefix = ${homeDir}/.npm-global";
  # home.file.".profile" = {
  #   enable = true;
  #   text = ''
  #      # ~/.profile: executed by the command interpreter for login shells.
  #      # This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
  #      # exists.
  #      # see /usr/share/doc/bash/examples/startup-files for examples.
  #      # the files are located in the bash-doc package.

  #      # the default umask is set in /etc/profile; for setting the umask
  #      # for ssh logins, install and configure the libpam-umask package.
  #      #umask 022

  #      # if running bash
  #      if [ -n "$BASH_VERSION" ]; then
  #          # include .bashrc if it exists
  #          if [ -f "$HOME/.bashrc" ]; then
  #              . "$HOME/.bashrc"
  #          fi
  #      fi

  #      # set PATH so it includes user's private bin if it exists
  #      if [ -d "$HOME/bin" ] ; then
  #          PATH="$HOME/bin:$PATH"
  #      fi

  #      # set PATH so it includes user's private bin if it exists
  #      if [ -d "$HOME/.local/bin" ] ; then
  #          PATH="$HOME/.local/bin:$PATH"
  #      fi

  #      # set PATH for nix profile binaries
  #      if [ -d "$HOME/.nix-profile/bin" ] ; then
  #        PATH="$HOME/.nix-profile/bin:$PATH"
  #      fi

  #      # set PATH for global uv binaries
  #      if [ -d "${globalEnvPath}/bin" ] ; then
  #        PATH="${globalEnvPath}/bin:$PATH"
  #      fi

  #      # Add /custom/share to XDG_DATA_DIRS
  #     # if [ -d "$HOME/.nix-profile/share" ] ; then
  #      #  export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.nix-profile/share"
  #      #fi

  #      # set PATH for npm global binaries
  #      if [ -d "$HOME/.npm-global/bin" ] ; then
  #        PATH="$HOME/.npm-global/bin:$PATH"
  #      fi

  #   '';
  # };

  # home.activation.flatpakSetup = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #   DISPLAY=:0 /usr/bin/flatpak --verbose remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo || true
  # '';

  # home.activation.flatpakApps = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #     apps=(
  #     # AI
  #     # io.github.qwersyk.Newelle
  #     # com.jeffser.Alpaca
  #     # io.gitlab.theevilskeleton.Upscaler
  #     # io.gpt4all.gpt4all
  #     # com.cherry_ai.CherryStudio

  #     # Productivity
  #     io.github.Qalculate.qalculate-qt

  #     # Files
  #     io.kapsa.drive
  #     com.hunterwittenborn.Celeste

  #     # Communication
  #     com.github.IsmaelMartinez.teams_for_linux

  #     # rustdesk

  #   )
  #   for app in "''${apps[@]}"; do
  #     /usr/bin/flatpak install --user -y flathub "$app"
  #   done
  # '';

  home.activation.setupUvEnvs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -d "${globalEnvPath}" ]; then
      mkdir -p ${globalEnvPath}
      ${uvBin} venv ${globalEnvPath}
    fi

    whls=(
      # AI
      # huggingface_hub[cli]
      # nvitop
      gpustat

      # DB
      # duckdb
    )
    for whl in "''${whls[@]}"; do
      ${uvBin} pip install -p ${globalEnvPath} -U "$whl"
    done
  '';

  # home.activation.joplinPlugins = lib.hm.dag.entryAfter [ "writeBoundary" ] (
  #   let
  #     pluginDir = "${homeDir}/.config/joplin-desktop/plugins";

  #     jplPlugins = {
  #       "joplin.plugin.alondmnt.jarvis" =
  #         "https://github.com/joplin/plugins/raw/master/plugins/joplin.plugin.alondmnt.jarvis/plugin.jpl";

  #       "home.sword.NoteLLM" =
  #         "https://github.com/joplin/plugins/raw/master/plugins/home.sword.NoteLLM/plugin.jpl";

  #       "joplin.plugin.note.tabs" =
  #         "https://github.com/joplin/plugins/raw/master/plugins/joplin.plugin.note.tabs/plugin.jpl";

  #       "org.otherware.joplin-publish" =
  #         "https://github.com/joplin/plugins/raw/master/plugins/org.otherware.joplin-publish/plugin.jpl";

  #       "plugin.calebjohn.rich-markdown" =
  #         "https://github.com/joplin/plugins/raw/master/plugins/plugin.calebjohn.rich-markdown/plugin.jpl";
  #     };
  #   in
  #   ''
  #     echo "📦 Installing Joplin plugins (.jpl files)..."

  #     mkdir -p ${pluginDir}

  #     ${lib.concatStringsSep "\n" (
  #       lib.mapAttrsToList (filename: url: ''
  #         echo "→ Downloading ${filename}..."
  #         ${pkgs.curlFull}/bin/curl -fsSL "${url}" -o ${pluginDir}/${filename}.jpl
  #       '') jplPlugins
  #     )}
  #   ''
  # );

  # home.activation.installNpmPackages = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #   echo "📦 Installing Global NPM Packages..."
  #   if [ ! -d ${homeDir}/.npm-global ]; then
  #     mkdir -p ${homeDir}/.npm-global
  #   fi
  #   export PATH="${pkgs.nodejs}/bin:$PATH"
  #   ${npmBin} install -g --prefix ${homeDir}/.npm-global @google/gemini-cli
  # '';

}
