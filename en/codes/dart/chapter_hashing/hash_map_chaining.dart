/**
 * File: hash_map_chaining.dart
 * Created Time: 2023-06-24
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* Hash table with chaining */
class HashMapChaining {
  late int size; // Number of key-value pairs
  late int capacity; // Hash table capacity
  late double loadThres; // Load factor threshold for resizing
  late int extendRatio; // Growth factor
  late List<List<Pair>> buckets; // Bucket array

  /* Constructor */
  HashMapChaining() {
    size = 0;
    capacity = 4;
    loadThres = 2.0 / 3.0;
    extendRatio = 2;
    buckets = List.generate(capacity, (_) => []);
  }

  /* Hash function */
  int hashFunc(int key) {
    return key % capacity;
  }

  /* Load factor */
  double loadFactor() {
    return size / capacity;
  }

  /* Look up a value */
  String? get(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // Scan the bucket and return the corresponding val if key is found
    for (Pair pair in bucket) {
      if (pair.key == key) {
        return pair.val;
      }
    }
    // Return null if key is absent
    return null;
  }

  /* Insert a key-value pair */
  void put(int key, String val) {
    // Expand the table when the load factor exceeds the threshold
    if (loadFactor() > loadThres) {
      extend();
    }
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // Scan the bucket. If the specified key is found, update its val and return
    for (Pair pair in bucket) {
      if (pair.key == key) {
        pair.val = val;
        return;
      }
    }
    // If key is absent, append the pair to the end of the list
    Pair pair = Pair(key, val);
    bucket.add(pair);
    size++;
  }

  /* Remove a key-value pair */
  void remove(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // Scan the bucket and remove the pair
    for (Pair pair in bucket) {
      if (pair.key == key) {
        bucket.remove(pair);
        size--;
        break;
      }
    }
  }

  /* Expand the hash table */
  void extend() {
    // Save the original hash table
    List<List<Pair>> bucketsTmp = buckets;
    // Initialize the larger hash table
    capacity *= extendRatio;
    buckets = List.generate(capacity, (_) => []);
    size = 0;
    // Move the key-value pairs from the old table into the new one
    for (List<Pair> bucket in bucketsTmp) {
      for (Pair pair in bucket) {
        put(pair.key, pair.val);
      }
    }
  }

  /* Print the hash table */
  void printHashMap() {
    for (List<Pair> bucket in buckets) {
      List<String> res = [];
      for (Pair pair in bucket) {
        res.add("${pair.key} -> ${pair.val}");
      }
      print(res);
    }
  }
}

/* Driver code */
void main() {
  /* Initialize the hash table */
  HashMapChaining map = HashMapChaining();

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
  String? name = map.get(13276);
  print("\nName for student ID 13276: ${name}");

  /* Remove a key-value pair */
  // Remove the pair (key, value) from the hash table
  map.remove(12836);
  print("\nHash table after removing 12836:\nKey -> Value");
  map.printHashMap();
}
