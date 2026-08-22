{ config, pkgs, ... }:

{
  networking = {
    hostName = "kosmos"; # Hostname: change to whatever you want

    networkmanager.enable = true;

    nftables = {
      enable = true;
    };

    firewall = {
      enable = true;

      trustedInterfaces = [
        config.services.tailscale.interfaceName
      ];

      allowedTCPPorts = [
        22 # 80 443
      ];
      allowedUDPPorts = [
        config.services.tailscale.port
      ];
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