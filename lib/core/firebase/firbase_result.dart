import 'package:freezed_annotation/freezed_annotation.dart';

part 'firbase_result.freezed.dart';

@Freezed()
abstract class DatabaseResult<T> with _$DatabaseResult<T> {
  const factory DatabaseResult.failure(String failure) = Failure<T>;
  const factory DatabaseResult.success(T data) = Success<T>;
}
