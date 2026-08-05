{
  den,
  apps,
  tools,
  features,
  ...
}:
{
  den.aspects.rb4 = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
      (den.batteries.user-shell "fish")

      features.containers

      apps.discord
      apps.spotify
      apps.librewolf
      apps.mpv
      apps.furmark
      apps.kitty
      apps.obsidian
      apps.pwvucontrol
      apps.nemo
      tools.neovim
      tools.fish
      tools.starship
      tools.opencode
      tools.ani-cli
      tools.btop
      tools.fastfetch
      tools.anime4k
      tools.zoxide
      tools.git
      tools.gh
      tools.bat
      tools.eza
      tools.fzf
    ];
  };
}
