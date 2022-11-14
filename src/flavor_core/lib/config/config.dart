part 'flavor.dart';

class Config {
  static Flavor currentFlavor = Flavor.development;
  static String get description {
    return 'Currently configured in ${currentFlavor.name} flavor.';
  }

  // TODO: Implementation required
  static String get baseUrl {
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
