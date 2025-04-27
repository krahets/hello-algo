/**
 * File: hash_map_chaining.dart
 * Created Time: 2023-06-24
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* 鏈式位址雜湊表 */
class HashMapChaining {
  late int size; // 鍵值對數量
  late int capacity; // 雜湊表容量
  late double loadThres; // 觸發擴容的負載因子閾值
  late int extendRatio; // 擴容倍數
  late List<List<Pair>> buckets; // 桶陣列

  /* 建構子 */
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
    // 走訪桶，若找到 key ，則返回對應 val
    for (Pair pair in bucket) {
      if (pair.key == key) {
        return pair.val;
      }
    }
    // 若未找到 key ，則返回 null
    return null;
  }

  /* 新增操作 */
  void put(int key, String val) {
    // 當負載因子超過閾值時，執行擴容
    if (loadFactor() > loadThres) {
      extend();
    }
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // 走訪桶，若遇到指定 key ，則更新對應 val 並返回
    for (Pair pair in bucket) {
      if (pair.key == key) {
        pair.val = val;
        return;
      }
    }
    // 若無該 key ，則將鍵值對新增至尾部
    Pair pair = Pair(key, val);
    bucket.add(pair);
    size++;
  }

  /* 刪除操作 */
  void remove(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // 走訪桶，從中刪除鍵值對
    for (Pair pair in bucket) {
      if (pair.key == key) {
        bucket.remove(pair);
        size--;
        break;
      }
    }
  }

  /* 擴容雜湊表 */
  void extend() {
    // 暫存原雜湊表
    List<List<Pair>> bucketsTmp = buckets;
    // 初始化擴容後的新雜湊表
    capacity *= extendRatio;
    buckets = List.generate(capacity, (_) => []);
    size = 0;
    // 將鍵值對從原雜湊表搬運至新雜湊表
    for (List<Pair> bucket in bucketsTmp) {
      for (Pair pair in bucket) {
        put(pair.key, pair.val);
      }
    }
  }

  /* 列印雜湊表 */
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

/* Driver Code */
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
  print("\n新增完成後，雜湊表為\nKey -> Value");
  map.printHashMap();

  /* 查詢操作 */
  // 向雜湊表中輸入鍵 key ，得到值 value
  String? name = map.get(13276);
  print("\n輸入學號 13276 ，查詢到姓名 ${name}");

  /* 刪除操作 */
  // 在雜湊表中刪除鍵值對 (key, value)
  map.remove(12836);
  print("\n刪除 12836 後，雜湊表為\nKey -> Value");
  map.printHashMap();
}
