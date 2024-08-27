import 'package:permission_handler/permission_handler.dart';

class RequestPermissionManager {
  /// Permission type to request permission from user
  PermissionType? _permissionType;

  /// callback when permission is denied by user
  Function()? _onPermissionDenied;

  /// callback when permission is granted by user
  Function()? _onPermissionGranted;

  /// callback when permission is permanently denied by user
  Function()? _onPermissionPermanentlyDenied;

  /// Check a [permission] and return a [Future] with the result
  RequestPermissionManager(PermissionType permissionType) {
    _permissionType = permissionType;
  }

  /// Request a [permission] , onPermissionDenied method to handle when permission is denied
  RequestPermissionManager onPermissionDenied(Function()? onPermissionDenied) {
    _onPermissionDenied = onPermissionDenied;
    return this;
  }

  ///  Request a [permission] ,onPermissionGranted method to handle when permission is granted
  RequestPermissionManager onPermissionGranted(
      Function()? onPermissionGranted) {
    _onPermissionGranted = onPermissionGranted;

    return this;
  }

  RequestPermissionManager onPermissionPermanentlyDenied(
      Function()? onPermissionPermanentlyDenied) {
    _onPermissionPermanentlyDenied = onPermissionPermanentlyDenied;

    return this;
  }

  void execute() async {
    Permission permission = _getPermissionFromType(_permissionType!);
    PermissionStatus status = await permission.request();

    if (status.isGranted) {
      if (_onPermissionGranted != null) {
        _onPermissionGranted!();
      }
    } else if (status.isDenied) {
      if (_onPermissionDenied != null) {
        _onPermissionDenied!();
      }
    } else if (status.isPermanentlyDenied) {
      if (_onPermissionPermanentlyDenied != null) {
        _onPermissionPermanentlyDenied!();
      }
    }
  }
}

/// get Permission from PermissionType enum value
Permission _getPermissionFromType(PermissionType permissionType) {
  switch (permissionType) {
    case PermissionType.camera:
      return Permission.camera;

    case PermissionType.storage:
      return Permission.storage;

    case PermissionType.writeContacts:
      return Permission.contacts;

    case PermissionType.readContacts:
      return Permission.contacts;

    case PermissionType.whenInUseLocation:
      return Permission.locationWhenInUse;

    case PermissionType.alwaysLocation:
      return Permission.locationAlways;

    case PermissionType.notification:
      return Permission.notification;

    default:
      throw Exception('Invalid permission type');
  }
}

enum PermissionType {
  // Camera
  camera,

  // Read External Storage (Android)
  storage,

  // Write External Storage (Android)
  manageExternalStorage,

  // recieve notifications
  notification,

  // Access Coarse Location (Android) / When In Use iOS
  accessCoarseLocation,

  // Access Fine Location (Android) / When In Use iOS
  accessFineLocation,

  // Access Fine Location (Android) / When In Use iOS
  whenInUseLocation,

  // Access Fine Location (Android) / Always Location iOS
  alwaysLocation,

  // Write contacts (Android) / Contacts iOS
  writeContacts,

  // Read contacts (Android) / Contacts iOS
  readContacts,
  // you can add permissions as much as you need
}
