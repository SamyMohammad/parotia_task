import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:parotia_task/core/di/dependency_injection.dart';
import 'package:parotia_task/core/firebase/reservation_model.dart';
import 'package:parotia_task/features/visitor/visitor_home/presentation/cubit/visitor_home_cubit.dart';
import 'package:parotia_task/features/visitor/visitor_home/presentation/widgets/bottom_nav_bar.dart';
import 'package:parotia_task/features/visitor/visitor_home/presentation/widgets/category_tabs.dart';
import 'package:parotia_task/features/visitor/visitor_home/presentation/widgets/property_card.dart';
import 'package:parotia_task/features/visitor/visitor_home/presentation/widgets/search_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class VisitorHomeScreen extends StatelessWidget {
  const VisitorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const SearchBar(),
      ),
      body: Column(
        children: [
          const CategoryTabs(),
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: getIt<VisitorHomeCubit>().fetchAllReservations(),
            builder: (context, snapshot) {
              QuerySnapshot<Map<String, dynamic>>? result;
              List<ReservationModel>? reservations;
              if (snapshot.hasData) {
                result = snapshot.data!;
                reservations = result.docs
                    .map((e) => ReservationModel(
                          id: e.id,
                          description: e.data()['description'] ?? '',
                          title: e.data()['title'] ?? '',
                          imageUrl: e.data()['imageUrl'] ?? '',
                          package: e.data()['package'] ?? '',
                          propertyId: e.data()['propertyId'] ?? '',
                          userId: e.data()['userId'] ?? '',
                          checkInDate:
                              (e.data()['checkInDate'] as Timestamp).toDate(),
                          checkOutDate:
                              (e.data()['checkOutDate'] as Timestamp).toDate(),
                          reservationType: e.data()['reservationType'] ?? '',
                          totalPrice:
                              (e.data()['totalPrice'] as num?)?.toDouble() ??
                                  0.0,
                          numberOfGuests: e.data()['numberOfGuests'] ?? 0,
                          status: ReservationStatus.values.firstWhere(
                            (status) =>
                                status.name ==
                                (e.data()['status'] ?? 'pending'),
                          ),
                          createdAt:
                              (e.data()['createdAt'] as Timestamp?)?.toDate(),
                          updatedAt:
                              (e.data()['updatedAt'] as Timestamp?)?.toDate(),
                        ))
                    .toList();
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: reservations.length,
                    itemBuilder: (context, index) {
                      return PropertyCard(
                        reservation: reservations?[index],
                      );
                    },
                  ),
                );
              } else {
                return Expanded(
                  child: Skeletonizer(
                    enabled: snapshot.data?.docs.isEmpty ?? true,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return const PropertyCard(
                          reservation: null,
                        );
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
