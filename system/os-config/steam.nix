{
  config,
  lib,
  pkgs,
  ...
}:
{
  systemd.settings.Manager = {
    DefaultLimitNOFILE = "524288";
  };
  security.pam.loginLimits = [
    {
      domain = "agonie";
      type = "hard";
      item = "nofile";
      value = "524288";
    }
  ];
  programs = {
    steam = {
      enable = true;
      package = pkgs.steam.override {
        extraPkgs =
          pkgs': with pkgs'; [
            xorg.libXcursor
            xorg.libXi
            xorg.libXinerama
            xorg.libXScrnSaver
            libpng
            libpulseaudio
            libvorbis
            stdenv.cc.cc.lib # Provides libstdc++.so.6
            libkrb5
            keyutils
            # Add other libraries as needed
            vulkan-loader
            vulkan-tools
            libdrm
            openssl
            lsb-release
            libglvnd
            xorg.libXfixes
            xorg.libXrandr
            xorg.libXcomposite
          ];
      };
    };

    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}
