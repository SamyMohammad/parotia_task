import 'package:flutter/material.dart';
import 'package:parotia_task/core/extensions/context_ext.dart';
import 'package:parotia_task/core/router/routes.dart';
import 'package:parotia_task/core/widgets/custom_button.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 30,
        children: [
          const Icon(Icons.business, size: 200, color: Colors.deepOrange),
          CustomButton(
              text: "Owner Flow",
              onPressed: () {
                context.pushNamed(Routes.myRentalsScreen);
              }),
          CustomButton(
              text: "Visitor Flow",
              onPressed: () {
                context.pushNamed(Routes.visitorHomeScreen);
              }),
        ],
      ),
    ));
  }
}
