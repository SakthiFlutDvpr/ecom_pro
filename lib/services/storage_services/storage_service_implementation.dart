// import 'package:sel_org/services/storage_services/storage_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class StorageServiceImpl implements StorageService {
//   @override
//   Future<dynamic> getValue({required String key}) async {
//     try {
//       return await SharedPreferences.getInstance()
//           .then((storage) => storage.get(key) ?? false);
//     } catch (error) {
//       throw Exception(error);
//     }
//   }

//   @override
//   Future<void> setValue({required String key, required dynamic value}) async {
//     try {
//       await SharedPreferences.getInstance().then((storage) {
//         value is bool
//             ? storage.setBool(key, value)
//             : value is String
//                 ? storage.setString(key, value)
//                 : value is int
//                     ? storage.setInt(key, value)
//                     : value is double
//                         ? storage.setDouble(key, value)
//                         /*if doesn't meet above condition values will be consider as StringList ['example','example 1']*/
//                         : storage.setStringList(key, value);
//       });
//     } catch (error) {
//       throw Exception(error);
//     }
//   }
// }
import 'package:flutter/widgets.dart';
import 'package:sel_org/services/storage_services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServiceImpl implements StorageService {
  @override
  Future<dynamic> getValue({required String key}) async {
    try {
      final storage = await SharedPreferences.getInstance();
      return storage.get(key) ?? false;
    } catch (error) {
      debugPrint("Error getting value: $error");
      throw Exception(error);
    }
  }

  @override
  Future<void> setValue({required String key, required dynamic value}) async {
    try {
      final storage = await SharedPreferences.getInstance();
      if (value is bool) {
        await storage.setBool(key, value);
      } else if (value is String) {
        await storage.setString(key, value);
      } else if (value is int) {
        await storage.setInt(key, value);
      } else if (value is double) {
        await storage.setDouble(key, value);
      } else if (value is List<String>) {
        await storage.setStringList(key, value);
      } else {
        throw Exception("Invalid value type");
      }
    } catch (error) {
      debugPrint("Error setting value: $error");
      throw Exception(error);
    }
  }
}
