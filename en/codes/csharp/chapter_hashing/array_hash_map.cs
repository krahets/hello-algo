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

/* Array-based hash table */
class ArrayHashMap {
    List<Pair?> buckets;
    public ArrayHashMap() {
        // Initialize an array with 100 buckets
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

    /* Look up a value */
    public string? Get(int key) {
        int index = HashFunc(key);
        Pair? pair = buckets[index];
        if (pair == null) return null;
        return pair.val;
    }

    /* Insert a key-value pair */
    public void Put(int key, string val) {
        Pair pair = new(key, val);
        int index = HashFunc(key);
        buckets[index] = pair;
    }

    /* Remove a key-value pair */
    public void Remove(int key) {
        int index = HashFunc(key);
        // Set the slot to null to remove the entry
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

        /* Insert a key-value pair */
        // Insert the pair (key, value) into the hash table
        map.Put(12836, "Xiao Ha");
        map.Put(15937, "Xiao Luo");
        map.Put(16750, "Xiao Suan");
        map.Put(13276, "Xiao Fa");
        map.Put(10583, "Xiao Ya");
        Console.WriteLine("\nHash table after insertion:\nKey -> Value");
        map.Print();

        /* Look up a value */
        // Look up key in the hash table to get value
        string? name = map.Get(15937);
        Console.WriteLine("\nName for student ID 15937: " + name);

        /* Remove a key-value pair */
        // Remove the pair (key, value) from the hash table
        map.Remove(10583);
        Console.WriteLine("\nHash table after removing 10583:\nKey -> Value");
        map.Print();

        /* Iterate over the hash table */
        Console.WriteLine("\nIterate over key-value pairs (Key->Value)");
        foreach (Pair kv in map.PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
        Console.WriteLine("\nIterate over keys only");
        foreach (int key in map.KeySet()) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\nIterate over values only");
        foreach (string val in map.ValueSet()) {
            Console.WriteLine(val);
        }
    }
}
