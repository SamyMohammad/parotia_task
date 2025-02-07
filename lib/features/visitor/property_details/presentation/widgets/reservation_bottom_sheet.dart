import 'package:flutter/material.dart';
import 'package:parotia_task/core/widgets/custom_button.dart';
import 'package:parotia_task/features/visitor/property_details/presentation/widgets/booking_calender_bottom_sheet.dart';

class ModalNavigator extends StatefulWidget {
  const ModalNavigator({super.key});

  @override
  State<ModalNavigator> createState() => _ModalNavigatorState();
}

// Modal that has its own navigation stack

class ReservationBottomSheet extends StatefulWidget {
  const ReservationBottomSheet({super.key});

  @override
  ReservationBottomSheetState createState() => ReservationBottomSheetState();
}

class ReservationBottomSheetState extends State<ReservationBottomSheet> {
  String selectedOption = "Per day"; // الخيار الافتراضي

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 32),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // زر الإغلاق
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
            ),
            const SizedBox(height: 8),

            // عنوان الـ Bottom Sheet
            const Text(
              "Select reservation type",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // قائمة الاختيارات
            _buildOption("Per day"),
            _buildOption("Package (One week)"),
            _buildOption("Package (Weekend)"),
            _buildOption("Package (Week days)"),

            const SizedBox(height: 20),

            // أزرار التأكيد والعودة
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Back",
                        style: TextStyle(color: Colors.orange, fontSize: 16)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    type: ButtonType.primary,
                    text: "Confirm",
                    onPressed: () {
                      // تنفيذ الحجز بناءً على الاختيار
                      // showCupertinoModalBottomSheet(
                      //   expand: false,
                      //   bounce: true,
                      //   topRadius: const Radius.circular(30),
                      //   context: context,
                      //   backgroundColor: Colors.transparent,
                      //   builder: (context) =>
                      //       const ReservationBottomSheet(),
                      // );
                      // pushRoute(context, modalContext)
                      Navigator.of(context).pushNamed('/second');

                      // Navigator.pop(context, selectedOption);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String option) {
    bool isSelected = selectedOption == option;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = option;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepOrange : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          option,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class _ModalNavigatorObserver extends NavigatorObserver {
  final Function(String) onPageChanged;

  _ModalNavigatorObserver({required this.onPageChanged});

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute != null) {
      onPageChanged(previousRoute.settings.name ?? '/');
    }
  }
}

class _ModalNavigatorState extends State<ModalNavigator>
    with TickerProviderStateMixin {
  double _bottomSheetHeight = 500; // Default height
  final Map<String, double> _pageHeights = {
    '/': 500, // Height for ReservationBottomSheet
    '/second': 700, // Height for BookingScreen
  };

  late NavigatorObserver _observer;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: _bottomSheetHeight, // Dynamic height
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Navigator(
          observers: [_observer], // Attach observer
          onGenerateRoute: (settings) {
            _updateHeight(settings.name ?? '/');

            Widget page;
            if (settings.name == '/second') {
              page = const BookingScreen();
            } else {
              page = const ReservationBottomSheet();
            }
            return MaterialPageRoute(builder: (_) => page);
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _observer = _ModalNavigatorObserver(onPageChanged: _updateHeight);
  }

  void _updateHeight(String routeName) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _bottomSheetHeight = _pageHeights[routeName] ?? 500;
        });
      }
    });
  }
}
