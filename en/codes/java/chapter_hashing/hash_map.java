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
        // [region]{init_hash_map}
        /* Initialize the hash table */
        Map<Integer, String> map = new HashMap<>();
        // [endregion]{init_hash_map}

        // [region]{add_pairs}
        /* Insert operation */
        // Insert the key-value pair (key, value) into the hash table
        map.put(12836, "小哈");
        map.put(15937, "小啰");
        map.put(16750, "小算");
        map.put(13276, "小法");
        map.put(10583, "小鸭");
        // [endregion]{add_pairs}
        System.out.println("\nHash table after insertion:\nKey -> Value");
        PrintUtil.printHashMap(map);

        // [region]{get_value}
        /* Lookup operation */
        // Look up key in the hash table to obtain value
        String name = map.get(15937);
        // [endregion]{get_value}
        System.out.println("\nLook up student ID 15937 to obtain the name " + name);

        // [region]{remove_pair}
        /* Remove operation */
        // Remove the key-value pair (key, value) from the hash table
        map.remove(10583);
        // [endregion]{remove_pair}
        System.out.println("\nHash table after removing 10583:\nKey -> Value");
        PrintUtil.printHashMap(map);

        System.out.println("\nTraverse key-value pairs: Key->Value");
        // [region]{iterate_pairs}
        /* Traverse the hash table */
        // Traverse key-value pairs: key->value
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        // [endregion]{iterate_pairs}

        System.out.println("\nTraverse keys only: Key");
        // [region]{iterate_keys}
        // Traverse keys only: key
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        // [endregion]{iterate_keys}

        System.out.println("\nTraverse values only: Value");
        // [region]{iterate_values}
        // Traverse values only: value
        for (String val : map.values()) {
            System.out.println(val);
        }
        // [endregion]{iterate_values}
    }
}
