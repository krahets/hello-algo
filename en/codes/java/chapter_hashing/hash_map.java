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
        /* Initialize hash table */
        Map<Integer, String> map = new HashMap<>();

        /* Add operation */
        // Add key-value pair (key, value) to the hash table
        map.put(12836, "Ha");
        map.put(15937, "Luo");
        map.put(16750, "Suan");
        map.put(13276, "Fa");
        map.put(10583, "Ya");
        System.out.println("\nAfter adding, the hash table is\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* Query operation */
        // Enter key to the hash table, get value
        String name = map.get(15937);
        System.out.println("\nEnter student ID 15937, found name " + name);

        /* Remove operation */
        // Remove key-value pair (key, value) from the hash table
        map.remove(10583);
        System.out.println("\nAfter removing 10583, the hash table is\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* Traverse hash table */
        System.out.println("\nTraverse key-value pairs Key->Value");
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        System.out.println("\nIndividually traverse keys Key");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\nIndividually traverse values Value");
        for (String val : map.values()) {
            System.out.println(val);
        }
    }
}
