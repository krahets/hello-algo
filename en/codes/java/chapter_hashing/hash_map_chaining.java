/**
 * File: hash_map_chaining.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.ArrayList;
import java.util.List;

/* Hash table with separate chaining */
class HashMapChaining {
    int size; // Number of key-value pairs
    int capacity; // Hash table capacity
    double loadThres; // Load factor threshold that triggers capacity growth
    int extendRatio; // Capacity growth factor
    List<List<Pair>> buckets; // Bucket array

    /* Constructor */
    public HashMapChaining() {
        size = 0;
        capacity = 4;
        loadThres = 2.0 / 3.0;
        extendRatio = 2;
        buckets = new ArrayList<>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.add(new ArrayList<>());
        }
    }

    /* Hash function */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* Load factor */
    double loadFactor() {
        return (double) size / capacity;
    }

    /* Lookup operation */
    String get(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // Traverse the bucket; if key is found, return its corresponding val
        for (Pair pair : bucket) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // Return null if key is not found
        return null;
    }

    /* Insert operation */
    void put(int key, String val) {
        // Grow the capacity when the load factor exceeds the threshold
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // Traverse the bucket; if the specified key is found, update its val and return
        for (Pair pair : bucket) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // If key is absent, append the key-value pair at the end
        Pair pair = new Pair(key, val);
        bucket.add(pair);
        size++;
    }

    /* Remove operation */
    void remove(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // Traverse the bucket and remove the key-value pair
        for (Pair pair : bucket) {
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
        buckets = new ArrayList<>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.add(new ArrayList<>());
        }
        size = 0;
        // Move the key-value pairs from the original hash table to the new one
        for (List<Pair> bucket : bucketsTmp) {
            for (Pair pair : bucket) {
                put(pair.key, pair.val);
            }
        }
    }

    /* Print the hash table */
    void print() {
        for (List<Pair> bucket : buckets) {
            List<String> res = new ArrayList<>();
            for (Pair pair : bucket) {
                res.add(pair.key + " -> " + pair.val);
            }
            System.out.println(res);
        }
    }
}

public class hash_map_chaining {
    public static void main(String[] args) {
        /* Initialize the hash table */
        HashMapChaining map = new HashMapChaining();

        /* Insert operation */
        // Insert the key-value pair (key, value) into the hash table
        map.put(12836, "小哈");
        map.put(15937, "小啰");
        map.put(16750, "小算");
        map.put(13276, "小法");
        map.put(10583, "小鸭");
        System.out.println("\nHash table after insertion:\nKey -> Value");
        map.print();

        /* Lookup operation */
        // Look up key in the hash table to obtain value
        String name = map.get(13276);
        System.out.println("\nLook up student ID 13276 to obtain the name " + name);

        /* Remove operation */
        // Remove the key-value pair (key, value) from the hash table
        map.remove(12836);
        System.out.println("\nHash table after removing 12836:\nKey -> Value");
        map.print();
    }
}
