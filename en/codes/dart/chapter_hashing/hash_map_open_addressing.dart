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
  double _loadThres = 2.0 / 3.0; // Load factor threshold that triggers capacity growth
  int _extendRatio = 2; // Capacity growth factor
  late List<Pair?> _buckets; // Bucket array
  Pair _TOMBSTONE = Pair(-1, "-1"); // Tombstone marker

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

  /* Find the bucket index for key */
  int findBucket(int key) {
    int index = hashFunc(key);
    int firstTombstone = -1;
    // Probe linearly until an empty bucket is reached
    while (_buckets[index] != null) {
      // If key is found, return its bucket index
      if (_buckets[index]!.key == key) {
        // If a tombstone was encountered earlier, move the key-value pair to that index
        if (firstTombstone != -1) {
          _buckets[firstTombstone] = _buckets[index];
          _buckets[index] = _TOMBSTONE;
          return firstTombstone; // Return the bucket index after the move
        }
        return index; // Return the bucket index
      }
      // Record the first tombstone encountered
      if (firstTombstone == -1 && _buckets[index] == _TOMBSTONE) {
        firstTombstone = index;
      }
      // Calculate the bucket index, wrapping to the beginning after the end
      index = (index + 1) % _capacity;
    }
    // If key is absent, return the index for insertion
    return firstTombstone == -1 ? index : firstTombstone;
  }

  /* Lookup operation */
  String? get(int key) {
    // Find the bucket index for key
    int index = findBucket(key);
    // If the key-value pair is found, return its val
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      return _buckets[index]!.val;
    }
    // Return null if the key-value pair does not exist
    return null;
  }

  /* Insert operation */
  void put(int key, String val) {
    // Grow the capacity when the load factor exceeds the threshold
    if (loadFactor() > _loadThres) {
      extend();
    }
    // Find the bucket index for key
    int index = findBucket(key);
    // If the key-value pair is found, overwrite val and return
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index]!.val = val;
      return;
    }
    // If the key-value pair is absent, insert it
    _buckets[index] = new Pair(key, val);
    _size++;
  }

  /* Remove operation */
  void remove(int key) {
    // Find the bucket index for key
    int index = findBucket(key);
    // If the key-value pair is found, replace it with a tombstone
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index] = _TOMBSTONE;
      _size--;
    }
  }

  /* Grow the hash table capacity */
  void extend() {
    // Keep a reference to the original hash table
    List<Pair?> bucketsTmp = _buckets;
    // Initialize a new hash table with the expanded capacity
    _capacity *= _extendRatio;
    _buckets = List.generate(_capacity, (index) => null);
    _size = 0;
    // Move the key-value pairs from the original hash table to the new one
    for (Pair? pair in bucketsTmp) {
      if (pair != null && pair != _TOMBSTONE) {
        put(pair.key, pair.val);
      }
    }
  }

  /* Print the hash table */
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

/* Driver code */
void main() {
  /* Initialize the hash table */
  HashMapOpenAddressing map = HashMapOpenAddressing();

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
  print("\nLook up student ID 13276: name = $name");

  /* Remove operation */
  // Remove the key-value pair (key, value) from the hash table
  map.remove(16750);
  print("\nHash table after removing 16750:\nKey -> Value");
  map.printHashMap();
}
