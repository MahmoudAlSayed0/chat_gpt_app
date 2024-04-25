import 'package:hive_flutter/hive_flutter.dart';

class LocalDataSource {
  LocalDataSource._(this.hiveBox);
  static LocalDataSource? i;

  final Box hiveBox;
  static Future<void> init() async {
    i ??= LocalDataSource._(await Hive.openBox('cache'));
  }

  static Future<void> saveChat(String id, String content) async {
    await i!.hiveBox.put(id, content);
  }

  static String? getChat(String id) {
    return i!.hiveBox.get(id);
  }

  static List<String> getIDs() {
    return i!.hiveBox.keys.toList().cast<String>();
  }

  static Future<void> deleteChat(String id) async {
    await i!.hiveBox.delete(id);
  }

  static Future<void> clearCache() async {
    await i!.hiveBox.clear();
  }
}
