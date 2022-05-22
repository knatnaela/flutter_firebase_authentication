import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "you are Home now",
            style: TextStyle(fontSize: 60),
          ),
          TextButton(
              onPressed: () async {
                await FirebaseAuth.instance
                    .signOut()
                    .whenComplete(() => Navigator.pop(context));
              },
              child: const Text("signout"))
        ],
      ),
    ));
  }
}
