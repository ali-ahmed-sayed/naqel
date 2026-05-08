import 'package:permission_handler/permission_handler.dart';

import '../utils/utils.dart';

class PermissionService {
  PermissionService._();
  static final PermissionService instance = PermissionService._();

  FutureEither<PermissionStatus> checkStatus(Permission permission) async {
    return runTask(() => permission.status);
  }

  FutureEither<PermissionStatus> request(Permission permission) async {
    return runTask(() => permission.request());
  }

  FutureEither<Map<Permission, PermissionStatus>> requestMultiple(
    List<Permission> permissions,
  ) async {
    return runTask(() => permissions.request());
  }

  FutureEither<bool> openSettings() async {
    return runTask(() => openAppSettings());
  }
}
