import 'package:class_attendance_app/widget/home.dart';
import 'package:class_attendance_app/widget/login.dart';
import 'package:class_attendance_app/widget/navdrawer.dart';
import 'package:class_attendance_app/widget/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      imageSrc: 'assets/splash.png',
      /*text: "Teacher",
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

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: LoginApp(),
      initialRoute: '/',
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Attendance(),
    GenerateQRPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClassApp Teacher'),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(0xFF, 0x94, 0x34, 0x42),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 50, // Changing Drawer Icon Size
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: 'View Students',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Unique Code',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(0xFF, 0x94, 0x34, 0x42),
        onTap: _onItemTapped,
      ),
    );
  }
}
