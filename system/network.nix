{ config, pkgs, ... }:

{
  networking = {
    hostName = "kosmos"; # Hostname: change to whatever you want

    networkmanager.enable = true;

    firewall = {
      enable = false; # Temporary disabled
    };
  };

  services.openssh = {
    enable = true;
    
    settings = {
      PermitRootLogin = "yes"; # no is recommended
    };
  };
}
