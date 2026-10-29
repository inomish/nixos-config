{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.brave-origin
  ];

  programs.chromium = {
    enable = true;

    homepageLocation = "https://www.duckduckgo.com/";

    extensions = [
      "nngceckbapebfimnlniiiahkandclblb;https://clients2.google.com/service/update2/crx" # bitwarden

      "mnjggcdmjocbbbhaepdhchncahnbgone;https://clients2.google.com/service/update2/crx" # sponsorblock

      "hfjbmagddngcpeloejdejnfgbamkjaeg;https://clients2.google.com/service/update2/crx" # vimium C

      "bihgaolammfihpmkpphbngkhdelcnkfa;https://clients2.google.com/service/update2/crx" # Middle click scroll
    ];

    extraOpts = {
      DefaultSearchProviderEnabled = true;
      DefaultSearchProviderName = "Duckduckgo";
      DefaultSearchProviderSearchURL = "https://duckduckgo.com/?q={searchTerms}";
      DefaultSearchProviderSuggestURL = "https://duckduckgo.com/ac/?q={searchTerms}&type=list";
      DefaultSearchProviderIconURL = "https://duckduckgo.com/favicon.ico";
      HomepageLocation = "https://www.duckduckgo.com/";
      NewTabPageLocation = "https://www.duckduckgo.com/";
      RestoreOnStartupURLs = ["https://www.duckduckgo.com/"];

      WebAppInstallForceList = [
        {
          "custom_name" = "Discord";
          "create_desktop_shortcut" = true;
          "default_launch_container" = "window";
          "url" = "https://discord.com/login";
        }
        {
          "custom_name" = "Teams";
          "create_desktop_shortcut" = true;
          "default_launch_container" = "window";
          "url" = "https://teams.microsoft.com/v2/";
        }
        {
          "custom_name" = "Spotify";
          "create_desktop_shortcut" = true;
          "default_launch_container" = "window";
          "url" = "https://open.spotify.com/";
        }
        {
          "custom_name" = "Cinny";
          "create_desktop_shortcut" = true;
          "default_launch_container" = "window";
          "url" = "https://app.cinny.in/";
        }
        {
          "custom_name" = "Fluxer";
          "create_desktop_shortcut" = true;
          "default_launch_container" = "window";
          "url" = "https://web.canary.fluxer.app/channels/@me";
        }
      ];
    };
  };
}
