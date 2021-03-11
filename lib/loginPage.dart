import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic_ui/homePage.dart';
import 'package:flutter_neumorphic_ui/signUpPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final _loginKey = GlobalKey<FormState>();
  String userName;
  String password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginKey,
        child: Container(
          child: Neumorphic(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Neumorphic (
                    style: NeumorphicStyle(shape: NeumorphicShape.concave),
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image(image: AssetImage('images/firebase.png')),
                    )),
                Padding (
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
                SizedBox(
                  width: double.infinity,
                  child: Neumorphic(
                    style: NeumorphicStyle(shape: NeumorphicShape.concave),
                    margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                    child: NeumorphicButton(
                      child: Container(
                        child: Center(
                          child: NeumorphicText(
                            'Login',
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
                      onPressed: () => _onLoginClick(context),
                    ),
                  ),
                ),
                Neumorphic(
                  style: NeumorphicStyle(
                      color: Colors.black26, shape: NeumorphicShape.concave),
                  margin: const EdgeInsets.fromLTRB(8, 70, 8, 8),
                  child: NeumorphicButton(
                    child: NeumorphicText(
                        'SignUp here',
                        textStyle: NeumorphicTextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                        ),
                        style: NeumorphicStyle(
                            color: Colors.black26, shape: NeumorphicShape.concave)),
                    onPressed: () => _navigateToSignUpPage(context),
                  ),
                )

              ],
            ),
          ),
        ),
    );
  }

  void _onLoginClick(BuildContext buildContext) {
    if(_loginKey.currentState.validate()) {
      // call firebase
      print("call 1");

      FirebaseFirestore.instance.collection("Employees").get().then((value) => {
        value.docs.forEach((element) {

          print(element.data()['Name']);
          if(element.data()['Name'] == userName && element.data()['Password'] == password) {
            print("call 2");
            print(element.data()['Name']);
            Navigator.push(buildContext, MaterialPageRoute(builder: (buildContext) => HomePage(userName)));
            return;
          }
          print(element.data());
        })
      });
    }
  }

  void _navigateToSignUpPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }
}
