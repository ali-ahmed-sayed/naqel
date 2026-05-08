import 'dart:io';
import 'package:path_provider/path_provider.dart';

import '../utils/utils.dart';

class PathService {
  PathService._();
  static final PathService instance = PathService._();

  FutureEither<Directory> getDocumentsDirectory() async =>
      runTask(() => getApplicationDocumentsDirectory());

  FutureEither<Directory> getTempDirectory() async =>
      runTask(() => getTemporaryDirectory());

  FutureEither<Directory> getAppSupportDirectory() async =>
      runTask(() => getApplicationSupportDirectory());

  FutureEither<Directory> getAppLibraryDirectory() async =>
      runTask(() => getLibraryDirectory());

  FutureEither<Directory?> getExternalStorageDirectoryPath() async =>
      runTask(() => getExternalStorageDirectory());
}
