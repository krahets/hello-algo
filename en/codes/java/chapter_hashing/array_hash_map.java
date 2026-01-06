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

/* Hash table based on array implementation */
class ArrayHashMap {
    private List<Pair> buckets;

    public ArrayHashMap() {
        // Initialize array with 100 buckets
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

    /* Query operation */
    public String get(int key) {
        int index = hashFunc(key);
        Pair pair = buckets.get(index);
        if (pair == null)
            return null;
        return pair.val;
    }

    /* Add operation */
    public void put(int key, String val) {
        Pair pair = new Pair(key, val);
        int index = hashFunc(key);
        buckets.set(index, pair);
    }

    /* Remove operation */
    public void remove(int key) {
        int index = hashFunc(key);
        // Set to null to represent deletion
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

    /* Print hash table */
    public void print() {
        for (Pair kv : pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
    }
}

public class array_hash_map {
    public static void main(String[] args) {
        /* Initialize hash table */
        ArrayHashMap map = new ArrayHashMap();

        /* Add operation */
        // Add key-value pair (key, value) to the hash table
        map.put(12836, "Xiao Ha");
        map.put(15937, "Xiao Luo");
        map.put(16750, "Xiao Suan");
        map.put(13276, "Xiao Fa");
        map.put(10583, "Xiao Ya");
        System.out.println("\nAfter adding is complete, hash table is\nKey -> Value");
        map.print();

        /* Query operation */
        // Input key into hash table to get value
        String name = map.get(15937);
        System.out.println("\nInput student ID 15937, query name " + name);

        /* Remove operation */
        // Remove key-value pair (key, value) from hash table
        map.remove(10583);
        System.out.println("\nAfter removing 10583, hash table is\nKey -> Value");
        map.print();

        /* Traverse hash table */
        System.out.println("\nTraverse key-value pairs Key->Value");
        for (Pair kv : map.pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
        System.out.println("\nTraverse keys only Key");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\nTraverse values only Value");
        for (String val : map.valueSet()) {
            System.out.println(val);
        }
    }
}
