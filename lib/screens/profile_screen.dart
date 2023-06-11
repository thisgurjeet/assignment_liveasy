import 'package:assignment/widgets/box_container.dart';
import 'package:assignment/widgets/button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              height: 120,
            ),
            const Text(
              'Please select your profile',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.5),
            ),
            const SizedBox(
              height: 25.5,
            ),
            const BoxContainer(
              icon: Icons.house_outlined,
              text: 'Shipper',
            ),
            const SizedBox(height: 30),
            const BoxContainer(
              icon: Icons.local_shipping_outlined,
              text: 'Transporter',
            ),
            const SizedBox(
              height: 16,
            ),
            Button(onTap: () {}, height: 61, width: 365, text: 'CONTINUE'),
          ],
        ),
      ),
    );
  }
}
