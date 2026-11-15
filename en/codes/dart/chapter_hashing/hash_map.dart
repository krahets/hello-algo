/**
 * File: hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Driver code */
void main() {
  /* Initialize the hash table */
  final Map<int, String> map = {};

  /* Insert operation */
  // Insert the key-value pair (key, value) into the hash table
  map[12836] = "小哈";
  map[15937] = "小啰";
  map[16750] = "小算";
  map[13276] = "小法";
  map[10583] = "小鸭";
  print("\nHash table after insertion:\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  /* Lookup operation */
  // Look up key in the hash table to obtain value
  final String? name = map[15937];
  print("\nLook up student ID 15937: name = $name");

  /* Remove operation */
  // Remove the key-value pair (key, value) from the hash table
  map.remove(10583);
  print("\nHash table after removing 10583:\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  /* Traverse the hash table */
  print("\nTraverse key-value pairs: Key->Value");
  map.forEach((key, value) => print("$key -> $value"));
  print("\nTraverse keys only: Key");
  map.keys.forEach((key) => print(key));
  print("\nTraverse values only: Value");
  map.forEach((key, value) => print("$value"));
  map.values.forEach((value) => print(value));
}
