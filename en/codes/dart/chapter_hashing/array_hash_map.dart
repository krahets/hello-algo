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

/* Hash table implemented with an array */
class ArrayHashMap {
  late List<Pair?> _buckets;

  ArrayHashMap() {
    // Initialize an array containing 100 buckets
    _buckets = List.filled(100, null);
  }

  /* Hash function */
  int _hashFunc(int key) {
    final int index = key % 100;
    return index;
  }

  /* Lookup operation */
  String? get(int key) {
    final int index = _hashFunc(key);
    final Pair? pair = _buckets[index];
    if (pair == null) {
      return null;
    }
    return pair.val;
  }

  /* Insert operation */
  void put(int key, String val) {
    final Pair pair = Pair(key, val);
    final int index = _hashFunc(key);
    _buckets[index] = pair;
  }

  /* Remove operation */
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

  /* Insert operation */
  // Insert the key-value pair (key, value) into the hash table
  map.put(12836, "小哈");
  map.put(15937, "小啰");
  map.put(16750, "小算");
  map.put(13276, "小法");
  map.put(10583, "小鸭");
  print("\nHash table after insertion:\nKey -> Value");
  map.printHashMap();

  /* Lookup operation */
  // Look up key in the hash table to obtain value
  String? name = map.get(15937);
  print("\nLook up student ID 15937: name = $name");

  /* Remove operation */
  // Remove the key-value pair (key, value) from the hash table
  map.remove(10583);
  print("\nHash table after removing 10583:\nKey -> Value");
  map.printHashMap();

  /* Traverse the hash table */
  print("\nTraverse key-value pairs: Key->Value");
  map.pairSet().forEach((kv) => print("${kv.key} -> ${kv.val}"));
  print("\nTraverse keys only: Key");
  map.keySet().forEach((key) => print("$key"));
  print("\nTraverse values only: Value");
  map.values().forEach((val) => print("$val"));
}
