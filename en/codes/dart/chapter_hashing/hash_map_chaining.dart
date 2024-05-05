/**
 * File: hash_map_chaining.dart
 * Created Time: 2023-06-24
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* Chained address hash table */
class HashMapChaining {
  late int size; // Number of key-value pairs
  late int capacity; // Hash table capacity
  late double loadThres; // Load factor threshold for triggering expansion
  late int extendRatio; // Expansion multiplier
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

  /* Query operation */
  String? get(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // Traverse the bucket, if the key is found, return the corresponding val
    for (Pair pair in bucket) {
      if (pair.key == key) {
        return pair.val;
      }
    }
    // If key is not found, return null
    return null;
  }

  /* Add operation */
  void put(int key, String val) {
    // When the load factor exceeds the threshold, perform expansion
    if (loadFactor() > loadThres) {
      extend();
    }
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // Traverse the bucket, if the specified key is encountered, update the corresponding val and return
    for (Pair pair in bucket) {
      if (pair.key == key) {
        pair.val = val;
        return;
      }
    }
    // If the key is not found, add the key-value pair to the end
    Pair pair = Pair(key, val);
    bucket.add(pair);
    size++;
  }

  /* Remove operation */
  void remove(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // Traverse the bucket, remove the key-value pair from it
    for (Pair pair in bucket) {
      if (pair.key == key) {
        bucket.remove(pair);
        size--;
        break;
      }
    }
  }

  /* Extend hash table */
  void extend() {
    // Temporarily store the original hash table
    List<List<Pair>> bucketsTmp = buckets;
    // Initialize the extended new hash table
    capacity *= extendRatio;
    buckets = List.generate(capacity, (_) => []);
    size = 0;
    // Move key-value pairs from the original hash table to the new hash table
    for (List<Pair> bucket in bucketsTmp) {
      for (Pair pair in bucket) {
        put(pair.key, pair.val);
      }
    }
  }

  /* Print hash table */
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

/* Driver Code */
void main() {
  /* Initialize hash table */
  HashMapChaining map = HashMapChaining();

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
  String? name = map.get(13276);
  print("\nInput student ID 13276, found name ${name}");

  /* Remove operation */
  // Remove key-value pair (key, value) from the hash table
  map.remove(12836);
  print("\nAfter removing 12836, the hash table is\nKey -> Value");
  map.printHashMap();
}
