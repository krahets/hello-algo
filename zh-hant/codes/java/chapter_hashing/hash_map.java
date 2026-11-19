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
        /* 初始化雜湊表 */
        Map<Integer, String> map = new HashMap<>();
        // [endregion]{init_hash_map}

        // [region]{add_pairs}
        /* 新增操作 */
        // 在雜湊表中新增鍵值對 (key, value)
        map.put(12836, "小哈");
        map.put(15937, "小囉");
        map.put(16750, "小算");
        map.put(13276, "小法");
        map.put(10583, "小鴨");
        // [endregion]{add_pairs}
        System.out.println("\n新增完成後，雜湊表為\nKey -> Value");
        PrintUtil.printHashMap(map);

        // [region]{get_value}
        /* 查詢操作 */
        // 向雜湊表中輸入鍵 key ，得到值 value
        String name = map.get(15937);
        // [endregion]{get_value}
        System.out.println("\n輸入學號 15937 ，查詢到姓名 " + name);

        // [region]{remove_pair}
        /* 刪除操作 */
        // 在雜湊表中刪除鍵值對 (key, value)
        map.remove(10583);
        // [endregion]{remove_pair}
        System.out.println("\n刪除 10583 後，雜湊表為\nKey -> Value");
        PrintUtil.printHashMap(map);

        System.out.println("\n走訪鍵值對 Key->Value");
        // [region]{iterate_pairs}
        /* 走訪雜湊表 */
        // 走訪鍵值對 key->value
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        // [endregion]{iterate_pairs}

        System.out.println("\n單獨走訪鍵 Key");
        // [region]{iterate_keys}
        // 單獨走訪鍵 key
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        // [endregion]{iterate_keys}

        System.out.println("\n單獨走訪值 Value");
        // [region]{iterate_values}
        // 單獨走訪值 value
        for (String val : map.values()) {
            System.out.println(val);
        }
        // [endregion]{iterate_values}
    }
}
