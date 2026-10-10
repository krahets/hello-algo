/**
 * File: hash_map_chaining.dart
 * Created Time: 2023-06-24
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* チェイン法ハッシュテーブル */
class HashMapChaining {
  late int size; // キーと値のペア数
  late int capacity; // ハッシュテーブル容量
  late double loadThres; // リサイズを発動する負荷率のしきい値
  late int extendRatio; // 拡張倍率
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

  /* 検索操作 */
  String? get(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // バケットを走査し、key が見つかれば対応する val を返す
    for (Pair pair in bucket) {
      if (pair.key == key) {
        return pair.val;
      }
    }
    // key が見つからない場合は null を返す
    return null;
  }

  /* 追加操作 */
  void put(int key, String val) {
    // 負荷率がしきい値を超えたら、リサイズを実行
    if (loadFactor() > loadThres) {
      extend();
    }
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // バケットを走査し、指定した key が見つかれば対応する val を更新して返す
    for (Pair pair in bucket) {
      if (pair.key == key) {
        pair.val = val;
        return;
      }
    }
    // その key が存在しなければ、キーと値のペアを末尾に追加
    Pair pair = Pair(key, val);
    bucket.add(pair);
    size++;
  }

  /* 削除操作 */
  void remove(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // バケットを走査してキーと値のペアを削除
    for (Pair pair in bucket) {
      if (pair.key == key) {
        bucket.remove(pair);
        size--;
        break;
      }
    }
  }

  /* ハッシュテーブルを拡張 */
  void extend() {
    // 元のハッシュテーブルを一時保存
    List<List<Pair>> bucketsTmp = buckets;
    // リサイズ後の新しいハッシュテーブルを初期化
    capacity *= extendRatio;
    buckets = List.generate(capacity, (_) => []);
    size = 0;
    // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
    for (List<Pair> bucket in bucketsTmp) {
      for (Pair pair in bucket) {
        put(pair.key, pair.val);
      }
    }
  }

  /* ハッシュテーブルを出力 */
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
  /* ハッシュテーブルを初期化 */
  HashMapChaining map = HashMapChaining();

  /* 追加操作 */
  // ハッシュテーブルにキーと値のペア (key, value) を追加
  map.put(12836, "シャオハー");
  map.put(15937, "シャオルオ");
  map.put(16750, "シャオスワン");
  map.put(13276, "シャオファー");
  map.put(10583, "シャオヤー");
  print("\n追加完了後、ハッシュテーブルは\nKey -> Value");
  map.printHashMap();

  /* 検索操作 */
  // キー key をハッシュテーブルに渡し、値 value を取得
  String? name = map.get(13276);
  print("\n学籍番号 13276 を入力すると、氏名 ${name} が見つかります");

  /* 削除操作 */
  // ハッシュテーブルからキーと値のペア (key, value) を削除
  map.remove(12836);
  print("\n12836 を削除した後、ハッシュテーブルは\nKey -> Value");
  map.printHashMap();
}
