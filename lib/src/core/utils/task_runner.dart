import 'package:fpdart/fpdart.dart';

import '../errors/failure.dart';
import '../errors/error_handler.dart';
import '../services/internet_connection_service.dart';
import '../utils/typedefs.dart';
import '../utils/logger.dart';

/// Executes [action] and wraps the result in [Either].
/// If [requiresNetwork] is true and no connection is available, returns [NetworkFailure].
FutureEither<T> runTask<T>(
  Future<T> Function() action, {
  bool requiresNetwork = false,
}) async {
  if (requiresNetwork) {
    final hasNetwork = await InternetConnectionService().hasConnection();
    if (!hasNetwork) {
      AppLogger.warning('Network unavailable for task');
      return left(
        const NetworkFailure(
          'No internet connection. Please check your connection and try again.',
        ),
      );
    }
  }

  try {
    final result = await action();
    return right(result);
  } catch (error, stackTrace) {
    AppLogger.error('Task execution failed $error', [error, stackTrace]);
    final errorMessage = AppErrorHandler.format(error);
    return left(ServerFailure(errorMessage, error: error));
  }
}
