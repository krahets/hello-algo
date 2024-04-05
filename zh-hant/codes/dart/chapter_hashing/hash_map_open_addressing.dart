/**
 * File: hash_map_open_addressing.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* 開放定址雜湊表 */
class HashMapOpenAddressing {
  late int _size; // 鍵值對數量
  int _capacity = 4; // 雜湊表容量
  double _loadThres = 2.0 / 3.0; // 觸發擴容的負載因子閾值
  int _extendRatio = 2; // 擴容倍數
  late List<Pair?> _buckets; // 桶陣列
  Pair _TOMBSTONE = Pair(-1, "-1"); // 刪除標記

  /* 建構子 */
  HashMapOpenAddressing() {
    _size = 0;
    _buckets = List.generate(_capacity, (index) => null);
  }

  /* 雜湊函式 */
  int hashFunc(int key) {
    return key % _capacity;
  }

  /* 負載因子 */
  double loadFactor() {
    return _size / _capacity;
  }

  /* 搜尋 key 對應的桶索引 */
  int findBucket(int key) {
    int index = hashFunc(key);
    int firstTombstone = -1;
    // 線性探查，當遇到空桶時跳出
    while (_buckets[index] != null) {
      // 若遇到 key ，返回對應的桶索引
      if (_buckets[index]!.key == key) {
        // 若之前遇到了刪除標記，則將鍵值對移動至該索引處
        if (firstTombstone != -1) {
          _buckets[firstTombstone] = _buckets[index];
          _buckets[index] = _TOMBSTONE;
          return firstTombstone; // 返回移動後的桶索引
        }
        return index; // 返回桶索引
      }
      // 記錄遇到的首個刪除標記
      if (firstTombstone == -1 && _buckets[index] == _TOMBSTONE) {
        firstTombstone = index;
      }
      // 計算桶索引，越過尾部則返回頭部
      index = (index + 1) % _capacity;
    }
    // 若 key 不存在，則返回新增點的索引
    return firstTombstone == -1 ? index : firstTombstone;
  }

  /* 查詢操作 */
  String? get(int key) {
    // 搜尋 key 對應的桶索引
    int index = findBucket(key);
    // 若找到鍵值對，則返回對應 val
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      return _buckets[index]!.val;
    }
    // 若鍵值對不存在，則返回 null
    return null;
  }

  /* 新增操作 */
  void put(int key, String val) {
    // 當負載因子超過閾值時，執行擴容
    if (loadFactor() > _loadThres) {
      extend();
    }
    // 搜尋 key 對應的桶索引
    int index = findBucket(key);
    // 若找到鍵值對，則覆蓋 val 並返回
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index]!.val = val;
      return;
    }
    // 若鍵值對不存在，則新增該鍵值對
    _buckets[index] = new Pair(key, val);
    _size++;
  }

  /* 刪除操作 */
  void remove(int key) {
    // 搜尋 key 對應的桶索引
    int index = findBucket(key);
    // 若找到鍵值對，則用刪除標記覆蓋它
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index] = _TOMBSTONE;
      _size--;
    }
  }

  /* 擴容雜湊表 */
  void extend() {
    // 暫存原雜湊表
    List<Pair?> bucketsTmp = _buckets;
    // 初始化擴容後的新雜湊表
    _capacity *= _extendRatio;
    _buckets = List.generate(_capacity, (index) => null);
    _size = 0;
    // 將鍵值對從原雜湊表搬運至新雜湊表
    for (Pair? pair in bucketsTmp) {
      if (pair != null && pair != _TOMBSTONE) {
        put(pair.key, pair.val);
      }
    }
  }

  /* 列印雜湊表 */
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
  /* 初始化雜湊表 */
  HashMapOpenAddressing map = HashMapOpenAddressing();

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
  print("\n輸入學號 13276 ，查詢到姓名 $name");

  /* 刪除操作 */
  // 在雜湊表中刪除鍵值對 (key, value)
  map.remove(16750);
  print("\n刪除 16750 後，雜湊表為\nKey -> Value");
  map.printHashMap();
}
