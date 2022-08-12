import 'package:flutter/material.dart';
import 'package:modern_clock_app/navigation/bottom_tab/alarm_navigator/alarm_router_path.dart';

class AlarmRouterDelegate extends RouterDelegate<AlarmRouterPath> {
  //handling error, change display when change route

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Future<void> setNewRoutePath(AlarmRouterPath configuration) {

  }

  AlarmRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
            key: ValueKey('AlarmListPage'),
            child: AlarmListWidget()
        ),
        //should handle error
        //adding other screen here
        //
      ],
      onPopPage: ,
    );
  }

}