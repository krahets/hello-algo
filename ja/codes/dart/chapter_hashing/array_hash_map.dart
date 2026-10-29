/**
 * File: array_hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* キーと値のペア */
class Pair {
  int key;
  String val;
  Pair(this.key, this.val);
}

/* 配列で実装したハッシュテーブル */
class ArrayHashMap {
  late List<Pair?> _buckets;

  ArrayHashMap() {
    // 100 個のバケットを含む配列を初期化する
    _buckets = List.filled(100, null);
  }

  /* ハッシュ関数 */
  int _hashFunc(int key) {
    final int index = key % 100;
    return index;
  }

  /* 取得操作 */
  String? get(int key) {
    final int index = _hashFunc(key);
    final Pair? pair = _buckets[index];
    if (pair == null) {
      return null;
    }
    return pair.val;
  }

  /* 追加操作 */
  void put(int key, String val) {
    final Pair pair = Pair(key, val);
    final int index = _hashFunc(key);
    _buckets[index] = pair;
  }

  /* 削除操作 */
  void remove(int key) {
    final int index = _hashFunc(key);
    _buckets[index] = null;
  }

  /* キーと値のペアをすべて取得する */
  List<Pair> pairSet() {
    List<Pair> pairSet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        pairSet.add(pair);
      }
    }
    return pairSet;
  }

  /* すべてのキーを取得する */
  List<int> keySet() {
    List<int> keySet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        keySet.add(pair.key);
      }
    }
    return keySet;
  }

  /* すべての値を取得する */
  List<String> values() {
    List<String> valueSet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        valueSet.add(pair.val);
      }
    }
    return valueSet;
  }

  /* ハッシュテーブルを表示する */
  void printHashMap() {
    for (final Pair kv in pairSet()) {
      print("${kv.key} -> ${kv.val}");
    }
  }
}

/* 実行用コード */
void main() {
  /* ハッシュテーブルを初期化する */
  final ArrayHashMap map = ArrayHashMap();

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
  String? name = map.get(15937);
  print("\n学生番号 15937 に対応する氏名は $name");

  /* 削除操作 */
  // ハッシュテーブルからキーと値のペア (key, value) を削除する
  map.remove(10583);
  print("\n10583 を削除した後のハッシュテーブル\nKey -> Value");
  map.printHashMap();

  /* ハッシュテーブルを走査する */
  print("\nキーと値のペア Key->Value を走査する");
  map.pairSet().forEach((kv) => print("${kv.key} -> ${kv.val}"));
  print("\nキー Key だけを走査する");
  map.keySet().forEach((key) => print("$key"));
  print("\n値 Value だけを走査する");
  map.values().forEach((val) => print("$val"));
}
