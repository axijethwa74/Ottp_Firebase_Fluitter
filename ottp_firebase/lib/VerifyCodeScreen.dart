import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ottp_firebase/Utils.dart';

import 'DashScreen.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String verificationId;

  VerifyCodeScreen({super.key, required this.verificationId});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  bool loading = true;
  //TextEditing Field ...
  final verficationCodeController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Phone Verification")),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: verficationCodeController,
              decoration: InputDecoration(
                hintText: "6 Digit Code",
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });
                  final credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: verficationCodeController.text.toString());
                  try {
                    await auth.signInWithCredential(credential);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => DasgScreen())));
                  } catch (e) {
                    setState(() {
                      loading = true;
                    });
                    Utils().toastMessage(e.toString());
                  }
                },
                child: Text(
                  "Verify",
                )),
          ],
        ),
      ),
    );
  }
}
