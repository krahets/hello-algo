
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
            { 12836, "Ha" },
            { 15937, "Luo" },
            { 16750, "Suan" },
            { 13276, "Fa" },
            { 10583, "Ya" }
        };
        Console.WriteLine("\nAfter adding, the hash table is\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        /* Query operation */
        // Enter key to the hash table, get value
        string name = map[15937];
        Console.WriteLine("\nEnter student ID 15937, found name " + name);

        /* Remove operation */
        // Remove key-value pair (key, value) from the hash table
        map.Remove(10583);
        Console.WriteLine("\nAfter removing 10583, the hash table is\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        /* Traverse hash table */
        Console.WriteLine("\nTraverse key-value pairs Key->Value");
        foreach (var kv in map) {
            Console.WriteLine(kv.Key + " -> " + kv.Value);
        }
        Console.WriteLine("\nIndividually traverse keys Key");
        foreach (int key in map.Keys) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\nIndividually traverse values Value");
        foreach (string val in map.Values) {
            Console.WriteLine(val);
        }
    }
}
