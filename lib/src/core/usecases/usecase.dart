import 'package:fpdart/fpdart.dart';
import '../errors/failure.dart';

/// Base class for all use cases.
/// [Type] is the return type of the use case.
/// [Params] is the type of the parameters passed to the use case.
abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}

/// Class to be used when no parameters are needed for a use case.
class NoParams {}
