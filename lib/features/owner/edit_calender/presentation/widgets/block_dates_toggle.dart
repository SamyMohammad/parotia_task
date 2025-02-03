import 'package:flutter/material.dart';

class BlockDatesToggle extends StatelessWidget {
  final bool isBlocked;
  final ValueChanged<bool> onToggle;

  const BlockDatesToggle(
      {super.key, required this.isBlocked, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Block Dates',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        const Spacer(),
        Switch(value: isBlocked, onChanged: onToggle),
      ],
    );
  }
}
