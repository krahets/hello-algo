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

/* 基於陣列實現的雜湊表 */
class ArrayHashMap {
  late List<Pair?> _buckets;

  ArrayHashMap() {
    // 初始化陣列，包含 100 個桶
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

  /* 獲取所有鍵值對 */
  List<Pair> pairSet() {
    List<Pair> pairSet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        pairSet.add(pair);
      }
    }
    return pairSet;
  }

  /* 獲取所有鍵 */
  List<int> keySet() {
    List<int> keySet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        keySet.add(pair.key);
      }
    }
    return keySet;
  }

  /* 獲取所有值 */
  List<String> values() {
    List<String> valueSet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        valueSet.add(pair.val);
      }
    }
    return valueSet;
  }

  /* 列印雜湊表 */
  void printHashMap() {
    for (final Pair kv in pairSet()) {
      print("${kv.key} -> ${kv.val}");
    }
  }
}

/* Driver Code */
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
  print("\n新增完成後，雜湊表為\nKey -> Value");
  map.printHashMap();

  /* 查詢操作 */
  // 向雜湊表中輸入鍵 key ，得到值 value
  String? name = map.get(15937);
  print("\n輸入學號 15937 ，查詢到姓名 $name");

  /* 刪除操作 */
  // 在雜湊表中刪除鍵值對 (key, value)
  map.remove(10583);
  print("\n刪除 10583 後，雜湊表為\nKey -> Value");
  map.printHashMap();

  /* 走訪雜湊表 */
  print("\n走訪鍵值對 Key->Value");
  map.pairSet().forEach((kv) => print("${kv.key} -> ${kv.val}"));
  print("\n單獨走訪鍵 Key");
  map.keySet().forEach((key) => print("$key"));
  print("\n單獨走訪值 Value");
  map.values().forEach((val) => print("$val"));
}
