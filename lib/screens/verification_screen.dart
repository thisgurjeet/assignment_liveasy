import 'package:assignment/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:assignment/widgets/button.dart';

class VerificationScreen extends StatefulWidget {
  final String verificationId;
  const VerificationScreen({
    Key? key,
    required this.verificationId,
  }) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    Color myColor = const Color(0xFF93D2F3);
    final TextEditingController codeController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Verify Phone',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 22.5),
            ),
            const SizedBox(
              height: 9,
            ),
            const Text(
              'Code is sent to 8802930371',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 17.3,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: PinCodeTextField(
                  keyboardType: TextInputType.number,
                  appContext: context,
                  onChanged: (value) {
                    value = codeController.text;
                  },
                  controller: codeController,
                  length: 6,
                  boxShadows: [
                    BoxShadow(
                      color: myColor,
                    ),
                  ],
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldHeight: 62,
                    fieldWidth: 55,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    activeColor: myColor,
                    inactiveColor: myColor,
                    selectedColor: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn\'t receive the code?',
                  style: TextStyle(fontSize: 17, color: Colors.black87),
                ),
                Text(
                  ' Request Again',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            Button(
                onTap: () async {
                  final credentials = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: codeController.text.toString());

                  try {
                    await FirebaseAuth.instance
                        .signInWithCredential(credentials);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreen()));
                  } catch (e) {
                    e.toString();
                  }
                },
                height: 60,
                width: 370,
                text: 'VERIFY AND CONTINUE')
          ],
        ),
      ),
    );
  }
}
