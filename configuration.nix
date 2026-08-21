{ config, lib, pkgs, ... }:

let
  userFiles = builtins.attrNames (builtins.readDir ./users);

  userImports = map
    (file: ./users/${file})
    (builtins.filter
      (file: builtins.match ".*\\.nix" file != null)
      userFiles);
in
{
  imports =
    [
      ./system/meta.nix
      ./hardware-configuration.nix
      ./system/network.nix
      ./system/pkg.nix
      ./system/services.nix
    ]
    ++ userImports;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  time.timeZone = "Europe/Bucharest";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  system.copySystemConfiguration = true;

  system.stateVersion = "26.05";
}