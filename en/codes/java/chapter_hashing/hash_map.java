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

        /* Insert operation */
        // Insert the key-value pair (key, value) into the hash table
        map.put(12836, "小哈");
        map.put(15937, "小啰");
        map.put(16750, "小算");
        map.put(13276, "小法");
        map.put(10583, "小鸭");
        System.out.println("\nHash table after insertion:\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* Lookup operation */
        // Look up key in the hash table to obtain value
        String name = map.get(15937);
        System.out.println("\nLook up student ID 15937 to obtain the name " + name);

        /* Remove operation */
        // Remove the key-value pair (key, value) from the hash table
        map.remove(10583);
        System.out.println("\nHash table after removing 10583:\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* Traverse the hash table */
        System.out.println("\nTraverse key-value pairs: Key->Value");
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        System.out.println("\nTraverse keys only: Key");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\nTraverse values only: Value");
        for (String val : map.values()) {
            System.out.println(val);
        }
    }
}
