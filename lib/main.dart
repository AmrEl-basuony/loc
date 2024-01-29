import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loc/core/firebase_options.dart';
import 'package:loc/core/routing/router.dart';
import 'package:loc/hive_adapters.dart';
import 'package:loc/hive_boxes.dart';
import 'package:loc/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    AwesomeNotifications().initialize(null, [
      NotificationChannel(
        channelKey: 'channelKey',
        playSound: true,
        channelName: 'channelName',
        channelDescription: 'channelDescription',
      )
    ]),
    Hive.initFlutter().then((value) {
      registerAdapters();
      openBoxes();
    }),
    initDependencies(),
  ]);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
