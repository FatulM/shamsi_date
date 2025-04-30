{ pkgs, ... }: {
  channel = "stable-24.11";

  packages = [
    pkgs.dart
  ];

  env = {
    "DEBUG" = "true";
  };

  idx = {
    extensions = [
      "Dart-Code.dart-code"
    ];

    previews = {
      enable = false;
      previews = {};
    };

    workspace = {
      onCreate = {
        disable-analytics = "dart --disable-analytics";
        dart-version = "dart --version";
        dart-pub-get = "dart pub get";
      };

      onStart = {
        dart-pub-get = "dart pub get";
      };
    };
  };
}
