
/**
 * File: hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

public class hash_map {
    [Test]
    public void Test() {
        /* Initialize the hash table */
        Dictionary<int, string> map = new() {
            /* Insert operation */
            // Insert the key-value pair (key, value) into the hash table
            { 12836, "小哈" },
            { 15937, "小啰" },
            { 16750, "小算" },
            { 13276, "小法" },
            { 10583, "小鸭" }
        };
        Console.WriteLine("\nHash table after insertion:\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        /* Lookup operation */
        // Look up key in the hash table to obtain value
        string name = map[15937];
        Console.WriteLine("\nLook up student ID 15937 to obtain the name " + name);

        /* Remove operation */
        // Remove the key-value pair (key, value) from the hash table
        map.Remove(10583);
        Console.WriteLine("\nHash table after removing 10583:\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        /* Traverse the hash table */
        Console.WriteLine("\nTraverse key-value pairs: Key->Value");
        foreach (var kv in map) {
            Console.WriteLine(kv.Key + " -> " + kv.Value);
        }
        Console.WriteLine("\nTraverse keys only: Key");
        foreach (int key in map.Keys) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\nTraverse values only: Value");
        foreach (string val in map.Values) {
            Console.WriteLine(val);
        }
    }
}
