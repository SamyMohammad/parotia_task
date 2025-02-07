import 'package:flutter/material.dart';
import 'package:parotia_task/core/firebase/reservation_model.dart';
import 'package:parotia_task/core/widgets/custom_app_bar.dart';
import 'package:parotia_task/features/owner/edit_calender/presentation/widgets/block_dates_toggle.dart';
import 'package:parotia_task/features/owner/edit_calender/presentation/widgets/date_display.dart';
import 'package:parotia_task/features/owner/edit_calender/presentation/widgets/save_button.dart';

class EditAvailabilityScreen extends StatefulWidget {
  const EditAvailabilityScreen({
    super.key,
  });

  @override
  State<EditAvailabilityScreen> createState() => _EditAvailabilityScreenState();
}

class _EditAvailabilityScreenState extends State<EditAvailabilityScreen> {
  late DateTime _disableFrom;
  late DateTime _disableTo;
  bool _blockDates = false;
  ReservationModel? reservationModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Availability',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Block Dates',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            BlockDatesToggle(
              isBlocked: _blockDates,
              onToggle: (value) {
                setState(() {
                  _blockDates = value;
                  // Reset dates if toggled off
                  if (!_blockDates) {
                    _disableFrom = DateTime.now();
                    _disableTo = DateTime.now().add(const Duration(days: 1));
                  }
                });
              },
            ),
            const SizedBox(height: 32),
            if (_blockDates) ...[
              InkWell(
                onTap: _selectDisableFromDate,
                child: DateDisplay(label: 'Date from', date: _disableFrom),
              ),
              const SizedBox(height: 32),
              InkWell(
                onTap: _selectDisableToDate,
                child: DateDisplay(label: 'Date to', date: _disableTo),
              ),
              const SizedBox(height: 32),
            ],
          ],
        ),
      ),
      bottomNavigationBar: SaveButton(
        reservationModel: reservationModel,
        disableFrom: _blockDates ? _disableFrom : null,
        disableTo: _blockDates ? _disableTo : null,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Initialize with existing dates or current dates
    WidgetsBinding.instance.addPostFrameCallback((_) {
      reservationModel =
          ModalRoute.of(context)!.settings.arguments as ReservationModel;
    });
    _disableFrom = reservationModel?.disableFrom ?? DateTime.now();
    _disableTo = reservationModel?.disableTo ??
        DateTime.now().add(const Duration(days: 1));
    _blockDates = reservationModel?.disableFrom != null;
  }

  Future<void> _selectDisableFromDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _disableFrom,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));

    if (picked != null && picked != _disableFrom) {
      setState(() {
        _disableFrom = picked;
        // Ensure disableTo is not before disableFrom
        if (_disableTo.isBefore(_disableFrom)) {
          _disableTo = _disableFrom.add(const Duration(days: 1));
        }
        _blockDates = true;
      });
    }
  }

  Future<void> _selectDisableToDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _disableTo,
        firstDate: _disableFrom,
        lastDate: DateTime(2100));

    if (picked != null && picked != _disableTo) {
      setState(() {
        _disableTo = picked;
      });
    }
  }
}
