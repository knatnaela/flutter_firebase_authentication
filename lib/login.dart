import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebaseweblogin/home.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(80),
      child: Column(
        children: [
          const Center(
            child: Text(
              "Login",
              style: TextStyle(fontSize: 60),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: email,
            decoration: const InputDecoration(hintText: "email"),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: password,
            decoration: InputDecoration(hintText: "password"),
          ),
          const SizedBox(height: 20),
          TextButton(
              onPressed: () async {
                await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: email.text, password: password.text)
                    .whenComplete(() => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home())));
              },
              child: const Text("Login"))
        ],
      ),
    ));
  }
}
