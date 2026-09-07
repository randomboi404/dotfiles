{
  development.java = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
	  jetbrains.java
          jdk
          maven
          gradle
        ];
      };
  };
}
