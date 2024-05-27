import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/pages/mainpage.dart';

class Otppage extends StatefulWidget {
  const Otppage({super.key, required this.verificatioid});
  final String verificatioid;

  @override
  State<Otppage> createState() => _OtppageState();
}

class _OtppageState extends State<Otppage> {
  final otpcontroller = TextEditingController();

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    otpcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: otpcontroller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Enter otp",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(
                          verificationId: widget.verificatioid,
                          smsCode: otpcontroller.text);
                  FirebaseAuth.instance
                      .signInWithCredential(credential)
                      .then((value) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Mainpage();
                      },
                    ));
                  });
                } catch (ex) {
                  log(ex.toString());
                }
              },
              child: const Text("Verify"))
        ],
      ),
    );
  }
}
