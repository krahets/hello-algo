/**
 * File: hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 実行用コード */
void main() {
  /* ハッシュテーブルを初期化する */
  final Map<int, String> map = {};

  /* 追加操作 */
  // ハッシュテーブルにキーと値のペア (key, value) を追加する
  map[12836] = "小哈";
  map[15937] = "小啰";
  map[16750] = "小算";
  map[13276] = "小法";
  map[10583] = "小鸭";
  print("\n追加後のハッシュテーブル\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  /* 取得操作 */
  // ハッシュテーブルにキー key を渡し、値 value を取得する
  final String? name = map[15937];
  print("\n学生番号 15937 に対応する氏名は $name");

  /* 削除操作 */
  // ハッシュテーブルからキーと値のペア (key, value) を削除する
  map.remove(10583);
  print("\n10583 を削除した後のハッシュテーブル\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  /* ハッシュテーブルを走査する */
  print("\nキーと値のペア Key->Value を走査する");
  map.forEach((key, value) => print("$key -> $value"));
  print("\nキー Key だけを走査する");
  map.keys.forEach((key) => print(key));
  print("\n値 Value だけを走査する");
  map.forEach((key, value) => print("$value"));
  map.values.forEach((value) => print(value));
}
