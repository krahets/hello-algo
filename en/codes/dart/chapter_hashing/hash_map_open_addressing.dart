/**
 * File: hash_map_open_addressing.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* Open addressing hash table */
class HashMapOpenAddressing {
  late int _size; // Number of key-value pairs
  int _capacity = 4; // Hash table capacity
  double _loadThres = 2.0 / 3.0; // Load factor threshold for triggering expansion
  int _extendRatio = 2; // Expansion multiplier
  late List<Pair?> _buckets; // Bucket array
  Pair _TOMBSTONE = Pair(-1, "-1"); // Removal mark

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

  /* Search for the bucket index corresponding to key */
  int findBucket(int key) {
    int index = hashFunc(key);
    int firstTombstone = -1;
    // Linear probing, break when encountering an empty bucket
    while (_buckets[index] != null) {
      // If the key is encountered, return the corresponding bucket index
      if (_buckets[index]!.key == key) {
        // If a removal mark was encountered earlier, move the key-value pair to that index
        if (firstTombstone != -1) {
          _buckets[firstTombstone] = _buckets[index];
          _buckets[index] = _TOMBSTONE;
          return firstTombstone; // Return the moved bucket index
        }
        return index; // Return bucket index
      }
      // Record the first encountered removal mark
      if (firstTombstone == -1 && _buckets[index] == _TOMBSTONE) {
        firstTombstone = index;
      }
      // Calculate the bucket index, return to the head if exceeding the tail
      index = (index + 1) % _capacity;
    }
    // If the key does not exist, return the index of the insertion point
    return firstTombstone == -1 ? index : firstTombstone;
  }

  /* Query operation */
  String? get(int key) {
    // Search for the bucket index corresponding to key
    int index = findBucket(key);
    // If the key-value pair is found, return the corresponding val
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      return _buckets[index]!.val;
    }
    // If the key-value pair does not exist, return null
    return null;
  }

  /* Add operation */
  void put(int key, String val) {
    // When the load factor exceeds the threshold, perform expansion
    if (loadFactor() > _loadThres) {
      extend();
    }
    // Search for the bucket index corresponding to key
    int index = findBucket(key);
    // If the key-value pair is found, overwrite val and return
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index]!.val = val;
      return;
    }
    // If the key-value pair does not exist, add the key-value pair
    _buckets[index] = new Pair(key, val);
    _size++;
  }

  /* Remove operation */
  void remove(int key) {
    // Search for the bucket index corresponding to key
    int index = findBucket(key);
    // If the key-value pair is found, cover it with a removal mark
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index] = _TOMBSTONE;
      _size--;
    }
  }

  /* Extend hash table */
  void extend() {
    // Temporarily store the original hash table
    List<Pair?> bucketsTmp = _buckets;
    // Initialize the extended new hash table
    _capacity *= _extendRatio;
    _buckets = List.generate(_capacity, (index) => null);
    _size = 0;
    // Move key-value pairs from the original hash table to the new hash table
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
  print("\nInput student ID 13276, found name $name");

  /* Remove operation */
  // Remove key-value pair (key, value) from the hash table
  map.remove(16750);
  print("\nAfter removing 16750, the hash table is\nKey -> Value");
  map.printHashMap();
}
