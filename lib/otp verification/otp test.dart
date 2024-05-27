import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/otp%20verification/otpscreen.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    final phonecontroller = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: phonecontroller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Enter your mobile number",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: phonecontroller.text,
                  verificationCompleted: (credential) {},
                  verificationFailed: (ex) {},
                  codeSent: (verificationId, forResendingToken) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Otppage(
                            verificatioid: verificationId,
                          ),
                        ));
                  },
                  codeAutoRetrievalTimeout: (verificationId) {},
                );
              },
              child: Text("Verify now"))
        ],
      ),
    );
  }
}
