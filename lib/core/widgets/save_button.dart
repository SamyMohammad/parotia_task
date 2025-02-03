import 'package:flutter/material.dart';
import 'package:parotia_task/core/widgets/custom_button.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          onPressed: () => Navigator.pop(context),
          type: ButtonType.primary,
          text: 'Save changes',
        ),
      ),
    );
  }
}
