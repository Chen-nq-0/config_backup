{ pkgs, lib, ... }:

{
  nixpkgs = {
    hostPlatform = lib.mkDefault "x86_64-linux";
    config.allowUnfree = true;
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };

    settings = {
      auto-optimise-store = true;
      substituters = [ "https://mirrors.cernet.edu.cn/nix-channels/store" ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
