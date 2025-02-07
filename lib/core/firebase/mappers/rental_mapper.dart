import 'package:parotia_task/core/firebase/firbase_result.dart';

class RentalMapper {
  // static RentalEntity fromModel(ReservationModel model) {
  //   return RentalEntity(
  //     id: model.id ?? '',
  //     imageUrl: "",
  //     propertyId: model.propertyId ?? '',
  //     userId: model.userId ?? '',
  //     checkInDate: model.checkInDate ?? DateTime.now(),
  //     checkOutDate: model.checkOutDate ?? DateTime.now(),
  //     reservationType: model.reservationType ?? '',
  //     totalPrice: model.totalPrice ?? 0.0,
  //     numberOfGuests: model.numberOfGuests ?? 0,
  //     status: model.status ?? ReservationStatus.pending,
  //     createdAt: model.createdAt,
  //     updatedAt: model.updatedAt,
  //     title: model.title ?? '',
  //     description: model.description ?? '',
  //     package: model.package ?? '',
  //     // images: model.images ?? const [],
  //   );
  // }

  // // Optional: Add a method to map lists
  // static List<RentalEntity> fromModelList(List<ReservationModel> models) {
  //   return models.map((model) => fromModel(model)).toList();
  // }

  // static ReservationModel toModel(RentalEntity entity) {
  //   return ReservationModel(
  //     id: entity.id,
  //     propertyId: entity.propertyId,
  //     imageUrl: entity.imageUrl,
  //     title: entity.title,
  //     description: entity.description,
  //     package: entity.package,
  //     userId: entity.userId,
  //     checkInDate: entity.checkInDate,
  //     checkOutDate: entity.checkOutDate,
  //     reservationType: entity.reservationType,
  //     totalPrice: entity.totalPrice,
  //     numberOfGuests: entity.numberOfGuests,
  //     status: entity.status,
  //     createdAt: entity.createdAt,
  //     updatedAt: entity.updatedAt,
  //   );
  // }
}

extension DatabaseResultMapper<T> on DatabaseResult<T> {
  DatabaseResult<R> mapData<R>(R Function(T data) mapper) {
    return when(
      success: (data) => DatabaseResult.success(mapper(data)),
      failure: (error) => DatabaseResult.failure(error),
    );
  }
}
