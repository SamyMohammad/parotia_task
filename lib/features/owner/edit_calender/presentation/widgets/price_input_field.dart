import 'package:flutter/material.dart';
import 'package:parotia_task/core/widgets/custom_text_field.dart';

class PriceInputField extends StatelessWidget {
  final TextEditingController controller;

  const PriceInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CustomTextField(
            hintText: 'Enter your price',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
          ),
        ),
        SizedBox(width: 16),
        Text('K.D', style: TextStyle(fontSize: 16, color: Colors.black)),
      ],
    );
  }
}
