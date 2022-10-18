import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            "Contact Lecturers",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView(children: [
          ListTile(
            title: Text('Ayawoa Dagbovie'),
            subtitle: Text('Discrete Mathematics'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/ayawoa.jpg'),
            ),
            trailing: IconButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('+233558393267');
                },
                icon: Icon(Icons.call),
                color: Color.fromARGB(0xFF, 0x94, 0x34, 0x42)),
          ),
          ListTile(
            title: Text('Ayorkor Korsah'),
            subtitle: Text('Algorithms and Analysis'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/ayorkor korsah.jpg'),
            ),
            trailing: IconButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('+233545951999');
                },
                icon: Icon(Icons.call),
                color: Color.fromARGB(0xFF, 0x94, 0x34, 0x42)),
          ),
          ListTile(
            title: Text('Dennis Owusu'),
            subtitle: Text('Machine Learning'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/dennis owusu.jpg'),
            ),
            trailing: IconButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('+233501865124');
                },
                icon: Icon(Icons.call),
                color: Color.fromARGB(0xFF, 0x94, 0x34, 0x42)),
          ),
          ListTile(
            title: Text('David Ebo'),
            subtitle: Text(
                'Introduction to computer programming for CS, Data structures'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/ebo.jpg'),
            ),
            trailing: IconButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('+233205227760');
                },
                icon: Icon(Icons.call),
                color: Color.fromARGB(0xFF, 0x94, 0x34, 0x42)),
          ),
          ListTile(
            title: Text('Gordon Adomdza'),
            subtitle: Text('Software Engineering'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/Gordon.jpg'),
            ),
            trailing: IconButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('+233205227760');
                },
                icon: Icon(Icons.call),
                color: Color.fromARGB(0xFF, 0x94, 0x34, 0x42)),
          ),
          ListTile(
            title: Text('Rose Dodd'),
            subtitle: Text('Linear Algebra'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/Rose Dodd.jpg'),
            ),
            trailing: IconButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('+233205227760');
                },
                icon: Icon(Icons.call),
                color: Color.fromARGB(0xFF, 0x94, 0x34, 0x42)),
          ),
          ListTile(
            title: Text('David Sampah'),
            subtitle: Text('Mobile App Development'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/sampah.jpg'),
            ),
            trailing: IconButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('+233505848699');
                },
                icon: Icon(Icons.call),
                color: Color.fromARGB(0xFF, 0x94, 0x34, 0x42)),
          ),
          ListTile(
            title: Text('akua ahenkorah'),
            subtitle: Text('Operating Systems'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/akua ahenkorah.jpg'),
            ),
            trailing: IconButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('+233205227760');
                },
                icon: Icon(Icons.call),
                color: Color.fromARGB(0xFF, 0x94, 0x34, 0x42)),
          ),
          ListTile(
            title: Text('Nathan Amanquah'),
            subtitle: Text('Computer Engineering'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/Nathan.jpg'),
            ),
            trailing: IconButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('+233205227760');
                },
                icon: Icon(Icons.call),
                color: Color.fromARGB(0xFF, 0x94, 0x34, 0x42)),
          ),
          ListTile(
            title: Text('Takako Mino'),
            subtitle: Text('Computer Organization & Architecture'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/takako.jpg'),
            ),
            trailing: IconButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('+233205227760');
                },
                icon: Icon(Icons.call),
                color: Color.fromARGB(0xFF, 0x94, 0x34, 0x42)),
          ),
          ListTile(
            title: Text('Umut Tosun'),
            subtitle: Text('Web Technologies'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/umut tosun.jpg'),
            ),
            trailing: IconButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('+233205227760');
                },
                icon: Icon(Icons.call),
                color: Color.fromARGB(0xFF, 0x94, 0x34, 0x42)),
          ),
          ListTile(
            title: Text('William Tannoh'),
            subtitle: Text('Advanced Database systems'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/william annoh.jpg'),
            ),
            trailing: IconButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('+233205227760');
                },
                icon: Icon(Icons.call),
                color: Color.fromARGB(0xFF, 0x94, 0x34, 0x42)),
          ),
        ]));
  }
}
