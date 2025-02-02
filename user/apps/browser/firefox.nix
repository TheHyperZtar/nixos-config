{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.nur.modules.homeManager.default];
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never";
      DisplayMenuBar = "default-off";
      SearchBar = "unified";
      Preferences = {
        "browser.contentblocking.category" = {
          Value = "strong";
          Status = "locked";
        };
        "extensions.pocket.enabled" = false;
        "extensions.screenshots.disabled" = true;
        "browser.topsites.contile.enabled" = false;
        "browser.formfill.enable" = false;
        "browser.search.suggest.enabled" = false;
        "browser.search.suggest.enabled.private" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.showSearchSuggestionsFirst" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.system.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      };
    };
    profiles = {
      TheHyperZtar = {
        name = "TheHyperZtar";
        isDefault = true;
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          stylus
          return-youtube-dislikes
          tabliss
          violentmonkey
        ];
        settings = {
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        bookmarks = [
          {
            name = "Bookmarks Toolbar";
            toolbar = true;
            bookmarks = [
              {
                name = "Search";
                bookmarks = [
                  {
                    name = "DuckDuckGo";
                    url = "https://duckduckgo.com";
                  }
                  {
                    name = "Google";
                    url = "https://google.com";
                  }
                ];
              }
              {
                name = "Media";
                bookmarks = [
                  {
                    name = "Youtube";
                    url = "https://youtube.com";
                  }
                  {
                    name = "Netflix";
                    url = "https://netflix.com";
                  }
                ];
              }
              {
                name = "Mail";
                bookmarks = [
                  {
                    name = "Gmail";
                    url = "https://mail.google.com/mail/u/0";
                  }
                ];
              }
              {
                name = "Games";
                bookmarks = [
                  {
                    name = "Roblox";
                    url = "https://roblox.com";
                  }
                  {
                    name = "Bad Time Simulator";
                    url = "https://jcw87.github.io/c2-sans-fight";
                  }
                ];
              }
              {
                name = "Resources";
                bookmarks = [
                  {
                    name = "FMHY";
                    url = "https://fmhy.net";
                  }
                  {
                    name = "Wikipedia";
                    url = "https://wikipedia.org";
                  }
                ];
              }
              {
                name = "AIs";
                bookmarks = [
                  {
                    name = "ChatGPT";
                    url = "https://chatgpt.com";
                  }
                ];
              }
              {
                name = "NixOS";
                bookmarks = [
                  {
                    name = "NixOS Search";
                    url = "https://search.nixos.org";
                  }
                  {
                    name = "HM Search";
                    url = "https://home-manager-options.extranix.com";
                  }
                ];
              }
            ];
          }
        ];
      };
    };
  };
}
