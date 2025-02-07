import 'package:flutter/material.dart';
import 'package:parotia_task/core/di/dependency_injection.dart';
import 'package:parotia_task/core/firebase/reservation_model.dart';
import 'package:parotia_task/core/widgets/custom_button.dart';

import '../../../../../core/firebase/firabase_crud_manager.dart';

class SaveButton extends StatefulWidget {
  final ReservationModel? reservationModel;
  final DateTime? disableTo;
  final DateTime? disableFrom;
  const SaveButton(
      {super.key,
      required this.reservationModel,
      this.disableTo,
      this.disableFrom});

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          onPressed: () => _updateReservation(),
          type: ButtonType.primary,
          text: 'Save changes',
        ),
      ),
    );
  }

  void _updateReservation() {
    // Verify that the reservation has a valid ID
    if (widget.reservationModel?.id == null ||
        widget.reservationModel?.id?.isEmpty == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error: Reservation has no valid ID')),
      );
      return;
    }
    final updatedReservation = widget.reservationModel?.copyWith(
      disableTo: widget.disableTo,
      disableFrom: widget.disableFrom,
    );

    getIt<FirestoreCrudManager<ReservationModel>>()
        .update(updatedReservation!)
        .then((_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Reservation updated successfully')),
        );
        if (mounted) {
          Navigator.of(context).pop(
            updatedReservation,
          );
        }
      }
    }).onError((error, stackTrace) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating reservation: $error')),
        );
        print(error);
      }
    });
  }
}
