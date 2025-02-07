import 'package:flutter/material.dart';
import 'package:parotia_task/core/widgets/custom_button.dart';
import 'package:parotia_task/features/visitor/property_details/presentation/widgets/calendar_widget.dart';
import 'package:parotia_task/features/visitor/property_details/presentation/widgets/calender_dates_section.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Wrap(
        alignment: WrapAlignment.start,
        children: [
          // Header
          buildBookingCalenderHeader(context),

          // Calendar
          const CalendarWidget(),

          // Reservation details
          const ReservationDatesSection(),

          // Save button
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .pop(true); // Close the entire bottom sheet
              },
              type: ButtonType.primary,
              text: 'Save',
            ),
          ),
        ],
      ),
    );
  }

  Padding buildBookingCalenderHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
          ),
          const Expanded(
            child: Text(
              'Sahary in al jahra, Kuwait',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
