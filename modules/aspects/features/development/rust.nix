{
  development.rust = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        jetbrains.rust-rover
        rustup
      ];
    };
  };
}
