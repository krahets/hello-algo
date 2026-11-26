/**
 * File: hash_map_chaining.dart
 * Created Time: 2023-06-24
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* 鏈結法雜湊表 */
class HashMapChaining {
  late int size; // 鍵值對數量
  late int capacity; // 雜湊表容量
  late double loadThres; // 觸發容量擴充的負載因子門檻
  late int extendRatio; // 容量擴充倍數
  late List<List<Pair>> buckets; // 桶陣列

  /* 建構方法 */
  HashMapChaining() {
    size = 0;
    capacity = 4;
    loadThres = 2.0 / 3.0;
    extendRatio = 2;
    buckets = List.generate(capacity, (_) => []);
  }

  /* 雜湊函式 */
  int hashFunc(int key) {
    return key % capacity;
  }

  /* 負載因子 */
  double loadFactor() {
    return size / capacity;
  }

  /* 查詢操作 */
  String? get(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // 走訪桶中的元素，若找到 key，就回傳對應的 val
    for (Pair pair in bucket) {
      if (pair.key == key) {
        return pair.val;
      }
    }
    // 若找不到 key，回傳 null
    return null;
  }

  /* 新增操作 */
  void put(int key, String val) {
    // 當負載因子超過門檻時，擴充容量
    if (loadFactor() > loadThres) {
      extend();
    }
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
    for (Pair pair in bucket) {
      if (pair.key == key) {
        pair.val = val;
        return;
      }
    }
    // 若沒有這個 key，就將鍵值對加到尾端
    Pair pair = Pair(key, val);
    bucket.add(pair);
    size++;
  }

  /* 刪除操作 */
  void remove(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // 走訪桶中的元素，從中刪除鍵值對
    for (Pair pair in bucket) {
      if (pair.key == key) {
        bucket.remove(pair);
        size--;
        break;
      }
    }
  }

  /* 擴充雜湊表容量 */
  void extend() {
    // 暫存原本的雜湊表
    List<List<Pair>> bucketsTmp = buckets;
    // 初始化擴充後的新雜湊表
    capacity *= extendRatio;
    buckets = List.generate(capacity, (_) => []);
    size = 0;
    // 將鍵值對從原本的雜湊表移到新表
    for (List<Pair> bucket in bucketsTmp) {
      for (Pair pair in bucket) {
        put(pair.key, pair.val);
      }
    }
  }

  /* 印出雜湊表 */
  void printHashMap() {
    for (List<Pair> bucket in buckets) {
      List<String> res = [];
      for (Pair pair in bucket) {
        res.add("${pair.key} -> ${pair.val}");
      }
      print(res);
    }
  }
}

/* 主程式 */
void main() {
  /* 初始化雜湊表 */
  HashMapChaining map = HashMapChaining();

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
  String? name = map.get(13276);
  print("\n輸入學號 13276，查得姓名 ${name}");

  /* 刪除操作 */
  // 從雜湊表刪除鍵值對 (key, value)
  map.remove(12836);
  print("\n刪除 12836 後的雜湊表\nKey -> Value");
  map.printHashMap();
}
