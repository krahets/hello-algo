/**
 * File: hash_map_chaining.dart
 * Created Time: 2023-06-24
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* 链式地址哈希表 */
class HashMapChaining {
  late int size; // 键值对数量
  late int capacity; // 哈希表容量
  late double loadThres; // 触发扩容的负载因子阈值
  late int extendRatio; // 扩容倍数
  late List<List<Pair>> buckets; // 桶数组

  /* 构造方法 */
  HashMapChaining() {
    size = 0;
    capacity = 4;
    loadThres = 2.0 / 3.0;
    extendRatio = 2;
    buckets = List.generate(capacity, (_) => []);
  }

  /* 哈希函数 */
  int hashFunc(int key) {
    return key % capacity;
  }

  /* 负载因子 */
  double loadFactor() {
    return size / capacity;
  }

  /* 查询操作 */
  String? get(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // 遍历桶，若找到 key ，则返回对应 val
    for (Pair pair in bucket) {
      if (pair.key == key) {
        return pair.val;
      }
    }
    // 若未找到 key ，则返回 null
    return null;
  }

  /* 添加操作 */
  void put(int key, String val) {
    // 当负载因子超过阈值时，执行扩容
    if (loadFactor() > loadThres) {
      extend();
    }
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // 遍历桶，若遇到指定 key ，则更新对应 val 并返回
    for (Pair pair in bucket) {
      if (pair.key == key) {
        pair.val = val;
        return;
      }
    }
    // 若无该 key ，则将键值对添加至尾部
    Pair pair = Pair(key, val);
    bucket.add(pair);
    size++;
  }

  /* 删除操作 */
  void remove(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // 遍历桶，从中删除键值对
    for (Pair pair in bucket) {
      if (pair.key == key) {
        bucket.remove(pair);
        size--;
        break;
      }
    }
  }

  /* 扩容哈希表 */
  void extend() {
    // 暂存原哈希表
    List<List<Pair>> bucketsTmp = buckets;
    // 初始化扩容后的新哈希表
    capacity *= extendRatio;
    buckets = List.generate(capacity, (_) => []);
    size = 0;
    // 将键值对从原哈希表搬运至新哈希表
    for (List<Pair> bucket in bucketsTmp) {
      for (Pair pair in bucket) {
        put(pair.key, pair.val);
      }
    }
  }

  /* 打印哈希表 */
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
  /* 初始化哈希表 */
  HashMapChaining map = HashMapChaining();

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
  String? name = map.get(13276);
  print("\n输入学号 13276 ，查询到姓名 ${name}");

  /* 删除操作 */
  // 在哈希表中删除键值对 (key, value)
  map.remove(12836);
  print("\n删除 12836 后，哈希表为\nKey -> Value");
  map.printHashMap();
}
