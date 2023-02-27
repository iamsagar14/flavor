part 'flavor.dart';

class Config {
  Flavor currentFlavor = Flavor.development;
  String get description {
    return 'Currently configured in ${currentFlavor.name} flavor.';
  }

  String get applicationName {
    switch (currentFlavor) {
      case Flavor.development:
        return "[DEV] Flavor Core";
      case Flavor.staging:
        return "[STG] Flavor Core";
      case Flavor.production:
        return "Flavor Core";
    }
  }

  String get baseUrl {
    switch (currentFlavor) {
      case Flavor.development:
        throw UnimplementedError();
      case Flavor.staging:
        throw UnimplementedError();
      case Flavor.production:
        throw UnimplementedError();
    }
  }
}
