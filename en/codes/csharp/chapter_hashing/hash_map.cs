
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
            /* Insert a key-value pair */
            // Insert the pair (key, value) into the hash table
            { 12836, "Xiao Ha" },
            { 15937, "Xiao Luo" },
            { 16750, "Xiao Suan" },
            { 13276, "Xiao Fa" },
            { 10583, "Xiao Ya" }
        };
        Console.WriteLine("\nHash table after insertion:\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        /* Look up a value */
        // Look up key in the hash table to get value
        string name = map[15937];
        Console.WriteLine("\nName for student ID 15937: " + name);

        /* Remove a key-value pair */
        // Remove the pair (key, value) from the hash table
        map.Remove(10583);
        Console.WriteLine("\nHash table after removing 10583:\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        /* Iterate over the hash table */
        Console.WriteLine("\nIterate over key-value pairs (Key->Value)");
        foreach (var kv in map) {
            Console.WriteLine(kv.Key + " -> " + kv.Value);
        }
        Console.WriteLine("\nIterate over keys only");
        foreach (int key in map.Keys) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\nIterate over values only");
        foreach (string val in map.Values) {
            Console.WriteLine(val);
        }
    }
}
