import 'package:flutter/material.dart';

class AlarmNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlarmNavigatorState();
}

class _AlarmNavigatorState extends State<AlarmNavigator> {
  //refer to this:
  //https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade

  AlarmRouterDelegate _routerDelegate = AlarmRouterDelegate(); //to be implemented
  AlarmRouteInformationParser _routeInformationParser =
    AlarmRouteInformationParser(); //to be implemented

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routeInformationParser: _routeInformationParser,
        routerDelegate: _routerDelegate
    );
  }
}

abstract class AlarmRouterPath {
  final int id;
  final bool isUnknown;

  //Constructor for main alarm page
  AlarmRouterPath.home()
    : id = null,
      isUnknown = false;

  //Constructor for new alarm page like new alarm, ...
  AlarmRouterPath.detail(this.id) : isUnknown = false;

  //Constructor for unknown route (for error handling)
  AlarmRouterPath.unknown()
    : id = null,
      isUnknown = true;

  bool get isUnknown();

  bool get isHomePage();

  bool get isDetailsPage();
}

class UnknownPath extends AlarmRouterPath {
  
}

bool get isHomePage() => id == null;

bool get isDetailsPage() => id != null;