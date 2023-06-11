import 'package:assignment/widgets/button.dart';
import 'package:assignment/widgets/language_picker.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'mobile_credential_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            // Icon
            const Icon(
              Ionicons.image_outline,
              size: 60,
            ),
            const SizedBox(
              height: 45,
            ),
            // Text
            const Text(
              'Please select your Language',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'You can change the language',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(
              height: 1,
            ),
            const Text(
              'at any time.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),

            // language selection
            const SizedBox(
              height: 25,
            ),
            const LanguagePicker(),
            // button
            const SizedBox(
              height: 17,
            ),
            Button(
              height: 55,
              width: 265,
              text: 'NEXT',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MobileCredentialScreen()),
                );
              },
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: -50,
                    bottom: -65,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.3, // Adjust the height as per your requirements
                      child: Image.asset(
                        'assets/images/wave.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
