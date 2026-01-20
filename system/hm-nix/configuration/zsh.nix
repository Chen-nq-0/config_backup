{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
  #    export https_proxy=http://127.0.0.1:7890
  #    export http_proxy=http://127.0.0.1:7890
  #    export all_proxy=socks5://127.0.0.1:7890
    '';

    shellAliases = {
      ll = "ls -l";
      edit = "sudo -v";
      update = "sudo -v && sudo unbuffer nixos-rebuild switch --flake ~/.my-nIX/.#Cat --log-format internal-json -v |& nom --json";
    };

    history.size = 10000;
    history.path = "$HOME/.zsh_history";
  };
}
