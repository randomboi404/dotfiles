{
  description = "randomboi404's NixOS Config";

  inputs = {
    den.url = "github:denful/den";

    flake-file.url = "github:vic/flake-file";

    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
      url = "github:hercules-ci/flake-parts";
    };

    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };

    import-tree.url = "github:vic/import-tree";

    multiverse.url = "github:fzakaria/nixpkgs-multiverse";

    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";

    nixpkgs-lib.follows = "nixpkgs";

    nixcord.url = "github:4evy/nixcord";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    awcc = {
      url = "github:tr1xem/AWCC";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xlibre-overlay.url = "git+https://codeberg.org/takagemacoed/xlibre-overlay?ref=dev-for-26.05";

    nixfmt-rs = {
      url = "github:Mic92/nixfmt-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-lact = {
      url = "github:NixOS/nixpkgs/3d46470bb3030020f7e1361f33514854f5bfa86d";
    };

    r4wm = {
      url = "github:randomboi404/r4wm";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
