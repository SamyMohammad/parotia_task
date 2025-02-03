import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parotia_task/core/extensions/context_ext.dart';
import 'package:parotia_task/core/router/routes.dart';
import 'package:parotia_task/core/theme/colors.dart';
import 'package:parotia_task/core/theme/text_styles.dart';
import 'package:parotia_task/core/widgets/custom_app_bar.dart';

import '../widgets/calender_widget.dart';

class EditCalenderScreen extends StatelessWidget {
  const EditCalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Edit Calender',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
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
                          'Calender',
                          style: TextStyles.font20BlackMedium,
                        ),
                        const Divider(
                          color: ColorsManager.lightGreyColor,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            isSemanticButton: true,
                            onPressed: () => context
                                .pushNamed(Routes.editAvailabilityScreen),
                            child: Text(
                              'Edit Availability',
                              style: TextStyles.font20BlackMedium
                                  .copyWith(fontSize: 25.sp),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            isSemanticButton: true,
                            onPressed: () =>
                                context.pushNamed(Routes.editPriceScreen),
                            child: Text(
                              'Edit Price',
                              style: TextStyles.font20BlackMedium
                                  .copyWith(fontSize: 25.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const Text(
                'Calender',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              "You can change it anytime.",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: ColorsManager.lightGreyColor),
            ),
            const Expanded(child: CalenderWidget()),
          ],
        ),
      ),
    );
  }
}
