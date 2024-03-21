/**
 * File: hash_map_open_addressing.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* 开放寻址哈希表 */
class HashMapOpenAddressing {
  late int _size; // 键值对数量
  int _capacity = 4; // 哈希表容量
  double _loadThres = 2.0 / 3.0; // 触发扩容的负载因子阈值
  int _extendRatio = 2; // 扩容倍数
  late List<Pair?> _buckets; // 桶数组
  Pair _TOMBSTONE = Pair(-1, "-1"); // 删除标记

  /* 构造方法 */
  HashMapOpenAddressing() {
    _size = 0;
    _buckets = List.generate(_capacity, (index) => null);
  }

  /* 哈希函数 */
  int hashFunc(int key) {
    return key % _capacity;
  }

  /* 负载因子 */
  double loadFactor() {
    return _size / _capacity;
  }

  /* 搜索 key 对应的桶索引 */
  int findBucket(int key) {
    int index = hashFunc(key);
    int firstTombstone = -1;
    // 线性探测，当遇到空桶时跳出
    while (_buckets[index] != null) {
      // 若遇到 key ，返回对应的桶索引
      if (_buckets[index]!.key == key) {
        // 若之前遇到了删除标记，则将键值对移动至该索引处
        if (firstTombstone != -1) {
          _buckets[firstTombstone] = _buckets[index];
          _buckets[index] = _TOMBSTONE;
          return firstTombstone; // 返回移动后的桶索引
        }
        return index; // 返回桶索引
      }
      // 记录遇到的首个删除标记
      if (firstTombstone == -1 && _buckets[index] == _TOMBSTONE) {
        firstTombstone = index;
      }
      // 计算桶索引，越过尾部则返回头部
      index = (index + 1) % _capacity;
    }
    // 若 key 不存在，则返回添加点的索引
    return firstTombstone == -1 ? index : firstTombstone;
  }

  /* 查询操作 */
  String? get(int key) {
    // 搜索 key 对应的桶索引
    int index = findBucket(key);
    // 若找到键值对，则返回对应 val
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      return _buckets[index]!.val;
    }
    // 若键值对不存在，则返回 null
    return null;
  }

  /* 添加操作 */
  void put(int key, String val) {
    // 当负载因子超过阈值时，执行扩容
    if (loadFactor() > _loadThres) {
      extend();
    }
    // 搜索 key 对应的桶索引
    int index = findBucket(key);
    // 若找到键值对，则覆盖 val 并返回
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index]!.val = val;
      return;
    }
    // 若键值对不存在，则添加该键值对
    _buckets[index] = new Pair(key, val);
    _size++;
  }

  /* 删除操作 */
  void remove(int key) {
    // 搜索 key 对应的桶索引
    int index = findBucket(key);
    // 若找到键值对，则用删除标记覆盖它
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index] = _TOMBSTONE;
      _size--;
    }
  }

  /* 扩容哈希表 */
  void extend() {
    // 暂存原哈希表
    List<Pair?> bucketsTmp = _buckets;
    // 初始化扩容后的新哈希表
    _capacity *= _extendRatio;
    _buckets = List.generate(_capacity, (index) => null);
    _size = 0;
    // 将键值对从原哈希表搬运至新哈希表
    for (Pair? pair in bucketsTmp) {
      if (pair != null && pair != _TOMBSTONE) {
        put(pair.key, pair.val);
      }
    }
  }

  /* 打印哈希表 */
  void printHashMap() {
    for (Pair? pair in _buckets) {
      if (pair == null) {
        print("null");
      } else if (pair == _TOMBSTONE) {
        print("TOMBSTONE");
      } else {
        print("${pair.key} -> ${pair.val}");
      }
    }
  }
}

/* Driver Code */
void main() {
  /* 初始化哈希表 */
  HashMapOpenAddressing map = HashMapOpenAddressing();

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
  print("\n输入学号 13276 ，查询到姓名 $name");

  /* 删除操作 */
  // 在哈希表中删除键值对 (key, value)
  map.remove(16750);
  print("\n删除 16750 后，哈希表为\nKey -> Value");
  map.printHashMap();
}
