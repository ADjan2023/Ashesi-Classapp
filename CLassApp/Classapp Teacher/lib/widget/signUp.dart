import 'package:class_attendance_app/models/SignUpModel.dart';
import 'package:class_attendance_app/widget/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUp(),
    );
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formGlobalKey = GlobalKey<FormState>();

  final emailController = new TextEditingController();
  final schIdController = new TextEditingController();
  final passwordController = new TextEditingController();
  final confirmPasswordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  var details = new Map();
  @override
  Widget build(BuildContext context) {
    final emailfield = Center(
        child: Container(
            margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.08,
                0,
                MediaQuery.of(context).size.width * 0.08,
                0),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              autofocus: false,
              controller: emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Pls enter your email";
                }
                String pattern = r'^[a-zA-Z]+\.[a-zA-Z]+@ashesi\.edu\.gh';
                if (!RegExp(pattern).hasMatch(value)) {
                  return "Enter a valid email";
                }
                return null;
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              onSaved: (value) {
                setState(() {
                  emailController.text = value!;
                });
              },
            )));
    final schId = Center(
        child: Container(
            margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.08,
                0,
                MediaQuery.of(context).size.width * 0.08,
                0),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              autofocus: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Pls enter your School Id";
                }
                String pattern = r'^.{8,8}$';
                if (!RegExp(pattern).hasMatch(value)) {
                  return "Pls enter a valid school Id";
                }
                return null;
              },
              controller: schIdController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.school),
                  hintText: "School Id",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              onSaved: (value) {
                setState(() {
                  schIdController.text = value!;
                });
              },
            )));

    final passwordfield = Center(
        child: Container(
            margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.08,
                0,
                MediaQuery.of(context).size.width * 0.08,
                0),
            child: TextFormField(
              autofocus: false,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              controller: passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Pls enter your Password";
                }
                String pattern =
                    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})';
                if (!RegExp(pattern).hasMatch(value)) {
                  return "Password should consists of 8 atleast characters,\nUpper Case, Lower Case,Number and\nSpecial characters";
                }
                return null;
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              onSaved: (value) {
                setState(() {
                  passwordController.text = value!;
                });
              },
            )));
    final conPass = Center(
        child: Container(
            margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.08,
                0,
                MediaQuery.of(context).size.width * 0.08,
                0),
            child: TextFormField(
              autofocus: false,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              controller: confirmPasswordController,
              validator: (value) {
                if (confirmPasswordController.text != passwordController.text) {
                  return "Password don't match";
                }
                return null;
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  hintText: "Confirm password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              onSaved: (value) {
                setState(() {
                  confirmPasswordController.text = value!;
                });
              },
            )));

    final space = SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );

    final image = Container(
        height: MediaQuery.of(context).size.height * 0.15,
        child: Image.asset('assets/logo.png'));
    final SubmitButton = ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
          Color.fromARGB(0xFF, 0x94, 0x34, 0x42),
        )),
        onPressed: () {
          SignUp(emailController.text, passwordController.text);
        },
        child: Text("SignUp"));

    final login = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Already have an account?"),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginApp()));
            },
            child: Text(
              "Login",
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ))
      ],
    );

    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              image,
              Form(
                  key: _formGlobalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      space,
                      emailfield,
                      space,
                      schId,
                      space,
                      passwordfield,
                      space,
                      conPass,
                      space,
                      SubmitButton,
                      space,
                      login
                    ],
                  ))
            ],
          ),
        ),
      ),
    ));
  }

  //Encrypts the user password

  //Pass the data into the user Model and ato the insert data model
  void SignUp(String email, String password) async {
    if (_formGlobalKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = _auth.currentUser;

    SignUpModel userModel = SignUpModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.school_id = schIdController.text;

    await firebaseFirestore
        .collection("user")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully");
    //push to home screen function
  }
}
