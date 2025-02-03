import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parotia_task/features/owner/my_rentals/presentation/widgets/rental_item.dart';

class RentalsList extends StatelessWidget {
  const RentalsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const RentalItem();
      },
    );
  }
}
