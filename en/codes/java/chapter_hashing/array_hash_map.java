/**
 * File: array_hash_map.java
 * Created Time: 2022-12-04
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.*;

/* Key-value pair */
class Pair {
    public int key;
    public String val;

    public Pair(int key, String val) {
        this.key = key;
        this.val = val;
    }
}

/* Array-based hash table */
class ArrayHashMap {
    private List<Pair> buckets;

    public ArrayHashMap() {
        // Initialize an array with 100 buckets
        buckets = new ArrayList<>();
        for (int i = 0; i < 100; i++) {
            buckets.add(null);
        }
    }

    /* Hash function */
    private int hashFunc(int key) {
        int index = key % 100;
        return index;
    }

    /* Look up a value */
    public String get(int key) {
        int index = hashFunc(key);
        Pair pair = buckets.get(index);
        if (pair == null)
            return null;
        return pair.val;
    }

    /* Insert a key-value pair */
    public void put(int key, String val) {
        Pair pair = new Pair(key, val);
        int index = hashFunc(key);
        buckets.set(index, pair);
    }

    /* Remove a key-value pair */
    public void remove(int key) {
        int index = hashFunc(key);
        // Set the slot to null to remove the entry
        buckets.set(index, null);
    }

    /* Get all key-value pairs */
    public List<Pair> pairSet() {
        List<Pair> pairSet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                pairSet.add(pair);
        }
        return pairSet;
    }

    /* Get all keys */
    public List<Integer> keySet() {
        List<Integer> keySet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                keySet.add(pair.key);
        }
        return keySet;
    }

    /* Get all values */
    public List<String> valueSet() {
        List<String> valueSet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                valueSet.add(pair.val);
        }
        return valueSet;
    }

    /* Print the hash table */
    public void print() {
        for (Pair kv : pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
    }
}

public class array_hash_map {
    public static void main(String[] args) {
        /* Initialize the hash table */
        ArrayHashMap map = new ArrayHashMap();

        /* Insert a key-value pair */
        // Insert the pair (key, value) into the hash table
        map.put(12836, "Xiao Ha");
        map.put(15937, "Xiao Luo");
        map.put(16750, "Xiao Suan");
        map.put(13276, "Xiao Fa");
        map.put(10583, "Xiao Ya");
        System.out.println("\nHash table after insertion:\nKey -> Value");
        map.print();

        /* Look up a value */
        // Look up key in the hash table to get value
        String name = map.get(15937);
        System.out.println("\nName for student ID 15937: " + name);

        /* Remove a key-value pair */
        // Remove the pair (key, value) from the hash table
        map.remove(10583);
        System.out.println("\nHash table after removing 10583:\nKey -> Value");
        map.print();

        /* Iterate over the hash table */
        System.out.println("\nIterate over key-value pairs (Key->Value)");
        for (Pair kv : map.pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
        System.out.println("\nIterate over keys only");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\nIterate over values only");
        for (String val : map.valueSet()) {
            System.out.println(val);
        }
    }
}
