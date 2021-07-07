# :building_construction: Architecture

This file contains the explanation of the logic used to structure de folders/files in this project.

## Overview

This project was built based on the principles of [SOLID](https://en.wikipedia.org/wiki/SOLID) and [DDD](https://en.wikipedia.org/wiki/Domain-driven_design).

For more details, see the [`/lib` Topic](#lib---flutter-application).

### Name conventions

All the created (not generated) files are in the [`snake_case`](https://en.wikipedia.org/wiki/Snake_case) convention.

## `/github` - Github related files

Contains all the files related to Github, like the README images or Github Actions configuration.

## `/.vscode` - Visual Studio Code configuration

Contains all the VScode configuration

`launch.json` - The configuration needed to debug a flutter application.

## `/android` - Flutter required android files

Contains all required (and generated) files to output builds for the Android platform.

## `/assets` - Application assets

Contains all the assets of the application, like the app logo and the custom fonts used.

## `/ios` - Flutter required iOS files

Contains all required (and generated) files to output builds for the iOS platform.

## `/lib` - Flutter application

The Flutter application, where most of the action happens.

### `/app` - Application business logic

Contains all the business logic of the application.

Where the [`/ui`](#ui---application-view) and the [`/infra`](#infra---application-data-access) layers are connected.

### `/domain` - Application entities

Contains all the application entities classes.

Each entity is responsible for define all its business logic information.

### `/infra` - Application data access

Contains all the application data access logic. This is the lower-boundary of our application that communicates with external sources

Based in the Repository/Model logic:

- Each repository is responsible for getting the data from the external source.
- Each model is responsible for transforming the external data into an application entity.

### `/ui` - Application view

Contains all the interface logic of the app.

Communicates with the [`/app`](#app---application-business-logic) logic to retrieve the necessary data to display on the UI.

## `pubspec.yaml` - Flutter configuration file

Contains all the necessary configuration for Flutter and its dependencies. All the possible options are on the [official documentation](https://flutter.dev/docs/development/tools/pubspec).
`

`flutter_native_splash`: Configuration for the [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) dependency.

`flutter_icons`: Configuration for the [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) dependency.
