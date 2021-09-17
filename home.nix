{ pkgs, inputs, system, ... }:
let
  #himalayaSrc = inputs.himalaya;
  #himalaya = import ./features/email/himalaya.nix { inherit pkgs inputs system; };
  neovim-nightly = inputs.neovim-nightly-overlay.packages.${system}.neovim;
  emanote = inputs.emanote.outputs.defaultPackage.${system};
in
rec {


  #imports = pkgs.lib.optional (!bare)
  #  inputs.nix-doom-emacs.hmModule;

  home.packages = with pkgs; [
    emanote

    cachix
    tig
    procs # no more: ps -ef | grep 
    tealdeer
    unzip
    dust
    ripgrep
    htop
    bottom # htop alternative
    fzf
    aria2
    # ^ easy to forget these; write SRS?

    hledger
    hledger-web

    # latex
    # texlive.combined.scheme-full
  ];

  programs = {
    git = import ./home/git.nix;

    tmux = import ./home/tmux.nix;

    #doom-emacs = {
    #  enable = false;
    #  doomPrivateDir = ./config/doom.d;
    #};

    neovim = {
      enable = true;
      package = neovim-nightly;
      viAlias = true;
      # withNodeJs = true;

      extraPackages = [
        # himalaya
      ];

      plugins = with pkgs.vimPlugins; [
        vim-airline
        papercolor-theme

        #(pkgs.vimUtils.buildVimPlugin {
        #  name = "himalaya";
        #  src = himalayaSrc + "/vim";
        #})
      ];

      extraConfig = ''
        " papercolor-theme
        " set t_Co=256   " This is may or may not needed.
        set background=light
        colorscheme PaperColor
      '';
    };

    bash = {
      enable = true;
      shellAliases = {
        g = "${pkgs.git}/bin/git";
        t = "${pkgs.tig}/bin/tig";
        l = "${pkgs.exa}/bin/exa";
        ll = "${pkgs.exa}/bin/exa -l";
        ls = "l";
        #h = "himalaya";
      };
      sessionVariables = { };
      bashrcExtra = ''
        . ~/.nix-profile/etc/profile.d/nix.sh
        export PATH=$HOME/.nix-profile/bin:$PATH

        # https://github.com/nix-community/home-manager/issues/1871#issuecomment-852739277
        for completion_script in ~/.nix-profile/share/bash-completion/completions/*
        do
          source "$completion_script"
        done
      '';
    };

    starship =
      {
        enable = true;
        settings = {
          username = {
            format = "[$user](bold blue) ";
            disabled = false;
            show_always = true;
          };
          hostname = {
            ssh_only = false;
            format = "on [$hostname](bold red) ";
            trim_at = ".companyname.com";
            disabled = false;
          };
        };
      };

    bat.enable = true;
    autojump.enable = false;
    zoxide.enable = true;
    fzf.enable = true;
    jq.enable = true;
  };

  programs.ssh = {
    enable = true;
    matchBlocks = {
      #"p71" = {
      #  hostname = "192.168.2.76";
      #};
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  # home.stateVersion = "21.03";
}
