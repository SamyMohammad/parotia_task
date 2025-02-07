import 'package:flutter/material.dart';
import 'package:parotia_task/core/di/dependency_injection.dart';
import 'package:parotia_task/core/firebase/firabase_crud_manager.dart';
import 'package:parotia_task/core/firebase/reservation_model.dart';
import 'package:parotia_task/core/widgets/custom_app_bar.dart';
import 'package:parotia_task/core/widgets/custom_button.dart';
import 'package:parotia_task/core/widgets/custom_text_field.dart';

class EditPriceScreen extends StatefulWidget {
  const EditPriceScreen({super.key});

  @override
  EditPriceScreenState createState() => EditPriceScreenState();
}

class EditPriceScreenState extends State<EditPriceScreen> {
  late TextEditingController _priceController;
  final _formKey = GlobalKey<FormState>();
  late ReservationModel _reservationModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Price',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'You can change it anytime.',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 32),
              // DateDisplay(label: 'Date', date: widget.reservation.date!),
              const SizedBox(height: 32),
              const Text(
                'Price per day',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _priceController,
                hintText: 'Enter your price',
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                suffixIcon: const Text('K.D'),
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Update Reservation',
                type: ButtonType.primary,
                onPressed: _updateReservation,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _priceController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _reservationModel =
          ModalRoute.of(context)!.settings.arguments as ReservationModel;
      _priceController =
          TextEditingController(text: _reservationModel.totalPrice.toString());
      setState(() {});
    });
  }

  void _updateReservation() {
    if (_formKey.currentState!.validate()) {
      // Verify that the reservation has a valid ID
      if (_reservationModel.id == null || _reservationModel.id!.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error: Reservation has no valid ID')),
        );
        return;
      }
      final updatedReservation = _reservationModel.copyWith(
        totalPrice: double.parse(_priceController.text),
      );

      getIt<FirestoreCrudManager<ReservationModel>>()
          .update(updatedReservation)
          .then((_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Reservation updated successfully')),
          );
          if (mounted) {
            Navigator.of(context).pop(updatedReservation);
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
}
