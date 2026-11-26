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

/* 配列で実装したハッシュ表 */
class ArrayHashMap {
  late List<Pair?> _buckets;

  ArrayHashMap() {
    // 100 個のバケットを持つ配列を初期化する
    _buckets = List.filled(100, null);
  }

  /* ハッシュ関数 */
  int _hashFunc(int key) {
    final int index = key % 100;
    return index;
  }

  /* 検索 */
  String? get(int key) {
    final int index = _hashFunc(key);
    final Pair? pair = _buckets[index];
    if (pair == null) {
      return null;
    }
    return pair.val;
  }

  /* 追加 */
  void put(int key, String val) {
    final Pair pair = Pair(key, val);
    final int index = _hashFunc(key);
    _buckets[index] = pair;
  }

  /* 削除 */
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

  /* ハッシュ表を表示する */
  void printHashMap() {
    for (final Pair kv in pairSet()) {
      print("${kv.key} -> ${kv.val}");
    }
  }
}

/* 実行例 */
void main() {
  /* ハッシュ表を初期化する */
  final ArrayHashMap map = ArrayHashMap();

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
  String? name = map.get(15937);
  print("\n学籍番号 15937 に対応する名前は $name");

  /* 削除 */
  // ハッシュ表からペア (key, value) を削除する
  map.remove(10583);
  print("\n10583 を削除した後のハッシュ表\nKey -> Value");
  map.printHashMap();

  /* ハッシュ表を走査する */
  print("\nキーと値のペアを順に表示 Key->Value");
  map.pairSet().forEach((kv) => print("${kv.key} -> ${kv.val}"));
  print("\nキーだけを順に表示 Key");
  map.keySet().forEach((key) => print("$key"));
  print("\n値だけを順に表示 Value");
  map.values().forEach((val) => print("$val"));
}
