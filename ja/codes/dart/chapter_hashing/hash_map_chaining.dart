/**
 * File: hash_map_chaining.dart
 * Created Time: 2023-06-24
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* チェイン法のハッシュテーブル */
class HashMapChaining {
  late int size; // キーと値のペアの数
  late int capacity; // ハッシュテーブルの容量
  late double loadThres; // 容量の拡張を開始する負荷率のしきい値
  late int extendRatio; // 容量の拡張倍率
  late List<List<Pair>> buckets; // バケット配列

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

  /* 取得操作 */
  String? get(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // バケットを走査し、key が見つかったら対応する val を返す
    for (Pair pair in bucket) {
      if (pair.key == key) {
        return pair.val;
      }
    }
    // key が見つからなかった場合、null を返す
    return null;
  }

  /* 追加操作 */
  void put(int key, String val) {
    // 負荷率がしきい値を超えた場合、容量を拡張する
    if (loadFactor() > loadThres) {
      extend();
    }
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // バケットを走査し、指定された key が見つかったら、対応する val を更新して戻る
    for (Pair pair in bucket) {
      if (pair.key == key) {
        pair.val = val;
        return;
      }
    }
    // key が存在しない場合、キーと値のペアを末尾に追加する
    Pair pair = Pair(key, val);
    bucket.add(pair);
    size++;
  }

  /* 削除操作 */
  void remove(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // バケットを走査し、キーと値のペアを削除する
    for (Pair pair in bucket) {
      if (pair.key == key) {
        bucket.remove(pair);
        size--;
        break;
      }
    }
  }

  /* ハッシュテーブルの容量を拡張する */
  void extend() {
    // 元のハッシュテーブルを一時保存する
    List<List<Pair>> bucketsTmp = buckets;
    // 拡張後の新しいハッシュテーブルを初期化する
    capacity *= extendRatio;
    buckets = List.generate(capacity, (_) => []);
    size = 0;
    // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
    for (List<Pair> bucket in bucketsTmp) {
      for (Pair pair in bucket) {
        put(pair.key, pair.val);
      }
    }
  }

  /* ハッシュテーブルを表示する */
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

/* 実行用コード */
void main() {
  /* ハッシュテーブルを初期化する */
  HashMapChaining map = HashMapChaining();

  /* 追加操作 */
  // ハッシュテーブルにキーと値のペア (key, value) を追加する
  map.put(12836, "小哈");
  map.put(15937, "小啰");
  map.put(16750, "小算");
  map.put(13276, "小法");
  map.put(10583, "小鸭");
  print("\n追加後のハッシュテーブル\nKey -> Value");
  map.printHashMap();

  /* 取得操作 */
  // ハッシュテーブルにキー key を渡し、値 value を取得する
  String? name = map.get(13276);
  print("\n学生番号 13276 に対応する氏名は ${name}");

  /* 削除操作 */
  // ハッシュテーブルからキーと値のペア (key, value) を削除する
  map.remove(12836);
  print("\n12836 を削除した後のハッシュテーブル\nKey -> Value");
  map.printHashMap();
}
