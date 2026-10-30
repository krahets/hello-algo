/**
 * File: array_hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

/* Key-value pair: int->string */
class Pair(int key, string val) {
    public int key = key;
    public string val = val;
}

/* Hash table implemented with an array */
class ArrayHashMap {
    List<Pair?> buckets;
    public ArrayHashMap() {
        // Initialize an array containing 100 buckets
        buckets = [];
        for (int i = 0; i < 100; i++) {
            buckets.Add(null);
        }
    }

    /* Hash function */
    int HashFunc(int key) {
        int index = key % 100;
        return index;
    }

    /* Lookup operation */
    public string? Get(int key) {
        int index = HashFunc(key);
        Pair? pair = buckets[index];
        if (pair == null) return null;
        return pair.val;
    }

    /* Insert operation */
    public void Put(int key, string val) {
        Pair pair = new(key, val);
        int index = HashFunc(key);
        buckets[index] = pair;
    }

    /* Remove operation */
    public void Remove(int key) {
        int index = HashFunc(key);
        // Set the bucket to null to mark it as removed
        buckets[index] = null;
    }

    /* Get all key-value pairs */
    public List<Pair> PairSet() {
        List<Pair> pairSet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                pairSet.Add(pair);
        }
        return pairSet;
    }

    /* Get all keys */
    public List<int> KeySet() {
        List<int> keySet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                keySet.Add(pair.key);
        }
        return keySet;
    }

    /* Get all values */
    public List<string> ValueSet() {
        List<string> valueSet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                valueSet.Add(pair.val);
        }
        return valueSet;
    }

    /* Print the hash table */
    public void Print() {
        foreach (Pair kv in PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
    }
}


public class array_hash_map {
    [Test]
    public void Test() {
        /* Initialize the hash table */
        ArrayHashMap map = new();

        /* Insert operation */
        // Insert the key-value pair (key, value) into the hash table
        map.Put(12836, "小哈");
        map.Put(15937, "小啰");
        map.Put(16750, "小算");
        map.Put(13276, "小法");
        map.Put(10583, "小鸭");
        Console.WriteLine("\nHash table after insertion:\nKey -> Value");
        map.Print();

        /* Lookup operation */
        // Look up key in the hash table to obtain value
        string? name = map.Get(15937);
        Console.WriteLine("\nLook up student ID 15937 to obtain the name " + name);

        /* Remove operation */
        // Remove the key-value pair (key, value) from the hash table
        map.Remove(10583);
        Console.WriteLine("\nHash table after removing 10583:\nKey -> Value");
        map.Print();

        /* Traverse the hash table */
        Console.WriteLine("\nTraverse key-value pairs: Key->Value");
        foreach (Pair kv in map.PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
        Console.WriteLine("\nTraverse keys only: Key");
        foreach (int key in map.KeySet()) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\nTraverse values only: Value");
        foreach (string val in map.ValueSet()) {
            Console.WriteLine(val);
        }
    }
}
