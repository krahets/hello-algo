/**
 * File: hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Driver code */
void main() {
  // [region]{init_hash_map}
  /* Initialize the hash table */
  final Map<int, String> map = {};
  // [endregion]{init_hash_map}

  // [region]{add_pairs}
  /* Insert operation */
  // Insert the key-value pair (key, value) into the hash table
  map[12836] = "小哈";
  map[15937] = "小啰";
  map[16750] = "小算";
  map[13276] = "小法";
  map[10583] = "小鸭";
  // [endregion]{add_pairs}
  print("\nHash table after insertion:\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  // [region]{get_value}
  /* Lookup operation */
  // Look up key in the hash table to obtain value
  final String? name = map[15937];
  // [endregion]{get_value}
  print("\nLook up student ID 15937: name = $name");

  // [region]{remove_pair}
  /* Remove operation */
  // Remove the key-value pair (key, value) from the hash table
  map.remove(10583);
  // [endregion]{remove_pair}
  print("\nHash table after removing 10583:\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  print("\nTraverse key-value pairs: Key->Value");
  // [region]{iterate_pairs}
  /* Traverse the hash table */
  // Traverse key-value pairs: key->value
  map.forEach((key, value) => print("$key -> $value"));
  // [endregion]{iterate_pairs}

  print("\nTraverse keys only: Key");
  // [region]{iterate_keys}
  // Traverse keys only: key
  map.keys.forEach((key) => print(key));
  // [endregion]{iterate_keys}

  print("\nTraverse values only: Value");
  // [region]{iterate_values}
  // Traverse values only: value
  map.values.forEach((value) => print(value));
  // [endregion]{iterate_values}
}
