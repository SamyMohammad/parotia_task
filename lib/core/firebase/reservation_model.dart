import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reservation_model.g.dart';

// Helper methods for DateTime conversion
DateTime _dateTimeFromTimestamp(dynamic timestamp) {
  if (timestamp == null) {
    // Provide a default date if timestamp is null
    return DateTime.now();
  }
  return (timestamp is Timestamp) ? timestamp.toDate() : timestamp;
}

Timestamp? _dateTimeToTimestamp(DateTime? dateTime) {
  return dateTime != null ? Timestamp.fromDate(dateTime) : null;
}

// // Helper methods for ReservationStatus conversion
// ReservationStatus _reservationStatusFromString(String status) {
//   return ReservationStatus.values.firstWhere(
//     (e) => e.name.toLowerCase() == status.toLowerCase(),
//     orElse: () => ReservationStatus.pending,
//   );
// }

// String _reservationStatusToString(ReservationStatus status) {
//   return status.name;
// }

@JsonSerializable(explicitToJson: true)
class ReservationModel {
  final String? id;
  final String? propertyId;
  final String? userId;
  final String? package;
  final DateTime? disableFrom;
  final DateTime? disableTo;
  final String? description;
  final String? title;
  final String? imageUrl;
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime? checkInDate;

  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime? checkOutDate;

  final String? reservationType;
  final double? totalPrice;
  final int? numberOfGuests;

  final ReservationStatus? status;

  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime? createdAt;

  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime? updatedAt;

  const ReservationModel({
    this.id,
    required this.propertyId,
    this.imageUrl,
    required this.userId,
    this.disableFrom,
    this.disableTo,
    required this.checkInDate,
    required this.checkOutDate,
    required this.reservationType,
    required this.totalPrice,
    required this.title,
    required this.description,
    required this.package,
    required this.numberOfGuests,
    this.status = ReservationStatus.pending,
    this.createdAt,
    this.updatedAt,
  });

  factory ReservationModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ReservationModel.fromJson({
      'id': doc.id,
      ...data,
    });
  }

  factory ReservationModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationModelFromJson(json);

  ReservationModel copyWith({
    String? id,
    String? propertyId,
    String? userId,
    DateTime? checkInDate,
    DateTime? checkOutDate,
    String? reservationType,
    double? totalPrice,
    int? numberOfGuests,
    ReservationStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? title,
    String? description,
    String? package,
    String? imageUrl,
    DateTime? disableFrom,
    DateTime? disableTo,
  }) {
    return ReservationModel(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      userId: userId ?? this.userId,
      checkInDate: checkInDate ?? this.checkInDate,
      checkOutDate: checkOutDate ?? this.checkOutDate,
      reservationType: reservationType ?? this.reservationType,
      totalPrice: totalPrice ?? this.totalPrice,
      numberOfGuests: numberOfGuests ?? this.numberOfGuests,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      title: title ?? this.title,
      description: description ?? this.description,
      package: package ?? this.package,
      imageUrl: imageUrl ?? this.imageUrl,
      disableFrom: disableFrom ?? this.disableFrom,
      disableTo: disableTo ?? this.disableTo,
    );
  }

  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('id');
    return json..removeWhere((key, value) => value == null);
  }

  Map<String, dynamic> toJson() => _$ReservationModelToJson(this);
}

enum ReservationStatus { pending, confirmed, cancelled, completed }
