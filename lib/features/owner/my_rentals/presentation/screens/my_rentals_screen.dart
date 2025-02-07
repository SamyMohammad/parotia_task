import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:parotia_task/core/di/dependency_injection.dart';
import 'package:parotia_task/features/owner/my_rentals/presentation/cubit/my_rentals_cubit.dart';

import '../../../../../core/firebase/firabase_crud_manager.dart';
import '../../../../../core/firebase/reservation_model.dart';
import '../../../../../core/theme/text_styles.dart';
import '../widgets/rentals_list.dart';

class MyRentalsScreen extends StatelessWidget {
  const MyRentalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('My Rentals', style: TextStyles.font20BlackMedium),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    final reservation = ReservationModel(
                      id: '', // Firestore will generate this
                      propertyId: "home",
                      userId: "",
                      disableFrom: DateTime.now().add(const Duration(days: 2)),
                      disableTo: DateTime.now().add(const Duration(days: 5)),

                      checkInDate: DateTime.now(),
                      checkOutDate: DateTime.now().add(const Duration(days: 1)),
                      reservationType: "",
                      totalPrice: double.parse(
                          faker.randomGenerator.integer(1000).toString()),
                      numberOfGuests: int.parse(
                          faker.randomGenerator.integer(10).toString()),
                      status: ReservationStatus.pending,
                      description: faker.lorem.sentence(),
                      title:
                          '${faker.address.city()} ${faker.address.streetName()}',
                      package: " ",
                      imageUrl: faker.image.loremPicsum(),
                    );
                    getIt<FirestoreCrudManager<ReservationModel>>()
                        .create(reservation);
                  },
                )
              ],
            ),
            body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: getIt<MyRentalsCubit>().fetchAllReservations(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final result = snapshot.data!;
                  return RentalsList(
                    reservations: result.docs
                        .map((e) => ReservationModel(
                              id: e.id,
                              description: e.data()['description'] ?? '',
                              title: e.data()['title'] ?? '',
                              imageUrl: e.data()['imageUrl'] ?? '',
                              package: e.data()['package'] ?? '',
                              propertyId: e.data()['propertyId'] ?? '',
                              userId: e.data()['userId'] ?? '',
                              checkInDate:
                                  (e.data()['checkInDate'] as Timestamp)
                                      .toDate(),
                              checkOutDate:
                                  (e.data()['checkOutDate'] as Timestamp)
                                      .toDate(),
                              reservationType:
                                  e.data()['reservationType'] ?? '',
                              totalPrice: (e.data()['totalPrice'] as num?)
                                      ?.toDouble() ??
                                  0.0,
                              numberOfGuests: e.data()['numberOfGuests'] ?? 0,
                              status: ReservationStatus.values.firstWhere(
                                (status) =>
                                    status.name ==
                                    (e.data()['status'] ?? 'pending'),
                              ),
                              createdAt: (e.data()['createdAt'] as Timestamp?)
                                  ?.toDate(),
                              updatedAt: (e.data()['updatedAt'] as Timestamp?)
                                  ?.toDate(),
                            ))
                        .toList(),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )));
  }
}
