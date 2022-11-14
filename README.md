# Flavors in Flutter


Originally developed by [Very Good Ventures][very_good_ventures_link] 🦄

[![License: MIT][license_badge]][license_link]

Flavors for flutter starter project with required modifications by from [Very Good Ventures Team][very_good_ventures_link].

*This fork is not maintained by nor affiliated with "Very Good Ventures".*

---

## Getting Started 🚀


*1. Supports iOS and Android*

*2. Starter project with GetX architecture*

This project contains a brick generator for generating flavored flutter templates:

To run the generator either use the launch configuration in VSCode or use the following commands:

```sh
# Navigate to tool/generator
$ cd tool/generator

# Run pub get
$ dart pub get

# Navigate back to root
$ cd ..
$ cd ..

# Run generator
$ dart run tool/generator/main.dart
```

---

## Some notes
While running the generator, somethings need to be corrected manually. To correct them follow:
- MainActivity.kt might get generated in incorrect path. Move it to android/app/src/main/kotlin/{{org_name.pathCase()}} inside brick/\__brick\__.
- Rename flavor_core inside brick/\__brick\__ as {{project_name.snakeCase()}}


---
## Use generated brick

```sh
# 🎯 Activate from https://pub.dev
$ dart pub global activate mason_cli
```

