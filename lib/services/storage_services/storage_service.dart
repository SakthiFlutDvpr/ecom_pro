abstract class StorageService {
  Future<dynamic> getValue({required String key});

  Future<void> setValue({required String key, required dynamic value});
}
