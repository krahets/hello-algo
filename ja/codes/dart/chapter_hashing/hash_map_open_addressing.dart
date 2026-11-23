/**
 * File: hash_map_open_addressing.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* オープンアドレス法のハッシュテーブル */
class HashMapOpenAddressing {
  late int _size; // キーと値のペアの数
  int _capacity = 4; // ハッシュテーブルの容量
  double _loadThres = 2.0 / 3.0; // 容量の拡張を開始する負荷率のしきい値
  int _extendRatio = 2; // 容量の拡張倍率
  late List<Pair?> _buckets; // バケット配列
  Pair _TOMBSTONE = Pair(-1, "-1"); // 削除マーカー

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

  /* key に対応するバケットのインデックスを探索する */
  int findBucket(int key) {
    int index = hashFunc(key);
    int firstTombstone = -1;
    // 線形探索法で探索し、空のバケットに到達したら終了する
    while (_buckets[index] != null) {
      // key が見つかった場合、対応するバケットのインデックスを返す
      if (_buckets[index]!.key == key) {
        // それ以前に削除マーカーが見つかっていれば、そのインデックスにキーと値のペアを移す
        if (firstTombstone != -1) {
          _buckets[firstTombstone] = _buckets[index];
          _buckets[index] = _TOMBSTONE;
          return firstTombstone; // 移動後のバケットのインデックスを返す
        }
        return index; // バケットのインデックスを返す
      }
      // 最初に見つかった削除マーカーを記録する
      if (firstTombstone == -1 && _buckets[index] == _TOMBSTONE) {
        firstTombstone = index;
      }
      // バケットのインデックスを計算し、末尾を越えたら先頭に戻る
      index = (index + 1) % _capacity;
    }
    // key が存在しない場合、追加位置のインデックスを返す
    return firstTombstone == -1 ? index : firstTombstone;
  }

  /* 取得操作 */
  String? get(int key) {
    // key に対応するバケットのインデックスを探索する
    int index = findBucket(key);
    // キーと値のペアが見つかった場合、対応する val を返す
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      return _buckets[index]!.val;
    }
    // キーと値のペアが存在しない場合、null を返す
    return null;
  }

  /* 追加操作 */
  void put(int key, String val) {
    // 負荷率がしきい値を超えた場合、容量を拡張する
    if (loadFactor() > _loadThres) {
      extend();
    }
    // key に対応するバケットのインデックスを探索する
    int index = findBucket(key);
    // キーと値のペアが見つかった場合、val を上書きして戻る
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index]!.val = val;
      return;
    }
    // キーと値のペアが存在しない場合、そのペアを追加する
    _buckets[index] = new Pair(key, val);
    _size++;
  }

  /* 削除操作 */
  void remove(int key) {
    // key に対応するバケットのインデックスを探索する
    int index = findBucket(key);
    // キーと値のペアが見つかった場合、削除マーカーで上書きする
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index] = _TOMBSTONE;
      _size--;
    }
  }

  /* ハッシュテーブルの容量を拡張する */
  void extend() {
    // 元のハッシュテーブルを一時保存する
    List<Pair?> bucketsTmp = _buckets;
    // 拡張後の新しいハッシュテーブルを初期化する
    _capacity *= _extendRatio;
    _buckets = List.generate(_capacity, (index) => null);
    _size = 0;
    // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
    for (Pair? pair in bucketsTmp) {
      if (pair != null && pair != _TOMBSTONE) {
        put(pair.key, pair.val);
      }
    }
  }

  /* ハッシュテーブルを表示する */
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

/* 実行用コード */
void main() {
  /* ハッシュテーブルを初期化する */
  HashMapOpenAddressing map = HashMapOpenAddressing();

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
  print("\n学生番号 13276 に対応する氏名は $name");

  /* 削除操作 */
  // ハッシュテーブルからキーと値のペア (key, value) を削除する
  map.remove(16750);
  print("\n16750 を削除した後のハッシュテーブル\nKey -> Value");
  map.printHashMap();
}
