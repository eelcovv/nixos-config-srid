{ pkgs, ... }:
{
  imports = [
    ../all/jitsi.nix
  ];
  home.packages = with pkgs; [
    telegram-desktop
    whatsapp-for-linux
    nextcloud-client
    # jitsi-meet
  ];
}
