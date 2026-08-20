# This username is just an example... you can delete it or just use it... idk your choice

{ config, pkgs, ... }:

{
  users.users.alice = {
    isNormalUser = true;
    description = "Alice";
    extraGroups = [ "wheel" ];
  };
}