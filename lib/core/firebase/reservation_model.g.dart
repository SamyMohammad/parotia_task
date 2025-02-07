// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationModel _$ReservationModelFromJson(Map<String, dynamic> json) =>
    ReservationModel(
      id: json['id'] as String?,
      propertyId: json['propertyId'] as String?,
      imageUrl: json['imageUrl'] as String?,
      userId: json['userId'] as String?,
      disableFrom: json['disableFrom'] == null
          ? null
          : DateTime.parse(json['disableFrom'] as String),
      disableTo: json['disableTo'] == null
          ? null
          : DateTime.parse(json['disableTo'] as String),
      checkInDate: _dateTimeFromTimestamp(json['checkInDate']),
      checkOutDate: _dateTimeFromTimestamp(json['checkOutDate']),
      reservationType: json['reservationType'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      package: json['package'] as String?,
      numberOfGuests: (json['numberOfGuests'] as num?)?.toInt(),
      status: $enumDecodeNullable(_$ReservationStatusEnumMap, json['status']) ??
          ReservationStatus.pending,
      createdAt: _dateTimeFromTimestamp(json['createdAt']),
      updatedAt: _dateTimeFromTimestamp(json['updatedAt']),
    );

Map<String, dynamic> _$ReservationModelToJson(ReservationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'propertyId': instance.propertyId,
      'userId': instance.userId,
      'package': instance.package,
      'disableFrom': instance.disableFrom?.toIso8601String(),
      'disableTo': instance.disableTo?.toIso8601String(),
      'description': instance.description,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'checkInDate': _dateTimeToTimestamp(instance.checkInDate),
      'checkOutDate': _dateTimeToTimestamp(instance.checkOutDate),
      'reservationType': instance.reservationType,
      'totalPrice': instance.totalPrice,
      'numberOfGuests': instance.numberOfGuests,
      'status': _$ReservationStatusEnumMap[instance.status],
      'createdAt': _dateTimeToTimestamp(instance.createdAt),
      'updatedAt': _dateTimeToTimestamp(instance.updatedAt),
    };

const _$ReservationStatusEnumMap = {
  ReservationStatus.pending: 'pending',
  ReservationStatus.confirmed: 'confirmed',
  ReservationStatus.cancelled: 'cancelled',
  ReservationStatus.completed: 'completed',
};
