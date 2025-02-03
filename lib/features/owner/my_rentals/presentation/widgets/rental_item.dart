import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parotia_task/core/constants/app_assets.dart';
import 'package:parotia_task/core/constants/app_sizes.dart';
import 'package:parotia_task/core/extensions/context_ext.dart';
import 'package:parotia_task/core/router/routes.dart';
import 'package:parotia_task/core/theme/colors.dart';
import 'package:parotia_task/core/theme/text_styles.dart';

class RentalItem extends StatelessWidget {
  const RentalItem({super.key});

  @override
  Widget build(BuildContext context) {
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
                      context.pushNamed(Routes.editCalenderScreen);
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
                  child: Image.asset(
                    height: MediaQuery.sizeOf(context).height * 0.17,
                    Assets.imagesHotel2,
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
                  Text('Sahary Apartment', style: TextStyles.font20BlackBold),
                  Text('Al Jahra, Kuwait',
                      style: TextStyles.font18lightGreyLight),
                  Row(
                    children: [
                      customTag("Per night", Colors.orange),
                      const SizedBox(width: 8),
                      customTag("Package", Colors.orange),
                    ],
                  ),
                  Text(
                      'Lorem Ipsum is simply dummy text of the printing and...',
                      style: TextStyles.font17darkGreyLight),
                  Text('8 Guests . Male only',
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
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color),
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
