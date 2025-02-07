import 'package:faker/faker.dart' hide Image, Color;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parotia_task/core/constants/app_assets.dart';
import 'package:parotia_task/core/constants/app_sizes.dart';
import 'package:parotia_task/core/extensions/context_ext.dart';
import 'package:parotia_task/core/firebase/reservation_model.dart';
import 'package:parotia_task/core/router/routes.dart';
import 'package:parotia_task/core/theme/colors.dart';
import 'package:parotia_task/core/theme/text_styles.dart';

class RentalItem extends StatelessWidget {
  final ReservationModel reservation;
  const RentalItem({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    return GestureDetector(
      onTap: () {
        // open bottom sheet with details
        showModalBottomSheet(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.4,
          ),
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'My Rental',
                  style: TextStyles.font20BlackMedium,
                ),
                const Divider(
                  color: ColorsManager.lightGreyColor,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    isSemanticButton: true,
                    onPressed: () {
                      context.pushNamed(Routes.editCalenderScreen,
                          arguments: reservation);
                    },
                    child: Text(
                      'Edit Calender',
                      style:
                          TextStyles.font20BlackBold.copyWith(fontSize: 30.sp),
                    ),
                  ),
                ),
                const Divider(
                  color: ColorsManager.lightGreyColor,
                ),
              ],
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: Sizes.p16, left: Sizes.p16, right: Sizes.p16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: FadeInImage(
                    placeholder: const AssetImage(Assets.imagesHotel1),
                    image: const NetworkImage(
                        "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" ??
                            ''),
                    height: MediaQuery.sizeOf(context).height * 0.17,
                    fit: BoxFit.fitHeight,
                  )),
            ),
            gapW16,
            Expanded(
              flex: 5,
              child: Column(
                spacing: Sizes.p4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(reservation.title ?? '',
                      style: TextStyles.font20BlackBold),
                  Text(reservation.title ?? '',
                      style: TextStyles.font18lightGreyLight),
                  Row(
                    children: [
                      customTag("Per night", Colors.orange),
                      const SizedBox(width: 8),
                      customTag("Package", Colors.orange),
                    ],
                  ),
                  Text(reservation.description ?? '',
                      style: TextStyles.font17darkGreyLight),
                  Text('${reservation.numberOfGuests} Guests . Male only',
                      style: TextStyle(fontSize: 17.sp)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: Text(
        text,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}
