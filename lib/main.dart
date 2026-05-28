import 'package:flutter/material.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

import 'home_page.dart';

void main() async {
  // Ensure that plugin services are initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the Alarm Manager plugin
  await AndroidAlarmManager.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}
