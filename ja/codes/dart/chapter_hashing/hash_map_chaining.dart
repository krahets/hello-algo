/**
 * File: hash_map_chaining.dart
 * Created Time: 2023-06-24
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* チェイン法によるハッシュ表 */
class HashMapChaining {
  late int size; // キーと値のペアの数
  late int capacity; // ハッシュ表の容量
  late double loadThres; // 表を拡張する負荷率のしきい値
  late int extendRatio; // 容量の拡張倍率
  late List<List<Pair>> buckets; // バケットの配列

  /* コンストラクタ */
  HashMapChaining() {
    size = 0;
    capacity = 4;
    loadThres = 2.0 / 3.0;
    extendRatio = 2;
    buckets = List.generate(capacity, (_) => []);
  }

  /* ハッシュ関数 */
  int hashFunc(int key) {
    return key % capacity;
  }

  /* 負荷率 */
  double loadFactor() {
    return size / capacity;
  }

  /* 検索 */
  String? get(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // バケットを走査し、key が見つかったら対応する val を返す
    for (Pair pair in bucket) {
      if (pair.key == key) {
        return pair.val;
      }
    }
    // key が見つからなければ null を返す
    return null;
  }

  /* 追加 */
  void put(int key, String val) {
    // 負荷率がしきい値を超えたら表を拡張する
    if (loadFactor() > loadThres) {
      extend();
    }
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
    for (Pair pair in bucket) {
      if (pair.key == key) {
        pair.val = val;
        return;
      }
    }
    // key がなければ末尾にペアを追加する
    Pair pair = Pair(key, val);
    bucket.add(pair);
    size++;
  }

  /* 削除 */
  void remove(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // バケットを走査し、該当するペアを削除する
    for (Pair pair in bucket) {
      if (pair.key == key) {
        bucket.remove(pair);
        size--;
        break;
      }
    }
  }

  /* ハッシュ表を拡張する */
  void extend() {
    // 元のハッシュ表を一時保存する
    List<List<Pair>> bucketsTmp = buckets;
    // 拡張後の新しいハッシュ表を初期化する
    capacity *= extendRatio;
    buckets = List.generate(capacity, (_) => []);
    size = 0;
    // 元のハッシュ表から新しい表にペアを移す
    for (List<Pair> bucket in bucketsTmp) {
      for (Pair pair in bucket) {
        put(pair.key, pair.val);
      }
    }
  }

  /* ハッシュ表を表示する */
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

/* 実行例 */
void main() {
  /* ハッシュ表を初期化する */
  HashMapChaining map = HashMapChaining();

  /* 追加 */
  // ハッシュ表にペア (key, value) を追加する
  map.put(12836, "小哈");
  map.put(15937, "小啰");
  map.put(16750, "小算");
  map.put(13276, "小法");
  map.put(10583, "小鸭");
  print("\n追加後のハッシュ表\nKey -> Value");
  map.printHashMap();

  /* 検索 */
  // ハッシュ表でキー key に対応する値 value を取得する
  String? name = map.get(13276);
  print("\n学籍番号 13276 に対応する名前は ${name}");

  /* 削除 */
  // ハッシュ表からペア (key, value) を削除する
  map.remove(12836);
  print("\n12836 を削除した後のハッシュ表\nKey -> Value");
  map.printHashMap();
}
