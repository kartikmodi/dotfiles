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
    # cudatoolkit

    # nix
    nixfmt-rfc-style
    # nixglPkgs.nixGLIntel
    # nixglPkgs.nixVulkanIntel
    nil

    # dev
    drawio
    postgresql
    mongodb
    nodejs
    duckdb
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
    awscli2

    # AI
    n8n
    lmstudio
    # ollama-cuda
    open-webui
    librechat

    warp-terminal
    chatbox # desktop app, android also available
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
    # dropbox
    #cozy-drive
    #rclone
    #rclone-ui
    # megasync

    # communication
    zoom-us
    slack

    # security
    bitwarden-desktop
    # _1password
    # _1password-gui

    # browsers
    #google-chrome
    #firefox-bin
    #brave

    # multimedia
    gimp3-with-plugins
    openshot-qt
    vlc
    stremio

    # obs-plugins
    obs-studio
    inkscape-with-extensions
    #kdePackages.kdenlive
    krita

    # vpn
    #protonvpn-gui
    #tailscale

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
  home.stateVersion = "25.05";
  #  home.sessionVariables = {
  #   LIBVA_DRIVER_NAME = "i965";
  # VDPAU_DRIVER = "va_gl";
  #  __GLX_VENDOR_LIBRARY_NAME = "mesa";
  # GBM_DRIVERS_PATH = "/usr/lib/x86_64-linux-gnu/dri";
  # LIBVA_DRIVERS_PATH = "/usr/lib/x86_64-linux-gnu/dri";
  # LD_LIBRARY_PATH = "/usr/lib/x86_64-linux-gnu:/lib/x86_64-linux-gnu";
  # GTK_PATH = "${pkgs.libsForQt5.kde-gtk-config}/lib/gtk-3.0";
  # GTK_MODULES = "colorreload-gtk-module:window-decorations-gtk-module";

  #};
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
      # direnv plugin
    ];
    userSettings = {
      "yaml.format.enable" = true;
      "yaml.validate" = true;
      "editor.defaultFormatter" = "redhat.vscode-yaml";
      "editor.formatOnSave" = true;
      "bashIde.explainshellEndpoint" = "https://explainshell.com/"; # host explainshell if things are slower and useful
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
      # if [ -d "$HOME/.nix-profile/share" ] ; then
       #  export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.nix-profile/share"
       #fi
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
      com.hunterwittenborn.Celeste

      # Browsers
      org.mozilla.firefox
      com.google.Chrome
    )
    for app in "''${apps[@]}"; do
      flatpak install --user -y flathub "$app"
    done
  '';

  home.activation.createUvEnvs = lib.hm.dag.entryAfter [ "flatpakSetup" ] ''
    if [ ! -f "${globalEnvPath}" ]; then
      mkdir -p ${globalEnvPath}
      ${uvBin} venv ${globalEnvPath}
      
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
      ${uvBin} pip install -p ${globalEnvPath} -U "$whl"
    done
  '';

  home.activation.joplinPlugins = lib.hm.dag.entryAfter [ "writeBoundary" ] (
    let
      pluginDir = "~/.config/joplin-desktop/plugins";

      jplPlugins = {
        "joplin.plugin.alondmnt.jarvis" =
          "https://github.com/joplin/plugins/raw/master/plugins/joplin.plugin.alondmnt.jarvis/plugin.jpl";

        "home.sword.NoteLLM" =
          "https://github.com/joplin/plugins/raw/master/plugins/home.sword.NoteLLM/plugin.jpl";

        "joplin.plugin.note.tabs" =
          "https://github.com/joplin/plugins/raw/master/plugins/joplin.plugin.note.tabs/plugin.jpl";

        "org.otherware.joplin-publish" =
          "https://github.com/joplin/plugins/raw/master/plugins/org.otherware.joplin-publish/plugin.jpl";

        "plugin.calebjohn.rich-markdown" =
          "https://github.com/joplin/plugins/raw/master/plugins/plugin.calebjohn.rich-markdown/plugin.jpl";
      };
    in
    ''
      echo "📦 Installing Joplin plugins (.jpl files)..."

      mkdir -p ${pluginDir}

      ${lib.concatStringsSep "\n" (
        lib.mapAttrsToList (filename: url: ''
          echo "→ Downloading ${filename}..."
          curl -fsSL "${url}" -o ${pluginDir}/${filename}.jpl
        '') jplPlugins
      )}
    ''
  );

  systemd.user.services.open-webui = {
    Unit = {
      Description = "Open WebUI";
      After = [ "network.target" ];
    };

    Service = {
      ExecStart = "${pkgs.open-webui}/bin/open-webui serve --port 3000";
      # Restart = "on-failure";
      Environment = [
        "OLLAMA_BASE_URL=http://localhost:11434"
        "DATA_DIR=%h"
      ];
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };

}
