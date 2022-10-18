import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerWithoutController extends StatefulWidget {
  const BarcodeScannerWithoutController({Key? key}) : super(key: key);

  @override
  _BarcodeScannerWithoutControllerState createState() =>
      _BarcodeScannerWithoutControllerState();
}

class _BarcodeScannerWithoutControllerState
    extends State<BarcodeScannerWithoutController>
    with SingleTickerProviderStateMixin {
  String? barcode;
  var data = [];
  List allData = [];

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as Email1;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            "Scan for Attendance",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: Colors.black,
        body: Builder(builder: (context) {
          return Stack(children: [
            MobileScanner(

                //fit: BoxFit.contain,
                // allowDuplicates: false,
                onDetect: (barcode, args) async {
              getData();

              setState(() {
                this.barcode = barcode.rawValue;
              });

              if (data[0].toString() == barcode.rawValue) {
                updateUser(email.email);
                AwesomeNotifications().createNotification(
                    content: NotificationContent(
                        id: 10,
                        channelKey: 'basic_channel',
                        title: 'ClassApp Student',
                        body: 'Attendance Recorded'));
                ElegantNotification.success(
                        title: Text("Attendance"),
                        description: Text("Your Attendance has been recorded"))
                    .show(context);
              }
            }),
            /*Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 60,
                color: Colors.black.withOpacity(0.4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 120,
                        height: 50,
                        child: FittedBox(
                          child: Text(
                            data[0].toString(),
                            overflow: TextOverflow.fade,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),*/
          ]);
        }));
  }

  @override
  void initState() {
    // TODO:implement initState
    super.initState();

    getData();
  }

  final _fireStore = FirebaseFirestore.instance;

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot =
        await _fireStore.collection('Attendance').get();

    // Get data from docs and convert map to List
    setState(() {
      allData = querySnapshot.docs.map((doc) => doc.get('uniqueId')).toList();
      data = allData[0];
    });
  }

  Future<void> updateUser(String text) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Attendance');
    var name = text;
    return users
        .doc('d2Glp6JPVsgFpcQjwdhh')
        .update({
          'students': FieldValue.arrayUnion([name])
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}

class Email1 {
  String email;

  Email1(this.email);
}
