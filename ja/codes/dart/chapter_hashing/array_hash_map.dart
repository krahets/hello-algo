/**
 * File: array_hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* キーと値の組 */
class Pair {
  int key;
  String val;
  Pair(this.key, this.val);
}

/* 配列ベースのハッシュテーブル */
class ArrayHashMap {
  late List<Pair?> _buckets;

  ArrayHashMap() {
    // 100 個のバケットを含む配列を初期化
    _buckets = List.filled(100, null);
  }

  /* ハッシュ関数 */
  int _hashFunc(int key) {
    final int index = key % 100;
    return index;
  }

  /* 検索操作 */
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

  /* すべてのキーと値のペアを取得 */
  List<Pair> pairSet() {
    List<Pair> pairSet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        pairSet.add(pair);
      }
    }
    return pairSet;
  }

  /* すべてのキーを取得 */
  List<int> keySet() {
    List<int> keySet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        keySet.add(pair.key);
      }
    }
    return keySet;
  }

  /* すべての値を取得 */
  List<String> values() {
    List<String> valueSet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        valueSet.add(pair.val);
      }
    }
    return valueSet;
  }

  /* ハッシュテーブルを出力 */
  void printHashMap() {
    for (final Pair kv in pairSet()) {
      print("${kv.key} -> ${kv.val}");
    }
  }
}

/* Driver Code */
void main() {
  /* ハッシュテーブルを初期化 */
  final ArrayHashMap map = ArrayHashMap();

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
  String? name = map.get(15937);
  print("\n学籍番号 15937 を入力すると、名前 $name が見つかりました");

  /* 削除操作 */
  // ハッシュテーブルからキーと値のペア (key, value) を削除
  map.remove(10583);
  print("\n10583 を削除後、ハッシュテーブルは\nKey -> Value");
  map.printHashMap();

  /* ハッシュテーブルを走査 */
  print("\nキーと値のペア Key->Value を走査");
  map.pairSet().forEach((kv) => print("${kv.key} -> ${kv.val}"));
  print("\nキー Key のみを走査");
  map.keySet().forEach((key) => print("$key"));
  print("\n値 Value のみを走査");
  map.values().forEach((val) => print("$val"));
}
