/**
 * File: hash_map_open_addressing.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* オープンアドレス法ハッシュテーブル */
class HashMapOpenAddressing {
  late int _size; // キーと値のペア数
  int _capacity = 4; // ハッシュテーブル容量
  double _loadThres = 2.0 / 3.0; // リサイズを発動する負荷率のしきい値
  int _extendRatio = 2; // 拡張倍率
  late List<Pair?> _buckets; // バケット配列
  Pair _TOMBSTONE = Pair(-1, "-1"); // 削除済みマーク

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

  /* key に対応するバケットインデックスを探す */
  int findBucket(int key) {
    int index = hashFunc(key);
    int firstTombstone = -1;
    // 線形プロービングを行い、空バケットに達したら終了
    while (_buckets[index] != null) {
      // key が見つかったら、対応するバケットのインデックスを返す
      if (_buckets[index]!.key == key) {
        // 以前に削除マークが見つかっていれば、そのインデックスへキーと値のペアを移動
        if (firstTombstone != -1) {
          _buckets[firstTombstone] = _buckets[index];
          _buckets[index] = _TOMBSTONE;
          return firstTombstone; // 移動後のバケットインデックスを返す
        }
        return index; // バケットのインデックスを返す
      }
      // 最初に見つかった削除マークを記録
      if (firstTombstone == -1 && _buckets[index] == _TOMBSTONE) {
        firstTombstone = index;
      }
      // バケットのインデックスを計算し、末尾を越えたら先頭に戻る
      index = (index + 1) % _capacity;
    }
    // key が存在しない場合は追加位置のインデックスを返す
    return firstTombstone == -1 ? index : firstTombstone;
  }

  /* 検索操作 */
  String? get(int key) {
    // key に対応するバケットインデックスを探す
    int index = findBucket(key);
    // キーと値の組が見つかったら、対応する val を返す
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      return _buckets[index]!.val;
    }
    // キーと値の組が存在しなければ null を返す
    return null;
  }

  /* 追加操作 */
  void put(int key, String val) {
    // 負荷率がしきい値を超えたら、リサイズを実行
    if (loadFactor() > _loadThres) {
      extend();
    }
    // key に対応するバケットインデックスを探す
    int index = findBucket(key);
    // キーと値の組が見つかったら、val を上書きして返す
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index]!.val = val;
      return;
    }
    // キーと値の組が存在しない場合は、その組を追加する
    _buckets[index] = new Pair(key, val);
    _size++;
  }

  /* 削除操作 */
  void remove(int key) {
    // key に対応するバケットインデックスを探す
    int index = findBucket(key);
    // キーと値の組が見つかったら、削除マーカーで上書きする
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index] = _TOMBSTONE;
      _size--;
    }
  }

  /* ハッシュテーブルを拡張 */
  void extend() {
    // 元のハッシュテーブルを一時保存
    List<Pair?> bucketsTmp = _buckets;
    // リサイズ後の新しいハッシュテーブルを初期化
    _capacity *= _extendRatio;
    _buckets = List.generate(_capacity, (index) => null);
    _size = 0;
    // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
    for (Pair? pair in bucketsTmp) {
      if (pair != null && pair != _TOMBSTONE) {
        put(pair.key, pair.val);
      }
    }
  }

  /* ハッシュテーブルを出力 */
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
  /* ハッシュテーブルを初期化 */
  HashMapOpenAddressing map = HashMapOpenAddressing();

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
  print("\n学籍番号 13276 を入力すると、氏名 $name が見つかります");

  /* 削除操作 */
  // ハッシュテーブルからキーと値のペア (key, value) を削除
  map.remove(16750);
  print("\n16750 を削除した後、ハッシュテーブルは\nKey -> Value");
  map.printHashMap();
}
