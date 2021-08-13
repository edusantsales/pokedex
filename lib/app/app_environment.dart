import 'package:flutter/material.dart';

class AppEnvironment extends InheritedWidget {
  final String environment;
  final String apiBaseUrl;

  AppEnvironment._(
    this.environment,
    this.apiBaseUrl,
    Widget child,
  ) : super(child: child);

  static AppEnvironment? _instance;

  static AppEnvironment? getInstance({environment, apiBaseUrl, child}) {
    if (_instance == null) {
      _instance = AppEnvironment._(
        environment,
        apiBaseUrl,
        child,
      );
      debugPrint('-- APP CONFIGURED FOR: $environment');
      return _instance;
    }
    return _instance;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
