/**
 * File: hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Driver Code */
void main() {
  /* Initialize hash table */
  final Map<int, String> map = {};

  /* Add operation */
  // Add key-value pair (key, value) to the hash table
  map[12836] = "Xiao Ha";
  map[15937] = "Xiao Luo";
  map[16750] = "Xiao Suan";
  map[13276] = "Xiao Fa";
  map[10583] = "Xiao Ya";
  print("\nAfter adding is complete, hash table is\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  /* Query operation */
  // Input key into hash table to get value
  final String? name = map[15937];
  print("\nInput student ID 15937, found name $name");

  /* Remove operation */
  // Remove key-value pair (key, value) from hash table
  map.remove(10583);
  print("\nAfter removing 10583, hash table is\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  /* Traverse hash table */
  print("\nTraverse key-value pairs Key->Value");
  map.forEach((key, value) => print("$key -> $value"));
  print("\nTraverse keys only Key");
  map.keys.forEach((key) => print(key));
  print("\nTraverse values only Value");
  map.forEach((key, value) => print("$value"));
  map.values.forEach((value) => print(value));
}
