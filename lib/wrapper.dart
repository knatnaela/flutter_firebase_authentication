import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebaseweblogin/home.dart';
import 'package:flutterfirebaseweblogin/login.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Transform.scale(
              scale: 0.2,
              child: const CircularProgressIndicator(
                strokeWidth: 10,
              ));
        }
        if (!snapshot.hasData) {
          return Login();
        }
        return const Home();
      },
    );

    ///incorrect way of implementation
    // return FirebaseAuth.instance.currentUser != null ? Home() : Login();
  }
}
