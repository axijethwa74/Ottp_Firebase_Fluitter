import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ottp_firebase/VerifyCodeScreen.dart';
import 'Utils.dart';

class OttpFire extends StatefulWidget {
  const OttpFire({super.key});

  @override
  State<OttpFire> createState() => _OttpFireState();
}

class _OttpFireState extends State<OttpFire> {
  bool loading = true;
  //TextEditing Field ...
  final phoneNumberController = TextEditingController();
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
              controller: phoneNumberController,
              decoration: InputDecoration(
                hintText: "+1 321 28834 57",
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    loading = true;
                  });
                  auth.verifyPhoneNumber(
                      phoneNumber: phoneNumberController.text,
                      verificationCompleted: (_) {
                        setState(() {
                          loading = false;
                        });
                      },
                      verificationFailed: (e) {
                        setState(() {
                          loading = false;
                        });

                        Utils().toastMessage(e.toString());
                      },
                      codeSent: (String verificationId, int? token) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyCodeScreen(
                                      verificationId: verificationId,
                                    )));
                        setState(() {
                          loading = false;
                        });
                      },
                      codeAutoRetrievalTimeout: (e) {
                        Utils().toastMessage(e.toString());
                        setState(() {
                          loading = false;
                        });
                      });
                },
                child: Text(
                  "LOGIIN",
                )),
          ],
        ),
      ),
    );
  }
}
