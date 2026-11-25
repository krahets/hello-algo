/**
 * File: array_hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Key-value pair */
class Pair {
  int key;
  String val;
  Pair(this.key, this.val);
}

/* Array-based hash table */
class ArrayHashMap {
  late List<Pair?> _buckets;

  ArrayHashMap() {
    // Initialize an array with 100 buckets
    _buckets = List.filled(100, null);
  }

  /* Hash function */
  int _hashFunc(int key) {
    final int index = key % 100;
    return index;
  }

  /* Look up a value */
  String? get(int key) {
    final int index = _hashFunc(key);
    final Pair? pair = _buckets[index];
    if (pair == null) {
      return null;
    }
    return pair.val;
  }

  /* Insert a key-value pair */
  void put(int key, String val) {
    final Pair pair = Pair(key, val);
    final int index = _hashFunc(key);
    _buckets[index] = pair;
  }

  /* Remove a key-value pair */
  void remove(int key) {
    final int index = _hashFunc(key);
    _buckets[index] = null;
  }

  /* Get all key-value pairs */
  List<Pair> pairSet() {
    List<Pair> pairSet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        pairSet.add(pair);
      }
    }
    return pairSet;
  }

  /* Get all keys */
  List<int> keySet() {
    List<int> keySet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        keySet.add(pair.key);
      }
    }
    return keySet;
  }

  /* Get all values */
  List<String> values() {
    List<String> valueSet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        valueSet.add(pair.val);
      }
    }
    return valueSet;
  }

  /* Print the hash table */
  void printHashMap() {
    for (final Pair kv in pairSet()) {
      print("${kv.key} -> ${kv.val}");
    }
  }
}

/* Driver code */
void main() {
  /* Initialize the hash table */
  final ArrayHashMap map = ArrayHashMap();

  /* Insert a key-value pair */
  // Insert the pair (key, value) into the hash table
  map.put(12836, "Xiao Ha");
  map.put(15937, "Xiao Luo");
  map.put(16750, "Xiao Suan");
  map.put(13276, "Xiao Fa");
  map.put(10583, "Xiao Ya");
  print("\nHash table after insertion:\nKey -> Value");
  map.printHashMap();

  /* Look up a value */
  // Look up key in the hash table to get value
  String? name = map.get(15937);
  print("\nName for student ID 15937: $name");

  /* Remove a key-value pair */
  // Remove the pair (key, value) from the hash table
  map.remove(10583);
  print("\nHash table after removing 10583:\nKey -> Value");
  map.printHashMap();

  /* Iterate over the hash table */
  print("\nIterate over key-value pairs (Key->Value)");
  map.pairSet().forEach((kv) => print("${kv.key} -> ${kv.val}"));
  print("\nIterate over keys only");
  map.keySet().forEach((key) => print("$key"));
  print("\nIterate over values only");
  map.values().forEach((val) => print("$val"));
}
