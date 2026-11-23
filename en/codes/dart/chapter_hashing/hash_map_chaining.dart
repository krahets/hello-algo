/**
 * File: hash_map_chaining.dart
 * Created Time: 2023-06-24
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* Hash table with separate chaining */
class HashMapChaining {
  late int size; // Number of key-value pairs
  late int capacity; // Hash table capacity
  late double loadThres; // Load factor threshold that triggers capacity growth
  late int extendRatio; // Capacity growth factor
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

  /* Lookup operation */
  String? get(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // Traverse the bucket; if key is found, return its corresponding val
    for (Pair pair in bucket) {
      if (pair.key == key) {
        return pair.val;
      }
    }
    // Return null if key was not found
    return null;
  }

  /* Insert operation */
  void put(int key, String val) {
    // Grow the capacity when the load factor exceeds the threshold
    if (loadFactor() > loadThres) {
      extend();
    }
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // Traverse the bucket; if the specified key is found, update its val and return
    for (Pair pair in bucket) {
      if (pair.key == key) {
        pair.val = val;
        return;
      }
    }
    // If key is absent, append the key-value pair at the end
    Pair pair = Pair(key, val);
    bucket.add(pair);
    size++;
  }

  /* Remove operation */
  void remove(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // Traverse the bucket and remove the key-value pair
    for (Pair pair in bucket) {
      if (pair.key == key) {
        bucket.remove(pair);
        size--;
        break;
      }
    }
  }

  /* Grow the hash table capacity */
  void extend() {
    // Keep a reference to the original hash table
    List<List<Pair>> bucketsTmp = buckets;
    // Initialize a new hash table with the expanded capacity
    capacity *= extendRatio;
    buckets = List.generate(capacity, (_) => []);
    size = 0;
    // Move the key-value pairs from the original hash table to the new one
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
  String? name = map.get(13276);
  print("\nLook up student ID 13276: name = ${name}");

  /* Remove operation */
  // Remove the key-value pair (key, value) from the hash table
  map.remove(12836);
  print("\nHash table after removing 12836:\nKey -> Value");
  map.printHashMap();
}
