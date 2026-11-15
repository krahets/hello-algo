/**
 * File: hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 実行用コード */
void main() {
  // [region]{init_hash_map}
  /* ハッシュテーブルを初期化する */
  final Map<int, String> map = {};
  // [endregion]{init_hash_map}

  // [region]{add_pairs}
  /* 追加操作 */
  // ハッシュテーブルにキーと値のペア (key, value) を追加する
  map[12836] = "小哈";
  map[15937] = "小啰";
  map[16750] = "小算";
  map[13276] = "小法";
  map[10583] = "小鸭";
  // [endregion]{add_pairs}
  print("\n追加後のハッシュテーブル\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  // [region]{get_value}
  /* 取得操作 */
  // ハッシュテーブルにキー key を渡し、値 value を取得する
  final String? name = map[15937];
  // [endregion]{get_value}
  print("\n学生番号 15937 に対応する氏名は $name");

  // [region]{remove_pair}
  /* 削除操作 */
  // ハッシュテーブルからキーと値のペア (key, value) を削除する
  map.remove(10583);
  // [endregion]{remove_pair}
  print("\n10583 を削除した後のハッシュテーブル\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  print("\nキーと値のペア Key->Value を走査する");
  // [region]{iterate_pairs}
  /* ハッシュテーブルを走査する */
  // キーと値のペア key->value を走査する
  map.forEach((key, value) => print("$key -> $value"));
  // [endregion]{iterate_pairs}

  print("\nキー Key だけを走査する");
  // [region]{iterate_keys}
  // キー key だけを走査する
  map.keys.forEach((key) => print(key));
  // [endregion]{iterate_keys}

  print("\n値 Value だけを走査する");
  // [region]{iterate_values}
  // 値 value だけを走査する
  map.values.forEach((value) => print(value));
  // [endregion]{iterate_values}
}
