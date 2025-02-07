// import 'package:equatable/equatable.dart';
// import 'package:parotia_task/core/firebase/reservation_model.dart';

// class RentalEntity extends Equatable {
//   final String id;
//   final String propertyId;
//   final String userId;
//   final DateTime checkInDate;
//   final DateTime checkOutDate;
//   final String reservationType;
//   final double totalPrice;
//   final int numberOfGuests;
//   final ReservationStatus status;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final String title;
//   final String description;
//   final String package;
//   final String imageUrl;

//   const RentalEntity({
//     required this.id,
//     required this.propertyId,
//     required this.userId,
//     required this.checkInDate,
//     required this.checkOutDate,
//     required this.reservationType,
//     required this.totalPrice,
//     required this.numberOfGuests,
//     required this.title,
//     required this.description,
//     required this.package,
//     required this.imageUrl,
//     this.status = ReservationStatus.pending,
//     this.createdAt,
//     this.updatedAt,
//   });

//   // Factory constructor to convert from ReservationModel

//   @override
//   List<Object?> get props => [
//         id,
//         propertyId,
//         userId,
//         checkInDate,
//         checkOutDate,
//         reservationType,
//         totalPrice,
//         numberOfGuests,
//         status,
//         createdAt,
//         updatedAt,
//         title,
//         description,
//         package
//       ];
// }
