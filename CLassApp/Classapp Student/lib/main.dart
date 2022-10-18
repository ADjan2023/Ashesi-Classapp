import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:classappstudent/qr.dart';
import 'package:classappstudent/widget/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenshot_switcher/flutter_screenshot_switcher.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterScreenshotSwitcher.disableScreenshots();
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true);
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      // This is just a basic example. For real apps, you must show some
      // friendly dialog box before call the request method.
      // This is very important to not harm the user experience
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget example1 = SplashScreenView(
      navigateRoute: const MyHome(),
      duration: 4000,
      imageSize: 720,
      imageSrc: './assets/images/splash.png',
      /*text: "Splash Screen",
      textType: TextType.NormalText,*/
      backgroundColor: const Color.fromARGB(0xFF, 0xFF, 0xFF, 0xFF),
    );

    return MaterialApp(
      title: 'Splash screen Demo',
      home: example1,
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const LoginApp(),
        '/second': (context) => const MyHomePage(title: 'Ashesi ClassApp'),
        '/third': (context) => const BarcodeScannerWithoutController(),
        // When navigating to the "/second" route, build the SecondScreen widget.
      },

      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

      //home: const MyHomePage(title: 'Ashesi ClassApp'),
    );
  }
}
