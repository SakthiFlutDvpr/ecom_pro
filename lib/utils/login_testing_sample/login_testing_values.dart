import 'package:sel_org/constants/const_values/const_values.dart';
import 'package:sel_org/services/storage_services/storage_service_implementation.dart';

class LoadConstantValues {
  Future getInitialLoginValues() async {
    // await StorageServiceImpl()
    //     .setValue(key: AppConstantValues().customerId, value: "");
    await StorageServiceImpl()
        .setValue(key: AppConstantValues().customerName, value: "User 1");
  }
}
