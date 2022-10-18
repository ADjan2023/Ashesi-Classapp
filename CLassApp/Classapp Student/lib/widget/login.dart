import 'package:classappstudent/widget/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../home.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  final _formGlobalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;
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
              controller: emailController,
              textInputAction: TextInputAction.done,
              autofocus: false,
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
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Pls enter your Password";
                }
                String pattern =
                    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})';
                if (!RegExp(pattern).hasMatch(value)) {
                  return "Enter your password";
                }
                return null;
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  hintText: "password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              onSaved: (value) {
                setState(() {
                  passwordController.text = value!;
                });
              },
            )));

    final space = SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );

    final image = Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Image.asset('assets/images/logo.png'));
    final SubmitButton = ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
          Color.fromARGB(0xFF, 0x94, 0x34, 0x42),
        )),
        onPressed: () {
          Login(emailController.text, passwordController.text);
        },
        child: Text("Login"));

    final signUp = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Don't have an account?"),
        TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateUser()));
            },
            child: Text(
              "Create One",
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
                      passwordfield,
                      space,
                      SubmitButton,
                      space,
                      signUp
                    ],
                  ))
            ],
          ),
        ),
      ),
    ));
  }

  void Login(String email, String password) async {
    if (_formGlobalKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Succesful"),
                Navigator.pushNamed(context, '/second',
                    arguments: Email(emailController.text))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
