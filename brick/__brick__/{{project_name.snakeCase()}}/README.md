# Flavors in Flutter


Originally developed by [Very Good Ventures][very_good_ventures_link] 🦄

[![License: MIT][license_badge]][license_link]

Flavors for flutter starter project with required modifications by from [Very Good Ventures Team][very_good_ventures_link].

*This fork is not maintained by nor affiliated with "Very Good Ventures".*

---

## Getting Started 🚀


*1. Supports iOS and Android*

*2. Starter project with GetX architecture*

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

---

## Define flavor specific variables 🍭
```dart
String baseUrl get {
    switch(appFlavor) {
        case Flavor.development:
            return "api.dev"
        case Flavor.staging:
            return "api.staging"
        case Flavor.production:
            return "api.production"
    }
}
```