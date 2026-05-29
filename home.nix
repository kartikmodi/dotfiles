{
  pkgs,
  username,
  nixgl,
  nixglPkgs,
  antigravityPkgs,
  lib,
  ...
}:
let
  homeDir = "/home/${username}";
  venvsDir = "${homeDir}/.venvs";
  globalEnvPath = "${venvsDir}/global";
  uvBin = "${pkgs.uv}/bin/uv";
  npmBin = "${pkgs.nodejs}/bin/npm";
  antigravityIdeBin = "${antigravityPkgs.google-antigravity-ide}/bin/antigravity-ide";
  bashrcdDir = ./bashrcd;
  bashrcdFiles =
    lib.mapAttrs'
      (
        name: _:
        lib.nameValuePair ".bashrc.d/${name}" {
          source = bashrcdDir + "/${name}";
        }
      )
      (
        lib.filterAttrs (name: type: type == "regular" && lib.hasSuffix ".sh" name) (
          builtins.readDir bashrcdDir
        )
      );
  rtk = pkgs.stdenv.mkDerivation rec {
    pname = "rtk";
    version = "0.40.0";

    src =
      let
        platform =
          {
            x86_64-linux = {
              asset = "rtk-x86_64-unknown-linux-musl.tar.gz";
              hash = "sha256-p10hCkRYdBBrwW2itO+6AdNtKXr6M+wTRyjy1fQu9a8=";
            };
            aarch64-linux = {
              asset = "rtk-aarch64-unknown-linux-gnu.tar.gz";
              hash = "sha256-HQCHrWKhgsCDPCJRrGeLXgU1ZBjZGqVzBaxRoSbJsQI=";
            };
          }
          .${pkgs.stdenv.hostPlatform.system}
            or (throw "rtk is not packaged for ${pkgs.stdenv.hostPlatform.system}");
      in
      pkgs.fetchurl {
        url = "https://github.com/rtk-ai/rtk/releases/download/v${version}/${platform.asset}";
        hash = platform.hash;
      };

    sourceRoot = ".";
    dontConfigure = true;
    dontBuild = true;

    installPhase = ''
      runHook preInstall
      install -Dm755 rtk $out/bin/rtk
      runHook postInstall
    '';
  };
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
    nixd

    # dev
    gh
    github-desktop
    github-copilot-cli

    drawio
    postgresql
    # mongodb
    nodejs
    # bun
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
    # zellij # fails to build currently: zellij 0.44.1 requires rustc 1.92
    wezterm
    gnupg
    gpgme
    awscli2
    aws-vault
    parquet-tools
    avro-tools
    arrow-cpp

    # AI
    # mkdir .npm-global
    # npm config set prefix ~/.npm-global
    # n8n
    # lmstudio
    # ollama-cuda
    # open-webui
    # librechat
    rtk
    # antigravityPkgs.default
    # antigravityPkgs.google-antigravity-ide
    antigravityPkgs.google-antigravity-cli
    # zed-editor-fhs

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
    bitwarden-cli
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
    # obs-studio # Failed to initialize video.  Your GPU may not be supported, or your graphics drivers may need to be updated.
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
    obsidian
    logseq

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
    # protonvpn-gui
    mozillavpn # doesn't work some problem

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

    # AI
    # hermes-agent
    # TrustClaw

    # NeverWrite #check in future
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

    telegram-desktop
    # configure nfs
    # configure rsync pcloud
    jira-cli-go
    jiratui
    # localsend # doesn't work
    # pdfsam-basic
    qalculate-qt
    pdfarranger
    # onlyoffice
    super-productivity # older version available, look for other ways in future
    # logseq
    # obsidian

  ];
  home.stateVersion = "25.11";
  #copilot plugin marketplace add obra/superpowers-marketplace
  # gemini extensions install https://github.com/obra/superpowers

  home.file = bashrcdFiles // {
    ".bashrc".source = ./bashrc;
    ".npmrc".text = "prefix = ${homeDir}/.npm-global";
    # ".config/opencode/opencode.jsonc".source = ./opencode.jsonc;
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    mutableExtensionsDir = true;

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
      "diffEditor.ignoreTrimWhitespace" = false;
      "terminal.integrated.commandsToSkipShell" = [
        "kilo-code.new.agentManagerOpen"
        "kilo-code.new.agentManager.showTerminal"
      ];
    };
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
  # home.activation.flatpakSetup = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #  DISPLAY=:0 /usr/bin/flatpak --verbose remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo || true
  #'';

  # home.activation.flatpakApps = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #       apps=(
  # # Browsers
  # # com.brave.Browser - Plasma Integration does not work
  #  org.chromium.Chromium - Plasma integration works

  # #     # AI
  # #     # io.github.qwersyk.Newelle
  # #     # com.jeffser.Alpaca
  # #     # io.gitlab.theevilskeleton.Upscaler
  # #     # io.gpt4all.gpt4all
  # #     # com.cherry_ai.CherryStudio
  # dev.zed.Zed
  # #     # Files
  # #     io.kapsa.drive
  # #     com.hunterwittenborn.Celeste
  #  org.localsend.localsend_app
  # #     # Communication
  # #     com.github.IsmaelMartinez.teams_for_linux

  # #     # rustdesk
  # #     # com.rustdesk.Rustdesk
  #     )
  #     for app in "''${apps[@]}"; do
  #       /usr/bin/flatpak install --user -y flathub "$app"
  #     done
  # '';

  home.activation.setupUvEnvs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -d "${globalEnvPath}" ]; then
      mkdir -p "${globalEnvPath}"
      ${uvBin} venv "${globalEnvPath}"
    fi

    whls=(
      # AI
      huggingface_hub[cli]
      # nvitop
      # gpustat
      athenacli

      # DB
      # duckdb
    )
    for whl in "''${whls[@]}"; do
      ${uvBin} pip install -p "${globalEnvPath}" -U "$whl"
    done
  '';

  home.activation.installVscodeExtensions =
    let
      vscodeExtensions = [
        "dvirtz.parquet-viewer"
        "foxundermoon.shell-format"
        # "github.copilot" # https://code.visualstudio.com/blogs/2025/11/04/openSourceAIEditorSecondMilestone
        "github.copilot-chat" # https://github.com/microsoft/vscode-copilot-chat
        "github.vscode-pull-request-github"
        "hashicorp.terraform"
        "jnoortheen.nix-ide"
        "kilocode.kilo-code"
        "mads-hartmann.bash-ide-vscode"
        "ms-python.python"
        "ms-python.vscode-pylance"
        "ms-vscode-remote.remote-ssh"
        "ms-vscode-remote.remote-ssh-edit"
        "openai.chatgpt"
        "redhat.ansible"
        "redhat.java"
        "redhat.vscode-yaml"
        "saoudrizwan.claude-dev"
        "timonwong.shellcheck"
        "woozy-masta.codex-switch"
      ];
      vscodeExtensionsHash = builtins.hashString "sha256" (
        lib.concatStringsSep "\n" (lib.sort (a: b: a < b) vscodeExtensions)
      );
    in
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      marker="${homeDir}/.cache/hm-vscode-exts.${vscodeExtensionsHash}"
      if [ -f "$marker" ]; then
        echo "✅ VS Code extensions already installed (delete $marker to force reinstall)"
      else
        echo "📦 Installing VS Code Extensions..."
        rm -f ${homeDir}/.cache/hm-vscode-exts.* 2>/dev/null || true
        for ext in ${lib.escapeShellArgs vscodeExtensions}; do
          ${pkgs.vscode}/bin/code --install-extension "$ext" --force || true
        done
        mkdir -p "$(dirname "$marker")" && touch "$marker"
      fi
    '';

  home.activation.installAntigravityExtensions =
    let
      antigravityExtensions = [
        "foxundermoon.shell-format"
        "golang.go"
        "hashicorp.terraform"
        "jnoortheen.nix-ide"
        "llvm-vs-code-extensions.vscode-clangd"
        "mads-hartmann.bash-ide-vscode"
        "meta.pyrefly"
        "ms-python.debugpy"
        "ms-python.python"
        # "ms-python.vscode-pylance"
        "ms-python.vscode-python-envs"
        # "ms-vscode-remote.remote-ssh"
        # "ms-vscode-remote.remote-ssh-edit"
        "redhat.ansible"
        "redhat.java"
        "redhat.vscode-yaml"
        "shopify.ruby-lsp"
        "timonwong.shellcheck"
        "erennyuksell.ag-multi-account-switchboard"
      ];
      antigravityExtensionsHash = builtins.hashString "sha256" (
        lib.concatStringsSep "\n" (lib.sort (a: b: a < b) antigravityExtensions)
      );
    in
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      marker="${homeDir}/.cache/hm-antigravity-exts.${antigravityExtensionsHash}"
      if [ -f "$marker" ]; then
        echo "✅ Antigravity extensions already installed (delete $marker to force reinstall)"
      else
        echo "📦 Installing Antigravity Extensions..."
        rm -f ${homeDir}/.cache/hm-antigravity-exts.* 2>/dev/null || true
        for ext in ${lib.escapeShellArgs antigravityExtensions}; do
          /usr/bin/antigravity --install-extension "$ext" || true
        done
        mkdir -p "$(dirname "$marker")" && touch "$marker"
      fi
    '';

  home.activation.installNpmPackages =
    let
      npmPackages = [
        "@google/gemini-cli"
        "@openai/codex"
        "@anthropic-ai/claude-code"
        "@kilocode/cli"
        "opencode-ai"
      ];
    in
    lib.hm.dag.entryAfter [ "installPackages" ] ''
      echo "📦 Installing Global NPM Packages..."
      for pkg in ${lib.escapeShellArgs npmPackages}; do
      PATH="${lib.makeBinPath [ pkgs.nodejs ]}:$PATH" \
        ${npmBin} install -g --prefix ${homeDir}/.npm-global "$pkg" || true
       done
    '';

}
