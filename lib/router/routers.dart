import 'package:flutter/material.dart';
import 'package:question/Page/Dashboard/dashboard.dart';
import 'package:question/Page/Welcome/startView.dart';

class Routers {
  static final Map<String, Widget Function(BuildContext)> getPages = {
    '/start': (_) => const StartView(),
    '/dashboard': (_) => const DashboardView(),
  };
}
