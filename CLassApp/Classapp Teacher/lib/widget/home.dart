import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  List allData = [];
  var data = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.person),
          title: Text(data[index].toString()),
        );
      },
    );
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
      allData = querySnapshot.docs.map((doc) => doc.get('students')).toList();
      data = allData[0];
    });

    //querySnapshot.docs.map((doc) => doc.data()).toList();

    //for a specific field
    //final allData =
    //querySnapshot.docs.map((doc) => doc.get('fieldName')).toList();
  }

  Future<void> updateUser() {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Attendance');
    var name = "email";
    return users
        .doc('d2Glp6JPVsgFpcQjwdhh')
        .update({
          'students': FieldValue.arrayUnion([name])
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> deleteUser() {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Attendance');
    var name = "email";
    return users
        .doc('d2Glp6JPVsgFpcQjwdhh')
        .update({'students': FieldValue.delete()})
        .then((value) => print("User deleted"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
