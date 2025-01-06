# imported by all users of all systems
{
  home.stateVersion = "22.11";
  imports = [
    ./all/tmux.nix
    ./all/neovim
    # ./helix.nix
    ./all/ssh.nix
    ./all/starship.nix
    ./all/terminal.nix
    # ./all/internet.nix
    # ./profiles/development.nix
    ./all/nix.nix
    ./all/internet.nix
    ./all/git.nix
    ./all/direnv.nix
    ./all/zellij.nix
    # ./nushell.nix
    ./all/just.nix
    # ./powershell.nix
    ./all/juspay.nix

    # Comment out because of annoying password prompts
    # ./all/_1password.nix
  ];
}
