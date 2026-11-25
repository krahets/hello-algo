/**
 * File: array_hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 鍵值對 */
class Pair {
  int key;
  String val;
  Pair(this.key, this.val);
}

/* 以陣列實作的雜湊表 */
class ArrayHashMap {
  late List<Pair?> _buckets;

  ArrayHashMap() {
    // 初始化包含 100 個桶的陣列
    _buckets = List.filled(100, null);
  }

  /* 雜湊函式 */
  int _hashFunc(int key) {
    final int index = key % 100;
    return index;
  }

  /* 查詢操作 */
  String? get(int key) {
    final int index = _hashFunc(key);
    final Pair? pair = _buckets[index];
    if (pair == null) {
      return null;
    }
    return pair.val;
  }

  /* 新增操作 */
  void put(int key, String val) {
    final Pair pair = Pair(key, val);
    final int index = _hashFunc(key);
    _buckets[index] = pair;
  }

  /* 刪除操作 */
  void remove(int key) {
    final int index = _hashFunc(key);
    _buckets[index] = null;
  }

  /* 取得所有鍵值對 */
  List<Pair> pairSet() {
    List<Pair> pairSet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        pairSet.add(pair);
      }
    }
    return pairSet;
  }

  /* 取得所有鍵 */
  List<int> keySet() {
    List<int> keySet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        keySet.add(pair.key);
      }
    }
    return keySet;
  }

  /* 取得所有值 */
  List<String> values() {
    List<String> valueSet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        valueSet.add(pair.val);
      }
    }
    return valueSet;
  }

  /* 印出雜湊表 */
  void printHashMap() {
    for (final Pair kv in pairSet()) {
      print("${kv.key} -> ${kv.val}");
    }
  }
}

/* 主程式 */
void main() {
  /* 初始化雜湊表 */
  final ArrayHashMap map = ArrayHashMap();

  /* 新增操作 */
  // 在雜湊表中新增鍵值對 (key, value)
  map.put(12836, "小哈");
  map.put(15937, "小囉");
  map.put(16750, "小算");
  map.put(13276, "小法");
  map.put(10583, "小鴨");
  print("\n新增後的雜湊表\nKey -> Value");
  map.printHashMap();

  /* 查詢操作 */
  // 輸入鍵 key，從雜湊表取得對應的值 value
  String? name = map.get(15937);
  print("\n輸入學號 15937，查得姓名 $name");

  /* 刪除操作 */
  // 從雜湊表刪除鍵值對 (key, value)
  map.remove(10583);
  print("\n刪除 10583 後的雜湊表\nKey -> Value");
  map.printHashMap();

  /* 走訪雜湊表 */
  print("\n走訪鍵值對 Key->Value");
  map.pairSet().forEach((kv) => print("${kv.key} -> ${kv.val}"));
  print("\n只走訪鍵 Key");
  map.keySet().forEach((key) => print("$key"));
  print("\n只走訪值 Value");
  map.values().forEach((val) => print("$val"));
}
