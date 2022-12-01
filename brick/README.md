# Flavors in Flutter

Originally developed by Very Good Ventures 🦄

Flavors for flutter starter project with required modifications from Very Good Ventures Team.

_This fork is not maintained by nor affiliated with "Very Good Ventures"._

---

## Getting Started 🚀

_1. Supports iOS and Android_

_2. Starter project with GetX architecture_

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

- MainActivity.kt might get generated in incorrect path. Move it to android/app/src/main/kotlin/{{org_name.pathCase()}} inside brick/\_\_brick\_\_.
- Rename flavor_core inside brick/\_\_brick\_\_ as {{project_name.snakeCase()}}

---

## Use generated brick

```sh
# 🎯 Activate from https://pub.dev
$ dart pub global activate mason_cli

# Add brick from github url
$ mason add -g flavor_core_brick --git-url https://github.com/pandey407/flavor --git-path brick/

```
