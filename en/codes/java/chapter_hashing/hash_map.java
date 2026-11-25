/**
 * File: hash_map.java
 * Created Time: 2022-12-04
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.*;
import utils.*;

public class hash_map {
    public static void main(String[] args) {
        /* Initialize the hash table */
        Map<Integer, String> map = new HashMap<>();

        /* Insert a key-value pair */
        // Insert the pair (key, value) into the hash table
        map.put(12836, "Xiao Ha");
        map.put(15937, "Xiao Luo");
        map.put(16750, "Xiao Suan");
        map.put(13276, "Xiao Fa");
        map.put(10583, "Xiao Ya");
        System.out.println("\nHash table after insertion:\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* Look up a value */
        // Look up key in the hash table to get value
        String name = map.get(15937);
        System.out.println("\nName for student ID 15937: " + name);

        /* Remove a key-value pair */
        // Remove the pair (key, value) from the hash table
        map.remove(10583);
        System.out.println("\nHash table after removing 10583:\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* Iterate over the hash table */
        System.out.println("\nIterate over key-value pairs (Key->Value)");
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        System.out.println("\nIterate over keys only");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\nIterate over values only");
        for (String val : map.values()) {
            System.out.println(val);
        }
    }
}
