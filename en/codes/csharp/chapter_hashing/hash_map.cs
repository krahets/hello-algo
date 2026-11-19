
/**
 * File: hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

public class hash_map {
    [Test]
    public void Test() {
        // [region]{init_hash_map}
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
        // [endregion]{init_hash_map}
        Console.WriteLine("\nHash table after insertion:\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        // [region]{get_value}
        /* Lookup operation */
        // Look up key in the hash table to obtain value
        string name = map[15937];
        // [endregion]{get_value}
        Console.WriteLine("\nLook up student ID 15937 to obtain the name " + name);

        // [region]{remove_pair}
        /* Remove operation */
        // Remove the key-value pair (key, value) from the hash table
        map.Remove(10583);
        // [endregion]{remove_pair}
        Console.WriteLine("\nHash table after removing 10583:\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        Console.WriteLine("\nTraverse key-value pairs: Key->Value");
        // [region]{iterate_pairs}
        /* Traverse the hash table */
        // Traverse key-value pairs: key->value
        foreach (var kv in map) {
            Console.WriteLine(kv.Key + " -> " + kv.Value);
        }
        // [endregion]{iterate_pairs}

        Console.WriteLine("\nTraverse keys only: Key");
        // [region]{iterate_keys}
        // Traverse keys only: key
        foreach (int key in map.Keys) {
            Console.WriteLine(key);
        }
        // [endregion]{iterate_keys}

        Console.WriteLine("\nTraverse values only: Value");
        // [region]{iterate_values}
        // Traverse values only: value
        foreach (string val in map.Values) {
            Console.WriteLine(val);
        }
        // [endregion]{iterate_values}
    }
}
