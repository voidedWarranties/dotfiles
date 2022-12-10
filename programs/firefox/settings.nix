{
  "browser.startup.homepage" = "about:blank";
  "browser.startup.page" = 3; # restore tabs

  "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
  "browser.compactmode.show" = true;
  "browser.uidensity" = 1;

  "browser.uiCustomization.state" = ''
    {"placements":{"widget-overflow-fixed-list":["library-button","add-ons-button","gdpr_cavi_au_dk-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","urlbar-container","save-to-pocket-button","fxa-toolbar-menu-button","ublock0_raymondhill_net-browser-action","_testpilot-containers-browser-action","downloads-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["firefox-view-button","tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["personal-bookmarks"]},"seen":["developer-button","_testpilot-containers-browser-action","ublock0_raymondhill_net-browser-action","gdpr_cavi_au_dk-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","toolbar-menubar","TabsToolbar","widget-overflow-fixed-list"],"currentVersion":18,"newElementCount":8}
  '';

  "identity.fxaccounts.enabled" = false; # disable sync menu

  # basically disable the activity stream
  "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
  "browser.newtabpage.activity-stream.feeds.topsites" = false;

  # disable recommendations
  "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
  "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;

  "signon.rememberSignons" = false;

  # ffprofile.com
  "app.normandy.api_url" = "";
  "app.normandy.enabled" = false;
  "app.shield.optoutstudies.enabled" = false;
  "app.update.auto" = false;
  "beacon.enabled" = false;
  "breakpad.reportURL" = "";
  "browser.cache.offline.enable" = false;
  "browser.crashReports.unsubmittedCheck.autoSubmit" = false;
  "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
  "browser.crashReports.unsubmittedCheck.enabled" = false;
  "browser.disableResetPrompt" = true;
  "browser.newtab.preload" = false;
  "browser.newtabpage.enhanced" = false;
  "browser.newtabpage.introShown" = true;
  "browser.safebrowsing.appRepURL" = "";
  "browser.safebrowsing.blockedURIs.enabled" = false;
  "browser.safebrowsing.downloads.enabled" = false;
  "browser.safebrowsing.downloads.remote.enabled" = false;
  "browser.safebrowsing.downloads.remote.url" = "";
  "browser.safebrowsing.enabled" = false;
  "browser.safebrowsing.malware.enabled" = false;
  "browser.safebrowsing.phishing.enabled" = false;
  "browser.selfsupport.url" = "";
  "browser.send_pings" = false;
  "browser.sessionstore.privacy_level" = 2;
  "browser.shell.checkDefaultBrowser" = false;
  "browser.startup.homepage_override.mstone" = "ignore";
  "browser.tabs.crashReporting.sendReport" = false;
  "browser.tabs.firefox-view" = false;
  "browser.urlbar.groupLabels.enabled" = false;
  "browser.urlbar.quicksuggest.enabled" = false;
  "browser.urlbar.speculativeConnect.enabled" = false;
  "browser.urlbar.trimURLs" = false;
  "datareporting.healthreport.service.enabled" = false;
  "datareporting.healthreport.uploadEnabled" = false;
  "datareporting.policy.dataSubmissionEnabled" = false;
  "device.sensors.ambientLight.enabled" = false;
  "device.sensors.enabled" = false;
  "device.sensors.motion.enabled" = false;
  "device.sensors.orientation.enabled" = false;
  "device.sensors.proximity.enabled" = false;
  "dom.battery.enabled" = false;
  "dom.security.https_only_mode" = true;
  "dom.security.https_only_mode_ever_enabled" = true;
  "experiments.activeExperiment" = false;
  "experiments.enabled" = false;
  "experiments.manifest.uri" = "";
  "experiments.supported" = false;
  "extensions.getAddons.cache.enabled" = false;
  "extensions.getAddons.showPane" = false;
  "extensions.greasemonkey.stats.optedin" = false;
  "extensions.greasemonkey.stats.url" = "";
  "extensions.pocket.enabled" = false;
  "extensions.shield-recipe-client.api_url" = "";
  "extensions.shield-recipe-client.enabled" = false;
  "extensions.webservice.discoverURL" = "";
  "media.autoplay.default" = 1;
  "media.autoplay.enabled" = false;
  "media.eme.enabled" = false;
  "media.gmp-widevinecdm.enabled" = false;
  "media.navigator.enabled" = false;
  "media.video_stats.enabled" = false;
  "network.allow-experiments" = false;
  "network.captive-portal-service.enabled" = false;
  "network.cookie.cookieBehavior" = 1;
  "network.dns.disablePrefetch" = true;
  "network.dns.disablePrefetchFromHTTPS" = true;
  "network.http.referer.spoofSource" = true;
  "network.http.speculative-parallel-limit" = 0;
  "network.predictor.enable-prefetch" = false;
  "network.predictor.enabled" = false;
  "network.prefetch-next" = false;
  "network.trr.mode" = 5;
  "privacy.donottrackheader.enabled" = true;
  "privacy.donottrackheader.value" = 1;
  "privacy.query_stripping" = true;
  "privacy.trackingprotection.cryptomining.enabled" = true;
  "privacy.trackingprotection.enabled" = true;
  "privacy.trackingprotection.fingerprinting.enabled" = true;
  "privacy.trackingprotection.pbmode.enabled" = true;
  "privacy.usercontext.about_newtab_segregation.enabled" = true;
  "security.ssl.disable_session_identifiers" = true;
  "signon.autofillForms" = false;
  "toolkit.telemetry.archive.enabled" = false;
  "toolkit.telemetry.bhrPing.enabled" = false;
  "toolkit.telemetry.cachedClientID" = "";
  "toolkit.telemetry.enabled" = false;
  "toolkit.telemetry.firstShutdownPing.enabled" = false;
  "toolkit.telemetry.hybridContent.enabled" = false;
  "toolkit.telemetry.newProfilePing.enabled" = false;
  "toolkit.telemetry.prompted" = 2;
  "toolkit.telemetry.rejected" = true;
  "toolkit.telemetry.reportingpolicy.firstRun" = false;
  "toolkit.telemetry.server" = "";
  "toolkit.telemetry.shutdownPingSender.enabled" = false;
  "toolkit.telemetry.unified" = false;
  "toolkit.telemetry.unifiedIsOptIn" = false;
  "toolkit.telemetry.updatePing.enabled" = false;
  "webgl.renderer-string-override" = " ";
  "webgl.vendor-string-override" = " ";
}
