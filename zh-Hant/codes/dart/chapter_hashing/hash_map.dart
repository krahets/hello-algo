/**
 * File: hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Driver Code */
void main() {
  /* 初始化雜湊表 */
  final Map<int, String> map = {};

  /* 新增操作 */
  // 在雜湊表中新增鍵值對 (key, value)
  map[12836] = "小哈";
  map[15937] = "小囉";
  map[16750] = "小算";
  map[13276] = "小法";
  map[10583] = "小鴨";
  print("\n新增完成後，雜湊表為\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  /* 查詢操作 */
  // 向雜湊表中輸入鍵 key ，得到值 value
  final String? name = map[15937];
  print("\n輸入學號 15937 ，查詢到姓名 $name");

  /* 刪除操作 */
  // 在雜湊表中刪除鍵值對 (key, value)
  map.remove(10583);
  print("\n刪除 10583 後，雜湊表為\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  /* 走訪雜湊表 */
  print("\n走訪鍵值對 Key->Value");
  map.forEach((key, value) => print("$key -> $value"));
  print("\n單獨走訪鍵 Key");
  map.keys.forEach((key) => print(key));
  print("\n單獨走訪值 Value");
  map.forEach((key, value) => print("$value"));
  map.values.forEach((value) => print(value));
}
