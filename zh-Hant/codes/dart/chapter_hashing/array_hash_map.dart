/**
 * File: array_hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 键值对 */
class Pair {
  int key;
  String val;
  Pair(this.key, this.val);
}

/* 基于数组实现的哈希表 */
class ArrayHashMap {
  late List<Pair?> _buckets;

  ArrayHashMap() {
    // 初始化数组，包含 100 个桶
    _buckets = List.filled(100, null);
  }

  /* 哈希函数 */
  int _hashFunc(int key) {
    final int index = key % 100;
    return index;
  }

  /* 查询操作 */
  String? get(int key) {
    final int index = _hashFunc(key);
    final Pair? pair = _buckets[index];
    if (pair == null) {
      return null;
    }
    return pair.val;
  }

  /* 添加操作 */
  void put(int key, String val) {
    final Pair pair = Pair(key, val);
    final int index = _hashFunc(key);
    _buckets[index] = pair;
  }

  /* 删除操作 */
  void remove(int key) {
    final int index = _hashFunc(key);
    _buckets[index] = null;
  }

  /* 获取所有键值对 */
  List<Pair> pairSet() {
    List<Pair> pairSet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        pairSet.add(pair);
      }
    }
    return pairSet;
  }

  /* 获取所有键 */
  List<int> keySet() {
    List<int> keySet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        keySet.add(pair.key);
      }
    }
    return keySet;
  }

  /* 获取所有值 */
  List<String> values() {
    List<String> valueSet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        valueSet.add(pair.val);
      }
    }
    return valueSet;
  }

  /* 打印哈希表 */
  void printHashMap() {
    for (final Pair kv in pairSet()) {
      print("${kv.key} -> ${kv.val}");
    }
  }
}

/* Driver Code */
void main() {
  /* 初始化哈希表 */
  final ArrayHashMap map = ArrayHashMap();

  /* 添加操作 */
  // 在哈希表中添加键值对 (key, value)
  map.put(12836, "小哈");
  map.put(15937, "小啰");
  map.put(16750, "小算");
  map.put(13276, "小法");
  map.put(10583, "小鸭");
  print("\n添加完成后，哈希表为\nKey -> Value");
  map.printHashMap();

  /* 查询操作 */
  // 向哈希表中输入键 key ，得到值 value
  String? name = map.get(15937);
  print("\n输入学号 15937 ，查询到姓名 $name");

  /* 删除操作 */
  // 在哈希表中删除键值对 (key, value)
  map.remove(10583);
  print("\n删除 10583 后，哈希表为\nKey -> Value");
  map.printHashMap();

  /* 遍历哈希表 */
  print("\n遍历键值对 Key->Value");
  map.pairSet().forEach((kv) => print("${kv.key} -> ${kv.val}"));
  print("\n单独遍历键 Key");
  map.keySet().forEach((key) => print("$key"));
  print("\n单独遍历值 Value");
  map.values().forEach((val) => print("$val"));
}
