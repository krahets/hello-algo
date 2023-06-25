/**
 * File: hash_map_open_addressing.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 键值对 */
class Pair {
  int key;
  String val;
  Pair(this.key, this.val);
}

/* 开放寻址哈希表 */
class HashMapOpenAddressing {
  late int _size; // 键值对数量
  late int _capacity; // 哈希表容量
  late double _loadThres; // 触发扩容的负载因子阈值
  late int _extendRatio; // 扩容倍数
  late List<Pair?> _buckets; // 桶数组
  late Pair _removed; // 删除标记

  /* 构造方法 */
  HashMapOpenAddressing() {
    _size = 0;
    _capacity = 4;
    _loadThres = 2.0 / 3.0;
    _extendRatio = 2;
    _buckets = List.generate(_capacity, (index) => null);
    _removed = Pair(-1, "-1");
  }

  /* 哈希函数 */
  int hashFunc(int key) {
    return key % _capacity;
  }

  /* 负载因子 */
  double loadFactor() {
    return _size / _capacity;
  }

  /* 查询操作 */
  String? get(int key) {
    int index = hashFunc(key);
    // 线性探测，从 index 开始向后遍历
    for (int i = 0; i < _capacity; i++) {
      // 计算桶索引，越过尾部返回头部
      int j = (index + i) % _capacity;
      // 若遇到空桶，说明无此 key ，则返回 null
      if (_buckets[j] == null) return null;
      // 若遇到指定 key ，则返回对应 val
      if (_buckets[j]!.key == key && _buckets[j] != _removed)
        return _buckets[j]!.val;
    }
    return null;
  }

  /* 添加操作 */
  void put(int key, String val) {
    // 当负载因子超过阈值时，执行扩容
    if (loadFactor() > _loadThres) {
      extend();
    }
    int index = hashFunc(key);
    // 线性探测，从 index 开始向后遍历
    for (int i = 0; i < _capacity; i++) {
      // 计算桶索引，越过尾部返回头部
      int j = (index + i) % _capacity;
      // 若遇到空桶、或带有删除标记的桶，则将键值对放入该桶
      if (_buckets[j] == null || _buckets[j] == _removed) {
        _buckets[j] = new Pair(key, val);
        _size += 1;
        return;
      }
      // 若遇到指定 key ，则更新对应 val
      if (_buckets[j]!.key == key) {
        _buckets[j]!.val = val;
        return;
      }
    }
  }

  /* 删除操作 */
  void remove(int key) {
    int index = hashFunc(key);
    // 线性探测，从 index 开始向后遍历
    for (int i = 0; i < _capacity; i++) {
      // 计算桶索引，越过尾部返回头部
      int j = (index + i) % _capacity;
      // 若遇到空桶，说明无此 key ，则直接返回
      if (_buckets[j] == null) {
        return;
      }
      // 若遇到指定 key ，则标记删除并返回
      if (_buckets[j]!.key == key) {
        _buckets[j] = _removed;
        _size -= 1;
        return;
      }
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
      if (pair != null && pair != _removed) {
        put(pair.key, pair.val);
      }
    }
  }

  /* 打印哈希表 */
  void printHashMap() {
    for (Pair? pair in _buckets) {
      if (pair != null) {
        print("${pair.key} -> ${pair.val}");
      } else {
        print(null);
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
  // 向哈希表输入键 key ，得到值 value
  String? name = map.get(13276);
  print("\n输入学号 13276 ，查询到姓名 $name");

  /* 删除操作 */
  // 在哈希表中删除键值对 (key, value)
  map.remove(16750);
  print("\n删除 16750 后，哈希表为\nKey -> Value");
  map.printHashMap();
}
