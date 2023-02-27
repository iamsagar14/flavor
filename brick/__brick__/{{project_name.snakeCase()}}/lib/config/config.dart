part 'flavor.dart';

class Config {
  Flavor currentFlavor = Flavor.development;
  String get description {
    return 'Currently configured in ${currentFlavor.name} flavor.';
  }

  String get applicationName {
    switch (currentFlavor) {
      case Flavor.development:
        return "[DEV] {{project_name.titleCase()}}";
      case Flavor.staging:
        return "[STG] {{project_name.titleCase()}}";
      case Flavor.production:
        return "{{project_name.titleCase()}}";
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
