import 'package:flutter/material.dart';

import '../../../../../core/theme/text_styles.dart';
import '../widgets/rentals_list.dart';

class MyRentalsScreen extends StatelessWidget {
  const MyRentalsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text('My Rentals' , style: TextStyles.font20BlackMedium),
        ),
        body: const RentalsList()
      ),
    );
  }}
