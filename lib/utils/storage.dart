import 'package:get_storage/get_storage.dart';

class StorageService {
  final _box = GetStorage();

  // Write data
  void write(String key, dynamic value) {
    _box.write(key, value);
  }

  // Read data
  T? read<T>(String key) {
    return _box.read<T>(key);
  }

  // Remove data
  void remove(String key) {
    _box.remove(key);
  }
}
