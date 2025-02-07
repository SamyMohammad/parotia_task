import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:parotia_task/core/widgets/custom_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(), // Push content to center
            // Success Animation
            Lottie.asset(
              'assets/jsons/success.json', // Add your Lottie animation file
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            // Title
            const Text(
              "Reservation Successfully",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            // Description
            const Text(
              "Elementum nisl accumsan, urna ipsum sapien pulvinar. "
              "Est, eget pellentesque fermentum sed massa sit id iaculis vitae.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const Spacer(),
            // Confirm Button
            CustomButton(
              type: ButtonType.primary,
              onPressed: () => Navigator.pop(context),
              text: 'Ok',
            ),
          ],
        ),
      ),
    );
  }
}
