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
in

{
  home.username = username;
  home.homeDirectory = homeDir;

  home.packages = with pkgs; [
    # nix
    nixfmt-rfc-style
    nixglPkgs.nixGLIntel
    nixglPkgs.nixVulkanIntel
    nil

    # dev
    drawio
    postgresql
    # pandoc
    # texlive
    bash-language-server # mads-hartmann.bash-ide-vscode dep
    shfmt # foxundermoon.shell-format and mads-hartmann.bash-ide-vscode dep
    shellcheck # mads-hartmann.bash-ide-vscode dep
    ansible-lint

    # AI
    n8n
    lmstudio
    ollama-cuda
    open-webui
    librechat
    warp-terminal
    chatbox
    private-gpt
    streamlit
    # gradio
    # langchain
    # text-generation-webui

    # Version and environment managers
    asdf-vm
    uv
    mise

    # cloud storage
    pcloud
    dropbox
    cozy-drive
    rclone
    rclone-ui
    # megasync

    # communication
    zoom-us
    slack

    # security
    bitwarden-desktop
    _1password-gui

    # browsers
    google-chrome
    firefox-bin
    brave

    # multimedia
    gimp3-with-plugins
    openshot-qt
    vlc
    stremio

    # obs-plugins
    obs-studio
    inkscape-with-extensions
    kdePackages.kdenlive
    krita

    # vpn
    protonvpn-gui
    tailscale

    # terminal
    # byobu # tmux
    hollywood

    # notes
    joplin-desktop

    # productivity
    qalculate-qt
    pdfsam-basic
    flameshot

    # gaming
    goverlay
    mangohud
    mangojuice

    # p2p
    biglybt
    tribler
    frostwire-bin

    # network
    wget2
    whois
    wireshark
    curlFull

    #hardware
    solaar

    # files
    tree
    rsync
    unison
    aria2
    uget
    uget-integrator
    yt-dlp
    ytdl-sub

    # remote desktop
    remmina
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
  home.stateVersion = "25.05";

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
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
      saoudrizwan.claude-dev
      # roo code
      # ext install rxliuli.joplin-vscode-plugin
    ];
    userSettings = {
      "yaml.format.enable" = true;
      "yaml.validate" = true;
      "editor.defaultFormatter" = "redhat.vscode-yaml";
      "editor.formatOnSave" = true;
      "bashIde.explainshellEndpoint" = "https://explainshell.com/"; # host explainshell if things are slower and useful
      "files.autoSave" = "afterDelay";
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";

      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
      };
      "[shellscript]" = {
        "editor.defaultFormatter" = "mads-hartmann.bash-ide-vscode";
      };
      "[ignore]" = {
        "editor.defaultFormatter" = "foxundermoon.shell-format";
      };
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
  home.file.".profile" = {
    enable = true;
    text = ''
      # ~/.profile: executed by the command interpreter for login shells.
      # This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
      # exists.
      # see /usr/share/doc/bash/examples/startup-files for examples.
      # the files are located in the bash-doc package.

      # the default umask is set in /etc/profile; for setting the umask
      # for ssh logins, install and configure the libpam-umask package.
      #umask 022

      # if running bash
      if [ -n "$BASH_VERSION" ]; then
          # include .bashrc if it exists
          if [ -f "$HOME/.bashrc" ]; then
              . "$HOME/.bashrc"
          fi
      fi

      # set PATH so it includes user's private bin if it exists
      if [ -d "$HOME/bin" ] ; then
          PATH="$HOME/bin:$PATH"
      fi

      # set PATH so it includes user's private bin if it exists
      if [ -d "$HOME/.local/bin" ] ; then
          PATH="$HOME/.local/bin:$PATH"
      fi

      # set PATH for nix profile binaries
      if [ -d "$HOME/.nix-profile/bin" ] ; then
        PATH="$HOME/.nix-profile/bin:$PATH"
      fi

      # set PATH for global uv binaries
      if [ -d "${globalEnvPath}/bin" ] ; then
        PATH="${globalEnvPath}/bin:$PATH"
      fi

      # Add /custom/share to XDG_DATA_DIRS
      if [ -d "$HOME/.nix-profile/share" ] ; then
        export XDG_DATA_DIRS="$HOME/.nix-profile/share:$XDG_DATA_DIRS"
      fi
    '';
  };

  home.activation.flatpakSetup = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  '';

  home.activation.flatpakApps = lib.hm.dag.entryAfter [ "flatpakSetup" ] ''
      apps=(
      # AI
      io.github.qwersyk.Newelle
      com.jeffser.Alpaca
      io.gitlab.theevilskeleton.Upscaler
      io.gpt4all.gpt4all
      com.cherry_ai.CherryStudio

      # Productivity
      io.github.Qalculate.qalculate-qt

      # Files
      io.kapsa.drive
    )
    for app in "''${apps[@]}"; do
      flatpak install --user -y flathub "$app"
    done
  '';

  home.activation.createUvEnvs = lib.hm.dag.entryAfter [ "flatpakSetup" ] ''
    if [ ! -f "${globalEnvPath}" ]; then
      mkdir -p ${globalEnvPath}
      /home/workstation/.nix-profile/bin/uv venv ${globalEnvPath}
      
    fi

  '';

  home.activation.updateUvEnvs = lib.hm.dag.entryAfter [ "createUvEnvs" ] ''
    whls=(
      # AI
      huggingface_hub[cli]
      nvitop
      gpustat
    )
    for whl in "''${whls[@]}"; do
      /home/workstation/.nix-profile/bin/uv pip install -p ${globalEnvPath} -U "$whl"
    done
  '';

}
