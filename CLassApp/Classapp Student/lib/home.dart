import 'package:classappstudent/qr.dart';
import 'package:flutter/material.dart';

import 'caller.dart';
import 'navdrawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as Email;

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 50, // Changing Drawer Icon Size
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        elevation: 0,
      ),
      drawer: NavDrawer(),
      body: Column(
        children: <Widget>[
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 13, bottom: 0, right: 0, top: 10),
              child: Text(
                "Explore",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 13, bottom: 0, right: 0, top: 5),
              child: Text(
                "Ashesi University ClassApp",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage("assets/images/homelogo.png"),
                  ),
                ),
                child: CustomScrollView(
                  primary: false,
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.only(
                          left: 13, bottom: 0, right: 13, top: 10),
                      sliver: SliverGrid.count(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: SizedBox(
                              height: 100, //height of button
                              width: 300,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      Color.fromARGB(0xFF, 0x94, 0x34, 0x42),
                                  shape: RoundedRectangleBorder(
                                      //to set border radius to button
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                child: Image.asset('assets/images/scan.png'),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/third',
                                      arguments: Email1(email.email));
                                },
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(0xFF, 0x94, 0x34, 0x42),
                                shape: RoundedRectangleBorder(
                                    //to set border radius to button
                                    borderRadius: BorderRadius.circular(20)),
                                minimumSize: Size(20, 55),
                              ),
                              child: Image.asset('assets/images/contact.png'),
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Demo()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class Email {
  String email;

  Email(this.email);
}
