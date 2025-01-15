import 'package:logger/logger.dart';

class AppUtils {
  static final Logger _logger = Logger();
  static void logError(dynamic error, StackTrace stackTrace) {
    _logger.e('Error: $error', stackTrace: stackTrace);
  }

  static void logInfo(dynamic info) {
    _logger.i('Info: $info');
  }

  static void logWarning(dynamic warning) {
    _logger.w('Warning: $warning');
  }
}
