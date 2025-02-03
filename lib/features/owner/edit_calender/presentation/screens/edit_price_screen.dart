import 'package:flutter/material.dart';
import 'package:parotia_task/core/widgets/custom_app_bar.dart';
import 'package:parotia_task/core/widgets/save_button.dart';
import 'package:parotia_task/features/owner/edit_calender/presentation/widgets/date_display.dart';
import 'package:parotia_task/features/owner/edit_calender/presentation/widgets/price_input_field.dart';

class EditPriceScreen extends StatefulWidget {
  const EditPriceScreen({super.key});

  @override
  State<EditPriceScreen> createState() => _EditPriceScreenState();
}

class _EditPriceScreenState extends State<EditPriceScreen> {
  final _priceController = TextEditingController(text: '60');
  final DateTime _selectedDate = DateTime(2022, 3, 12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Edit Price'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'You can change it anytime.',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 32),
            DateDisplay(label: 'Date', date: _selectedDate),
            const SizedBox(height: 32),
            const Text(
              'Price per day',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 8),
            PriceInputField(controller: _priceController),
          ],
        ),
      ),
      bottomNavigationBar: const SaveButton(),
    );
  }

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }
}
