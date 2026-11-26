/**
 * File: hash_map_open_addressing.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* 採用開放定址法的雜湊表 */
class HashMapOpenAddressing {
  late int _size; // 鍵值對數量
  int _capacity = 4; // 雜湊表容量
  double _loadThres = 2.0 / 3.0; // 觸發容量擴充的負載因子門檻
  int _extendRatio = 2; // 容量擴充倍數
  late List<Pair?> _buckets; // 桶陣列
  Pair _TOMBSTONE = Pair(-1, "-1"); // 刪除標記

  /* 建構方法 */
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

  /* 尋找 key 對應的桶索引 */
  int findBucket(int key) {
    int index = hashFunc(key);
    int firstTombstone = -1;
    for (int i = 0; i < _capacity; i++) {
      final bucket = _buckets[index];
      if (bucket == null) break;
      // 記錄遇到的第一個刪除標記
      if (identical(bucket, _TOMBSTONE)) {
        if (firstTombstone == -1) firstTombstone = index;
      } else if (bucket.key == key) {
        // 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
        if (firstTombstone != -1) {
          _buckets[firstTombstone] = bucket;
          _buckets[index] = _TOMBSTONE;
          return firstTombstone; // 回傳移動後的桶索引
        }
        return index; // 回傳桶索引
      }
      // 計算桶索引，超過陣列尾端就回到開頭
      index = (index + 1) % _capacity;
    }
    // 若 key 不存在，回傳可插入位置的索引
    return firstTombstone == -1 ? index : firstTombstone;
  }

  /* 查詢操作 */
  String? get(int key) {
    // 尋找 key 對應的桶索引
    int index = findBucket(key);
    // 若找到鍵值對，回傳對應的 val
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      return _buckets[index]!.val;
    }
    // 若鍵值對不存在，回傳 null
    return null;
  }

  /* 新增操作 */
  void put(int key, String val) {
    // 當負載因子超過門檻時，擴充容量
    if (loadFactor() > _loadThres) {
      extend();
    }
    // 尋找 key 對應的桶索引
    int index = findBucket(key);
    // 若找到鍵值對，覆寫 val 並結束操作
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index]!.val = val;
      return;
    }
    // 若鍵值對不存在，新增該鍵值對
    _buckets[index] = new Pair(key, val);
    _size++;
  }

  /* 刪除操作 */
  void remove(int key) {
    // 尋找 key 對應的桶索引
    int index = findBucket(key);
    // 若找到鍵值對，以刪除標記取代它
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index] = _TOMBSTONE;
      _size--;
    }
  }

  /* 擴充雜湊表容量 */
  void extend() {
    // 暫存原本的雜湊表
    List<Pair?> bucketsTmp = _buckets;
    // 初始化擴充後的新雜湊表
    _capacity *= _extendRatio;
    _buckets = List.generate(_capacity, (index) => null);
    _size = 0;
    // 將鍵值對從原本的雜湊表移到新表
    for (Pair? pair in bucketsTmp) {
      if (pair != null && pair != _TOMBSTONE) {
        put(pair.key, pair.val);
      }
    }
  }

  /* 印出雜湊表 */
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

/* 主程式 */
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
  print("\n新增後的雜湊表\nKey -> Value");
  map.printHashMap();

  /* 查詢操作 */
  // 輸入鍵 key，從雜湊表取得對應的值 value
  String? name = map.get(13276);
  print("\n輸入學號 13276，查得姓名 $name");

  /* 刪除操作 */
  // 從雜湊表刪除鍵值對 (key, value)
  map.remove(16750);
  print("\n刪除 16750 後的雜湊表\nKey -> Value");
  map.printHashMap();
}
