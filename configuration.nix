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

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };

  time.timeZone = "Europe/Bucharest";

  i18n.defaultLocale = "en_US.UTF-8";
  
  console = {
    keyMap = "us";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  system.copySystemConfiguration = true;

  system.stateVersion = "26.05";
}