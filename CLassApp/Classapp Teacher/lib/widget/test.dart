import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRPage extends StatefulWidget {
  const GenerateQRPage({Key? key}) : super(key: key);

  @override
  _GenerateQRPageState createState() => _GenerateQRPageState();
}

class _GenerateQRPageState extends State<GenerateQRPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                data: controller.text,
                size: 300,
                embeddedImage: AssetImage('images/logo.png'),
                embeddedImageStyle: QrEmbeddedImageStyle(size: Size(80, 80)),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Unique code'),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(
                        0xFF, 0x94, 0x34, 0x42), // Background color
                  ),
                  onPressed: () {
                    updateUser();
                    ElegantNotification.success(
                            title: Text("Added"),
                            description: Text("Unique code has been added"))
                        .show(context);
                    setState(() {});
                  },
                  child: Text('Add unique code')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(
                        0xFF, 0x94, 0x34, 0x42), // Background color
                  ),
                  onPressed: () {
                    Widget cancelButton = FlatButton(
                      child: Text("No"),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');
                        /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyApp()));*/
                      },
                    );
                    Widget continueButton = FlatButton(
                      child: Text("Yes"),
                      onPressed: () {
                        deleteUser();
                        deleteCode();
                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');
                        ElegantNotification.success(
                                title: Text("Delete"),
                                description: Text(
                                    "All Students have been deleted successfully"))
                            .show(context);
                      },
                    );
                    // set up the AlertDialog
                    AlertDialog alert = AlertDialog(
                      title: Text("Alert"),
                      content: Text("Do you want to delete all students"),
                      actions: [
                        cancelButton,
                        continueButton,
                      ],
                    );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  },
                  child: Text('Delete all Students')),
            ],
          ),
        ),
      ),
    );
  }

  final _fireStore = FirebaseFirestore.instance;

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot =
        await _fireStore.collection('Attendance').get();

    // Get data from docs and convert map to List

    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);

    //querySnapshot.docs.map((doc) => doc.data()).toList();

    //for a specific field
    //final allData =
    //querySnapshot.docs.map((doc) => doc.get('fieldName')).toList();
  }

  Future<void> updateUser() {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Attendance');
    var name = controller.text;
    return users
        .doc('d2Glp6JPVsgFpcQjwdhh')
        .update({
          'uniqueId': FieldValue.arrayUnion([name])
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> deleteUser() {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Attendance');
    var name = "Bagshaw";
    return users
        .doc('d2Glp6JPVsgFpcQjwdhh')
        .update({'students': FieldValue.delete()})
        .then((value) => print("User deleted"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> deleteCode() {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Attendance');

    return users
        .doc('d2Glp6JPVsgFpcQjwdhh')
        .update({'uniqueId': FieldValue.delete()})
        .then((value) => print("User deleted"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
