/**
 * File: hash_map_open_addressing.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* Hash table with open addressing */
class HashMapOpenAddressing {
  late int _size; // Number of key-value pairs
  int _capacity = 4; // Hash table capacity
  double _loadThres = 2.0 / 3.0; // Load factor threshold for triggering expansion
  int _extendRatio = 2; // Expansion multiplier
  late List<Pair?> _buckets; // Bucket array
  Pair _TOMBSTONE = Pair(-1, "-1"); // Removal marker

  /* Constructor */
  HashMapOpenAddressing() {
    _size = 0;
    _buckets = List.generate(_capacity, (index) => null);
  }

  /* Hash function */
  int hashFunc(int key) {
    return key % _capacity;
  }

  /* Load factor */
  double loadFactor() {
    return _size / _capacity;
  }

  /* Search for bucket index corresponding to key */
  int findBucket(int key) {
    int index = hashFunc(key);
    int firstTombstone = -1;
    // Linear probing, break when encountering an empty bucket
    while (_buckets[index] != null) {
      // If key is encountered, return the corresponding bucket index
      if (_buckets[index]!.key == key) {
        // If a removal marker was encountered before, move the key-value pair to that index
        if (firstTombstone != -1) {
          _buckets[firstTombstone] = _buckets[index];
          _buckets[index] = _TOMBSTONE;
          return firstTombstone; // Return the moved bucket index
        }
        return index; // Return bucket index
      }
      // Record the first removal marker encountered
      if (firstTombstone == -1 && _buckets[index] == _TOMBSTONE) {
        firstTombstone = index;
      }
      // Calculate bucket index, wrap around to the head if past the tail
      index = (index + 1) % _capacity;
    }
    // If key does not exist, return the index for insertion
    return firstTombstone == -1 ? index : firstTombstone;
  }

  /* Query operation */
  String? get(int key) {
    // Search for bucket index corresponding to key
    int index = findBucket(key);
    // If key-value pair is found, return corresponding val
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      return _buckets[index]!.val;
    }
    // If key-value pair does not exist, return null
    return null;
  }

  /* Add operation */
  void put(int key, String val) {
    // When load factor exceeds threshold, perform expansion
    if (loadFactor() > _loadThres) {
      extend();
    }
    // Search for bucket index corresponding to key
    int index = findBucket(key);
    // If key-value pair is found, overwrite val and return
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index]!.val = val;
      return;
    }
    // If key-value pair does not exist, add the key-value pair
    _buckets[index] = new Pair(key, val);
    _size++;
  }

  /* Remove operation */
  void remove(int key) {
    // Search for bucket index corresponding to key
    int index = findBucket(key);
    // If key-value pair is found, overwrite it with removal marker
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index] = _TOMBSTONE;
      _size--;
    }
  }

  /* Expand hash table */
  void extend() {
    // Temporarily store the original hash table
    List<Pair?> bucketsTmp = _buckets;
    // Initialize expanded new hash table
    _capacity *= _extendRatio;
    _buckets = List.generate(_capacity, (index) => null);
    _size = 0;
    // Move key-value pairs from original hash table to new hash table
    for (Pair? pair in bucketsTmp) {
      if (pair != null && pair != _TOMBSTONE) {
        put(pair.key, pair.val);
      }
    }
  }

  /* Print hash table */
  void printHashMap() {
    for (Pair? pair in _buckets) {
      if (pair == null) {
        print("null");
      } else if (pair == _TOMBSTONE) {
        print("TOMBSTONE");
      } else {
        print("${pair.key} -> ${pair.val}");
      }
    }
  }
}

/* Driver Code */
void main() {
  /* Initialize hash table */
  HashMapOpenAddressing map = HashMapOpenAddressing();

  /* Add operation */
  // Add key-value pair (key, value) to the hash table
  map.put(12836, "Xiao Ha");
  map.put(15937, "Xiao Luo");
  map.put(16750, "Xiao Suan");
  map.put(13276, "Xiao Fa");
  map.put(10583, "Xiao Ya");
  print("\nAfter adding is complete, hash table is\nKey -> Value");
  map.printHashMap();

  /* Query operation */
  // Input key into hash table to get value
  String? name = map.get(13276);
  print("\nInput student ID 13276, found name $name");

  /* Remove operation */
  // Remove key-value pair (key, value) from hash table
  map.remove(16750);
  print("\nAfter removing 16750, hash table is\nKey -> Value");
  map.printHashMap();
}
