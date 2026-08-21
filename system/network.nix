{ config, pkgs, ... }:

{
  networking = {
    hostName = "kosmos"; # Hostname: change to whatever you want

    networkmanager.enable = true;

    nftables = {
      enable = true;
    };

    firewall = {
      enable = false; # Temporary disabled

      # trustedInterfaces = [
      #   config.services.tailscale.interfaceName
      # ];
      #
      # allowedUDPPorts = [
      #   config.services.tailscale.port
      # ];
    };
  };

  services.openssh = {
    enable = true;

    settings = {
      PermitRootLogin = "yes"; # no is recommended
    };
  };

  services.tailscale = {
    enable = true;

    # authKeyFile = "/run/secrets/tailscale_key";
  };
}