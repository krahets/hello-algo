/**
 * File: hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Driver Code */
void main() {
  // [region]{init_hash_map}
  /* 初始化雜湊表 */
  final Map<int, String> map = {};
  // [endregion]{init_hash_map}

  // [region]{add_pairs}
  /* 新增操作 */
  // 在雜湊表中新增鍵值對 (key, value)
  map[12836] = "小哈";
  map[15937] = "小囉";
  map[16750] = "小算";
  map[13276] = "小法";
  map[10583] = "小鴨";
  // [endregion]{add_pairs}
  print("\n新增完成後，雜湊表為\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  // [region]{get_value}
  /* 查詢操作 */
  // 向雜湊表中輸入鍵 key ，得到值 value
  final String? name = map[15937];
  // [endregion]{get_value}
  print("\n輸入學號 15937 ，查詢到姓名 $name");

  // [region]{remove_pair}
  /* 刪除操作 */
  // 在雜湊表中刪除鍵值對 (key, value)
  map.remove(10583);
  // [endregion]{remove_pair}
  print("\n刪除 10583 後，雜湊表為\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  print("\n走訪鍵值對 Key->Value");
  // [region]{iterate_pairs}
  /* 走訪雜湊表 */
  // 走訪鍵值對 key->value
  map.forEach((key, value) => print("$key -> $value"));
  // [endregion]{iterate_pairs}

  print("\n單獨走訪鍵 Key");
  // [region]{iterate_keys}
  // 單獨走訪鍵 key
  map.keys.forEach((key) => print(key));
  // [endregion]{iterate_keys}

  print("\n單獨走訪值 Value");
  // [region]{iterate_values}
  // 單獨走訪值 value
  map.values.forEach((value) => print(value));
  // [endregion]{iterate_values}
}
