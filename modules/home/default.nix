# imported by all users of all systems
{
  home.stateVersion = "22.11";
  imports = [
    ./profiles/datascience.nix
    ./profiles/development.nix
    ./profiles/engingeering.nix
    ./profiles/graphics.nix
    ./profiles/internet.nix
    ./profiles/multimedia.nix
    ./profiles/officetools.nix
    ./profiles/publishing.nix
    ./profiles/security.nix
    ./profiles/socialmedia.nix
    ./profiles/systemtools.nix
    ./all/tmux.nix
    ./all/neovim
    # ./helix.nix
    ./all/ssh.nix
    ./all/starship.nix
    ./all/terminal.nix
    ./all/nix.nix
    ./all/git.nix
    ./all/direnv.nix
    ./all/zellij.nix
    # ./nushell.nix
    ./all/just.nix
    ./all/powershell.nix
    ./all/juspay.nix

    # Comment out because of annoying password prompts
    # ./all/_1password.nix
  ];
}
