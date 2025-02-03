import 'package:flutter/material.dart';
import 'package:parotia_task/core/widgets/custom_app_bar.dart';
import 'package:parotia_task/features/owner/edit_calender/presentation/widgets/block_dates_toggle.dart';
import 'package:parotia_task/features/owner/edit_calender/presentation/widgets/date_display.dart';
import 'package:parotia_task/features/owner/edit_calender/presentation/widgets/save_button.dart';


class EditAvailabilityScreen extends StatefulWidget {
  const EditAvailabilityScreen({super.key});

  @override
  State<EditAvailabilityScreen> createState() => _EditAvailabilityScreenState();
}

class _EditAvailabilityScreenState extends State<EditAvailabilityScreen> {
  final DateTime _startDate = DateTime(2022, 3, 16);
  final DateTime _endDate = DateTime(2022, 3, 18);
  bool _blockDates = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Edit Availability',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'You can change it anytime.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            DateDisplay(label: 'Date from', date: _startDate),
            const SizedBox(height: 32),
            DateDisplay(label: 'Date to', date: _endDate),
            const SizedBox(height: 32),
            BlockDatesToggle(
              isBlocked: _blockDates,
              onToggle: (value) {
                setState(() {
                  _blockDates = value;
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SaveButton(),
    );
  }
}
