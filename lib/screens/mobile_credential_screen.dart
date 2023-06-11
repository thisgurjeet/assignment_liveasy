import 'package:assignment/screens/verification_screen.dart';
import 'package:assignment/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MobileCredentialScreen extends StatefulWidget {
  const MobileCredentialScreen({Key? key}) : super(key: key);

  @override
  State<MobileCredentialScreen> createState() => _MobileCredentialScreenState();
}

class _MobileCredentialScreenState extends State<MobileCredentialScreen> {
  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();
    final auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.close,
            color: Colors.black87,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Please enter your mobile number',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const SizedBox(
            height: 7,
          ),
          const Text(
            'You\'ll receive a 6 digit code',
            style: TextStyle(color: Colors.black54, fontSize: 16.5),
          ),
          const SizedBox(
            height: 1,
          ),
          const Text(
            'to verify next',
            style: TextStyle(color: Colors.black54, fontSize: 16.5),
          ),
          // mobile textfield
          const SizedBox(
            height: 32,
          ),
          SizedBox(
            height: 49,
            width: 340,
            child: Container(
              decoration: BoxDecoration(border: Border.all(width: 1.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 15,
                ),
                child: Row(children: [
                  const Image(
                      image: AssetImage('assets/images/india-flag-icon.png')),
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('-', style: TextStyle(color: Colors.black)),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.number,
                      controller: phoneController,
                      decoration: const InputDecoration(
                        hintText: 'Mobile Number',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
          // button
          const SizedBox(
            height: 15,
          ),
          Button(
            height: 55,
            width: 350,
            text: 'CONTINUE',
            onTap: () {
              auth.verifyPhoneNumber(
                  phoneNumber: phoneController.text,
                  verificationCompleted: (_) {},
                  verificationFailed: (e) {
                    e.toString();
                  },
                  codeSent: (String verificationId, int? token) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerificationScreen(
                                  verificationId: verificationId,
                                )));
                  },
                  codeAutoRetrievalTimeout: (e) {
                    e.toString();
                  });
            },
          )
        ]),
      ),
    );
  }
}
