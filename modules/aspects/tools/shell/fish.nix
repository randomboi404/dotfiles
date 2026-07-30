{
  tools.fish = {
    homeManager =
      { pkgs, ... }:
      {
        programs.fish = {
          enable = true;

          plugins = [
            {
              name = "fzf-fish";
              src = pkgs.fishPlugins.fzf-fish.src;
            }

            {
              name = "forgit";
              src = pkgs.fishPlugins.forgit.src;
            }

            {
              name = "autopair";
              src = pkgs.fishPlugins.autopair.src;
            }
          ];

          interactiveShellInit = ''
            	  set -g fish_greeting ""
            	  set -g fish_key_bindings fish_vi_key_bindings
            	'';

          shellAbbrs = {
            ".." = "cd ..";
            "..." = "cd ../..";
            "...." = "cd ../../..";
            "....." = "cd ../../../..";

            ls = "eza";
            ll = "eza -l";
            la = "eza -la";
            cat = "bat";

            # Zoxide
            cd = "z";
          };
        };
      };
  };
}
