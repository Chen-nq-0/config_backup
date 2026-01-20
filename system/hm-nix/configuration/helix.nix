{ pkgs, lib, ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      editor = {
        line-number = "relative";
        cursorline = true;
        color-modes = true;
        true-color = true;
      };
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
      editor.indent-guides.render = true;
    };

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
          language-servers = [ "nixd" ];
        }
      ];
      language-server.nixd = {
        command = "nixd";
      };
    };
  };
}
