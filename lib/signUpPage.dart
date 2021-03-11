import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SignUpPage extends StatefulWidget {
  SignUpPage();

  @override
  State<StatefulWidget> createState() => _SignUpState();

}

class _SignUpState extends State<SignUpPage> {
  final _signUpKey = GlobalKey<FormState>();
  String userName;
  String emailAddress;
  String password;
  String role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: _signUpKey,
          child: Center(
              child: Neumorphic(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Neumorphic(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        style: NeumorphicStyle(shape: NeumorphicShape.concave),
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: Image(image: AssetImage('images/firebase.png')),
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
                      child: Neumorphic(
                        style: NeumorphicStyle(shape: NeumorphicShape.concave),
                        child: TextFormField(
                          validator: (value) {
                            if(value.isEmpty) {
                              return 'Please enter username';
                            }
                            return null;
                          },
                          onChanged: (value) => {
                            setState(() {
                              userName = value;
                            })
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(8, 4, 4, 4),
                              border: InputBorder.none,
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  color: Colors.black26)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: Neumorphic(
                        style: NeumorphicStyle(shape: NeumorphicShape.concave),
                        child: TextFormField(
                          validator: (value) {
                            if(value.isEmpty) {
                              return 'Please enter email address';
                            }
                            return null;
                          },
                          onChanged: (value) => {
                            setState(() {
                              emailAddress = value;
                            })
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(8, 4, 4, 4),
                              border: InputBorder.none,
                              hintText: 'Email Address',
                              hintStyle: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  color: Colors.black26)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: Neumorphic(
                        style: NeumorphicStyle(shape: NeumorphicShape.concave),
                        child: TextFormField(
                          validator: (value) {
                            if(value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                          onChanged: (value) => {
                            setState(() {
                              password = value;
                            })
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(8, 4, 4, 4),
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  color: Colors.black26)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: Neumorphic(
                        style: NeumorphicStyle(shape: NeumorphicShape.concave),
                        child: TextFormField(
                          validator: (value) {
                            if(value.isEmpty) {
                              return 'Please enter professional role';
                            }
                            return null;
                          },
                          onChanged: (value) => {
                            setState(() {
                              role = value;
                            })
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(8, 4, 4, 4),
                              border: InputBorder.none,
                              hintText: 'Professional Role',
                              hintStyle: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  color: Colors.black26)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Neumorphic(
                        style: NeumorphicStyle(shape: NeumorphicShape.concave),
                        margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                        child: NeumorphicButton(
                          child: Container(
                            child: Center(
                              child: NeumorphicText(
                                'Sign Up',
                                textStyle: NeumorphicTextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                ),
                                style: NeumorphicStyle(
                                    color: Colors.black26,
                                    shape: NeumorphicShape.concave),
                              ),
                            ),
                          ),
                          onPressed: () => _signUpClick(context),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  void _signUpClick(BuildContext context) {
    if(_signUpKey.currentState.validate()) {
      print("call 1");

      FirebaseFirestore.instance.collection("Employees").add({
        "Name" : userName,
        "Email" : emailAddress,
        "Password" : password,
        "Role" : role
      }).then((value) => {
        print(value.id)
      }).whenComplete(() => {
        Navigator.pop(context)
      });
    }
  }
}