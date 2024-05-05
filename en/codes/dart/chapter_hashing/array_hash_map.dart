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

/* Hash table based on array implementation */
class ArrayHashMap {
  late List<Pair?> _buckets;

  ArrayHashMap() {
    // Initialize an array, containing 100 buckets
    _buckets = List.filled(100, null);
  }

  /* Hash function */
  int _hashFunc(int key) {
    final int index = key % 100;
    return index;
  }

  /* Query operation */
  String? get(int key) {
    final int index = _hashFunc(key);
    final Pair? pair = _buckets[index];
    if (pair == null) {
      return null;
    }
    return pair.val;
  }

  /* Add operation */
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

  /* Print hash table */
  void printHashMap() {
    for (final Pair kv in pairSet()) {
      print("${kv.key} -> ${kv.val}");
    }
  }
}

/* Driver Code */
void main() {
  /* Initialize hash table */
  final ArrayHashMap map = ArrayHashMap();

  /* Add operation */
  // Add key-value pair (key, value) to the hash table
  map.put(12836, "Ha");
  map.put(15937, "Luo");
  map.put(16750, "Suan");
  map.put(13276, "Fa");
  map.put(10583, "Ya");
  print("\nAfter adding, the hash table is\nKey -> Value");
  map.printHashMap();

  /* Query operation */
  // Enter key to the hash table, get value
  String? name = map.get(15937);
  print("\nInput student ID 15937, found name $name");

  /* Remove operation */
  // Remove key-value pair (key, value) from the hash table
  map.remove(10583);
  print("\nAfter removing 10583, the hash table is\nKey -> Value");
  map.printHashMap();

  /* Traverse hash table */
  print("\nTraverse key-value pairs Key->Value");
  map.pairSet().forEach((kv) => print("${kv.key} -> ${kv.val}"));
  print("\nIndividually traverse keys Key");
  map.keySet().forEach((key) => print("$key"));
  print("\nIndividually traverse values Value");
  map.values().forEach((val) => print("$val"));
}
