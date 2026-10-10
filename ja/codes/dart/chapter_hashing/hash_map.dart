/**
 * File: hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Driver Code */
void main() {
  /* ハッシュテーブルを初期化 */
  final Map<int, String> map = {};

  /* 追加操作 */
  // ハッシュテーブルにキーと値のペア (key, value) を追加
  map[12836] = "シャオハー";
  map[15937] = "シャオルオ";
  map[16750] = "シャオスワン";
  map[13276] = "シャオファー";
  map[10583] = "シャオヤー";
  print("\n追加完了後、ハッシュテーブルは\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  /* 検索操作 */
  // キー key をハッシュテーブルに渡し、値 value を取得
  final String? name = map[15937];
  print("\n学籍番号 15937 を入力すると、名前 $name が見つかりました");

  /* 削除操作 */
  // ハッシュテーブルからキーと値のペア (key, value) を削除
  map.remove(10583);
  print("\n10583 を削除後、ハッシュテーブルは\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  /* ハッシュテーブルを走査 */
  print("\nキーと値のペア Key->Value を走査");
  map.forEach((key, value) => print("$key -> $value"));
  print("\nキー Key のみを走査");
  map.keys.forEach((key) => print(key));
  print("\n値 Value のみを走査");
  map.forEach((key, value) => print("$value"));
  map.values.forEach((value) => print(value));
}
