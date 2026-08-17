
/**
 * File: hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

public class hash_map {
    [Test]
    public void Test() {
        /* Initialize hash table */
        Dictionary<int, string> map = new() {
            /* Add operation */
            // Add key-value pair (key, value) to the hash table
            { 12836, "Xiao Ha" },
            { 15937, "Xiao Luo" },
            { 16750, "Xiao Suan" },
            { 13276, "Xiao Fa" },
            { 10583, "Xiao Ya" }
        };
        Console.WriteLine("\nAfter adding is complete, hash table is\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        /* Query operation */
        // Input key into hash table to get value
        string name = map[15937];
        Console.WriteLine("\nInput student ID 15937, query name " + name);

        /* Remove operation */
        // Remove key-value pair (key, value) from hash table
        map.Remove(10583);
        Console.WriteLine("\nAfter removing 10583, hash table is\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        /* Traverse hash table */
        Console.WriteLine("\nTraverse key-value pairs Key->Value");
        foreach (var kv in map) {
            Console.WriteLine(kv.Key + " -> " + kv.Value);
        }
        Console.WriteLine("\nTraverse keys only Key");
        foreach (int key in map.Keys) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\nTraverse values only Value");
        foreach (string val in map.Values) {
            Console.WriteLine(val);
        }
    }
}
