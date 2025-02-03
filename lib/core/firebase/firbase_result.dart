import 'package:freezed_annotation/freezed_annotation.dart';

part 'firbase_result.freezed.dart';

@Freezed()
abstract class FirebaseResult<T> with _$FirebaseResult<T> {
  const factory FirebaseResult.failure(String failure) = Failure<T>;
  const factory FirebaseResult.success(T data) = Success<T>;
}
