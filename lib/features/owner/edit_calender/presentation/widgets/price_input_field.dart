import 'package:flutter/material.dart';
import 'package:parotia_task/core/widgets/custom_text_field.dart';

class PriceInputField extends StatelessWidget {
  final TextEditingController controller;

  const PriceInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: controller,
            hintText: 'Enter your price',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
          ),
        ),
        const SizedBox(width: 16),
        const Text('K.D', style: TextStyle(fontSize: 16, color: Colors.black)),
      ],
    );
  }
}
