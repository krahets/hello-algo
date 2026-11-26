/**
 * File: hash_map_open_addressing.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* オープンアドレス法によるハッシュ表 */
class HashMapOpenAddressing {
  late int _size; // キーと値のペアの数
  int _capacity = 4; // ハッシュ表の容量
  double _loadThres = 2.0 / 3.0; // 表を拡張する負荷率のしきい値
  int _extendRatio = 2; // 容量の拡張倍率
  late List<Pair?> _buckets; // バケットの配列
  Pair _TOMBSTONE = Pair(-1, "-1"); // 削除済みマーカー

  /* コンストラクタ */
  HashMapOpenAddressing() {
    _size = 0;
    _buckets = List.generate(_capacity, (index) => null);
  }

  /* ハッシュ関数 */
  int hashFunc(int key) {
    return key % _capacity;
  }

  /* 負荷率 */
  double loadFactor() {
    return _size / _capacity;
  }

  /* key に対応するバケットのインデックスを探す */
  int findBucket(int key) {
    int index = hashFunc(key);
    int firstTombstone = -1;
    for (int i = 0; i < _capacity; i++) {
      final bucket = _buckets[index];
      if (bucket == null) break;
      // 最初に見つかった削除済みマーカーの位置を記録する
      if (identical(bucket, _TOMBSTONE)) {
        if (firstTombstone == -1) firstTombstone = index;
      } else if (bucket.key == key) {
        // それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
        if (firstTombstone != -1) {
          _buckets[firstTombstone] = bucket;
          _buckets[index] = _TOMBSTONE;
          return firstTombstone; // 移動先のバケットのインデックスを返す
        }
        return index; // バケットのインデックスを返す
      }
      // 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
      index = (index + 1) % _capacity;
    }
    // key がなければ挿入位置のインデックスを返す
    return firstTombstone == -1 ? index : firstTombstone;
  }

  /* 検索 */
  String? get(int key) {
    // key に対応するバケットのインデックスを探す
    int index = findBucket(key);
    // ペアが見つかったら対応する val を返す
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      return _buckets[index]!.val;
    }
    // ペアがなければ null を返す
    return null;
  }

  /* 追加 */
  void put(int key, String val) {
    // 負荷率がしきい値を超えたら表を拡張する
    if (loadFactor() > _loadThres) {
      extend();
    }
    // key に対応するバケットのインデックスを探す
    int index = findBucket(key);
    // ペアが見つかったら val を上書きして処理を終える
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index]!.val = val;
      return;
    }
    // ペアがなければ新しく追加する
    _buckets[index] = new Pair(key, val);
    _size++;
  }

  /* 削除 */
  void remove(int key) {
    // key に対応するバケットのインデックスを探す
    int index = findBucket(key);
    // ペアが見つかったら削除済みマーカーで置き換える
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index] = _TOMBSTONE;
      _size--;
    }
  }

  /* ハッシュ表を拡張する */
  void extend() {
    // 元のハッシュ表を一時保存する
    List<Pair?> bucketsTmp = _buckets;
    // 拡張後の新しいハッシュ表を初期化する
    _capacity *= _extendRatio;
    _buckets = List.generate(_capacity, (index) => null);
    _size = 0;
    // 元のハッシュ表から新しい表にペアを移す
    for (Pair? pair in bucketsTmp) {
      if (pair != null && pair != _TOMBSTONE) {
        put(pair.key, pair.val);
      }
    }
  }

  /* ハッシュ表を表示する */
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

/* 実行例 */
void main() {
  /* ハッシュ表を初期化する */
  HashMapOpenAddressing map = HashMapOpenAddressing();

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
  print("\n学籍番号 13276 に対応する名前は $name");

  /* 削除 */
  // ハッシュ表からペア (key, value) を削除する
  map.remove(16750);
  print("\n16750 を削除した後のハッシュ表\nKey -> Value");
  map.printHashMap();
}
