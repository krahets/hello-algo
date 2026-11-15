/**
 * File: hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Driver Code */
void main() {
  // [region]{init_hash_map}
  /* 初始化哈希表 */
  final Map<int, String> map = {};
  // [endregion]{init_hash_map}

  // [region]{add_pairs}
  /* 添加操作 */
  // 在哈希表中添加键值对 (key, value)
  map[12836] = "小哈";
  map[15937] = "小啰";
  map[16750] = "小算";
  map[13276] = "小法";
  map[10583] = "小鸭";
  // [endregion]{add_pairs}
  print("\n添加完成后，哈希表为\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  // [region]{get_value}
  /* 查询操作 */
  // 向哈希表中输入键 key ，得到值 value
  final String? name = map[15937];
  // [endregion]{get_value}
  print("\n输入学号 15937 ，查询到姓名 $name");

  // [region]{remove_pair}
  /* 删除操作 */
  // 在哈希表中删除键值对 (key, value)
  map.remove(10583);
  // [endregion]{remove_pair}
  print("\n删除 10583 后，哈希表为\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  print("\n遍历键值对 Key->Value");
  // [region]{iterate_pairs}
  /* 遍历哈希表 */
  // 遍历键值对 key->value
  map.forEach((key, value) => print("$key -> $value"));
  // [endregion]{iterate_pairs}

  print("\n单独遍历键 Key");
  // [region]{iterate_keys}
  // 单独遍历键 key
  map.keys.forEach((key) => print(key));
  // [endregion]{iterate_keys}

  print("\n单独遍历值 Value");
  // [region]{iterate_values}
  // 单独遍历值 value
  map.values.forEach((value) => print(value));
  // [endregion]{iterate_values}
}
