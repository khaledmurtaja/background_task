import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Alarm"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Schedule the alarm to go off in 10 seconds
            await AndroidAlarmManager.oneShot(
              const Duration(seconds: 10),
              0, // Unique ID
              launchAlarm, // Function to execute
              wakeup: true, // Ensures device wakes up if asleep
            );
          },
          child: const Text("Set Alarm"),
        ),
      ),
    );
  }
  // This function will be called by the Alarm Manager
  Future<void> launchAlarm() async {
    if (kDebugMode) {
      print("Alarm triggered!");
    }

    // Attempt to launch the app
    const platform = MethodChannel('alarm_screen_channel');
    try {
      await platform.invokeMethod('launchAlarmScreen');
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to launch alarm screen: ${e.message}");
      }
    }
  }
}
