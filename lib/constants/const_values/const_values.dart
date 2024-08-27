import 'package:sel_org/constants/const_values/app_const_values.dart';

class AppConstantValues extends AppConstants {
  static final AppConstantValues _instance = AppConstantValues._internal();

  factory AppConstantValues() {
    return _instance;
  }

  AppConstantValues._internal();
// Obtain shared preferences.

  @override
  String get orgId => "M07";

  @override
  String get customerId => "";

  @override
  String get customerName => "User 1";

  @override
  String get customerMobNum => "1234567890";

  @override
  String get userCoordinates => "12.9936, 80.2745";
}
