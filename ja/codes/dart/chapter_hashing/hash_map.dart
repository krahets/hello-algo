/**
 * File: hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 実行例 */
void main() {
  /* ハッシュ表を初期化する */
  final Map<int, String> map = {};

  /* 追加 */
  // ハッシュ表にペア (key, value) を追加する
  map[12836] = "小哈";
  map[15937] = "小啰";
  map[16750] = "小算";
  map[13276] = "小法";
  map[10583] = "小鸭";
  print("\n追加後のハッシュ表\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  /* 検索 */
  // ハッシュ表でキー key に対応する値 value を取得する
  final String? name = map[15937];
  print("\n学籍番号 15937 に対応する名前は $name");

  /* 削除 */
  // ハッシュ表からペア (key, value) を削除する
  map.remove(10583);
  print("\n10583 を削除した後のハッシュ表\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  /* ハッシュ表を走査する */
  print("\nキーと値のペアを順に表示 Key->Value");
  map.forEach((key, value) => print("$key -> $value"));
  print("\nキーだけを順に表示 Key");
  map.keys.forEach((key) => print(key));
  print("\n値だけを順に表示 Value");
  map.values.forEach((value) => print(value));
}
