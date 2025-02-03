// Failure Classes
abstract class Failure {
  final String message;
  const Failure({required this.message});
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({required super.message});
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({required super.message});
}