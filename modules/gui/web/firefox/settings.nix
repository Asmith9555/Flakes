{
  programs.firefox.profiles.default.settings = {
    "browser.disableResetPrompt" = true;
    "browser.download.useDownloadDir" = true;
    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
    "browser.shell.checkDefaultBrowser" = false;
    "browser.shell.defaultBrowserCheckCount" = 1;
    "browser.toolbars.bookmarks.visibility" = "never";
    "browser.uiCustomization.state" = ''
      {
        "placements": {
          "widget-overflow-fixed-list": [],
          "nav-bar": [
            "_3c078156-979c-498b-8990-85f7987dd929_-browser-action",
            "back-button",
            "forward-button",
            "stop-reload-button",
            "home-button",
            "urlbar-container",
            "downloads-button",
            "library-button",
            "_testpilot-containers-browser-action"
          ],
          "toolbar-menubar": ["menubar-items"],
          "TabsToolbar": ["tabbrowser-tabs","new-tab-button","alltabs-button"],
          "PersonalToolbar":["personal-bookmarks"]
        },
        "seen": [
          "save-to-pocket-button",
          "developer-button",
          "_testpilot-containers-browser-action"
        ],
        "dirtyAreaCache": [
          "nav-bar",
          "PersonalToolbar",
          "toolbar-menubar",
          "TabsToolbar",
          "widget-overflow-fixed-list"
        ],
        "currentVersion": 18,
        "newElementCount": 4
      }
    '';
    "media.ffmpeg.vaapi.enabled" = true;
    "dom.security.https_only_mode" = true;
    "identity.fxaccounts.enabled" = true;
    "privacy.trackingprotection.enabled" = true;
    "signon.rememberSignons" = false;
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
  };
}