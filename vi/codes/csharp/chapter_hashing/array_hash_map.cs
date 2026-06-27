/**
 * File: array_hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

/* Key-value pair int->string */
class Pair(int key, string val) {
    public int key = key;
    public string val = val;
}

/* Hash table based on array implementation */
class ArrayHashMap {
    List<Pair?> buckets;
    public ArrayHashMap() {
        // Initialize array with 100 buckets
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

    /* Query operation */
    public string? Get(int key) {
        int index = HashFunc(key);
        Pair? pair = buckets[index];
        if (pair == null) return null;
        return pair.val;
    }

    /* Add operation */
    public void Put(int key, string val) {
        Pair pair = new(key, val);
        int index = HashFunc(key);
        buckets[index] = pair;
    }

    /* Remove operation */
    public void Remove(int key) {
        int index = HashFunc(key);
        // Set to null to represent deletion
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

    /* Print hash table */
    public void Print() {
        foreach (Pair kv in PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
    }
}


public class array_hash_map {
    [Test]
    public void Test() {
        /* Initialize hash table */
        ArrayHashMap map = new();

        /* Add operation */
        // Add key-value pair (key, value) to the hash table
        map.Put(12836, "Xiao Ha");
        map.Put(15937, "Xiao Luo");
        map.Put(16750, "Xiao Suan");
        map.Put(13276, "Xiao Fa");
        map.Put(10583, "Xiao Ya");
        Console.WriteLine("\nAfter adding is complete, hash table is\nKey -> Value");
        map.Print();

        /* Query operation */
        // Input key into hash table to get value
        string? name = map.Get(15937);
        Console.WriteLine("\nInput student ID 15937, query name " + name);

        /* Remove operation */
        // Remove key-value pair (key, value) from hash table
        map.Remove(10583);
        Console.WriteLine("\nAfter removing 10583, hash table is\nKey -> Value");
        map.Print();

        /* Traverse hash table */
        Console.WriteLine("\nTraverse key-value pairs Key->Value");
        foreach (Pair kv in map.PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
        Console.WriteLine("\nTraverse keys only Key");
        foreach (int key in map.KeySet()) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\nTraverse values only Value");
        foreach (string val in map.ValueSet()) {
            Console.WriteLine(val);
        }
    }
}
