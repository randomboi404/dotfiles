{
  tools.eza = {
    homeManager = {
      programs.eza = {
        enable = true;
        git = true;
        extraOptions = [
          "--hyperlink"
          "--icons=auto"
          "--group-directories-first"
        ];
      };
    };
  };
}
