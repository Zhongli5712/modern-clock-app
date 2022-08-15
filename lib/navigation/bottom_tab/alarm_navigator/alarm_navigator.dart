import 'package:flutter/material.dart';

class AlarmNavigator extends StatefulWidget {
  const AlarmNavigator({Key? key}) : super(key: key);

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