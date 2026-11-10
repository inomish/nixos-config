{pkgs, ...}: let
  bravePolicy = {
    HomepageLocation = "https://www.duckduckgo.com/";
    HomepageIsNewTabPage = false;
    NewTabPageLocation = "https://www.duckduckgo.com/";

    DefaultSearchProviderEnabled = true;
    DefaultSearchProviderName = "DuckDuckGo";
    DefaultSearchProviderSearchURL = "https://duckduckgo.com/?q={searchTerms}";
    DefaultSearchProviderSuggestURL = "https://duckduckgo.com/ac/?q={searchTerms}&type=list";
    DefaultSearchProviderIconURL = "https://duckduckgo.com/favicon.ico";

    ExtensionInstallForcelist = [
      "nngceckbapebfimnlniiiahkandclblb;https://clients2.google.com/service/update2/crx" # bitwarden
      "bihgaolammfihpmkpphbngkhdelcnkfa;https://clients2.google.com/service/update2/crx" # middle click scroll
    ];

    WebAppInstallForceList = [
      {
        custom_name = "Discord";
        create_desktop_shortcut = true;
        default_launch_container = "window";
        url = "https://discord.com/login";
      }
      {
        custom_name = "Teams";
        create_desktop_shortcut = true;
        default_launch_container = "window";
        url = "https://teams.microsoft.com/v2/";
      }
      {
        custom_name = "Spotify";
        create_desktop_shortcut = true;
        default_launch_container = "window";
        url = "https://open.spotify.com/";
      }
      {
        custom_name = "Cinny";
        create_desktop_shortcut = true;
        default_launch_container = "window";
        url = "https://app.cinny.in/";
      }
      {
        custom_name = "Fluxer";
        create_desktop_shortcut = true;
        default_launch_container = "window";
        url = "https://web.canary.fluxer.app/channels/@me";
      }
    ];
  };
in {
  environment.systemPackages = [pkgs.brave-origin];

  environment.etc."brave/policies/managed/brave.json".text =
    builtins.toJSON bravePolicy;
}
