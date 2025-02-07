import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parotia_task/core/firebase/reservation_model.dart';
import 'package:parotia_task/features/owner/my_rentals/presentation/widgets/rental_item.dart';

class RentalsList extends StatelessWidget {
  final List<ReservationModel> reservations;
  const RentalsList({super.key, required this.reservations});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      itemCount: reservations.length,
      itemBuilder: (context, index) {
        return RentalItem(reservation: reservations[index]);
      },
    );
  }
}
