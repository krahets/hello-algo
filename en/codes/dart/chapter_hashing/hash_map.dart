/**
 * File: hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Driver code */
void main() {
  /* Initialize the hash table */
  final Map<int, String> map = {};

  /* Insert a key-value pair */
  // Insert the pair (key, value) into the hash table
  map[12836] = "Xiao Ha";
  map[15937] = "Xiao Luo";
  map[16750] = "Xiao Suan";
  map[13276] = "Xiao Fa";
  map[10583] = "Xiao Ya";
  print("\nHash table after insertion:\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  /* Look up a value */
  // Look up key in the hash table to get value
  final String? name = map[15937];
  print("\nName for student ID 15937: $name");

  /* Remove a key-value pair */
  // Remove the pair (key, value) from the hash table
  map.remove(10583);
  print("\nHash table after removing 10583:\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  /* Iterate over the hash table */
  print("\nIterate over key-value pairs (Key->Value)");
  map.forEach((key, value) => print("$key -> $value"));
  print("\nIterate over keys only");
  map.keys.forEach((key) => print(key));
  print("\nIterate over values only");
  map.values.forEach((value) => print(value));
}
