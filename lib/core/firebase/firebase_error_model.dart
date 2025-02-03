import 'package:json_annotation/json_annotation.dart';
part 'firebase_error_model.g.dart';

@JsonSerializable()
class FirebaseErrorModel {
  final String? message;
  final int? code;

  FirebaseErrorModel({
    required this.message,
    this.code,
  });

  factory FirebaseErrorModel.fromJson(Map<String, dynamic> json) =>
      _$FirebaseErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$FirebaseErrorModelToJson(this);
}