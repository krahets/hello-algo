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
        /* 初始化哈希表 */
        Map<Integer, String> map = new HashMap<>();
        // [endregion]{init_hash_map}

        // [region]{add_pairs}
        /* 添加操作 */
        // 在哈希表中添加键值对 (key, value)
        map.put(12836, "小哈");
        map.put(15937, "小啰");
        map.put(16750, "小算");
        map.put(13276, "小法");
        map.put(10583, "小鸭");
        // [endregion]{add_pairs}
        System.out.println("\n添加完成后，哈希表为\nKey -> Value");
        PrintUtil.printHashMap(map);

        // [region]{get_value}
        /* 查询操作 */
        // 向哈希表中输入键 key ，得到值 value
        String name = map.get(15937);
        // [endregion]{get_value}
        System.out.println("\n输入学号 15937 ，查询到姓名 " + name);

        // [region]{remove_pair}
        /* 删除操作 */
        // 在哈希表中删除键值对 (key, value)
        map.remove(10583);
        // [endregion]{remove_pair}
        System.out.println("\n删除 10583 后，哈希表为\nKey -> Value");
        PrintUtil.printHashMap(map);

        System.out.println("\n遍历键值对 Key->Value");
        // [region]{iterate_pairs}
        /* 遍历哈希表 */
        // 遍历键值对 key->value
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        // [endregion]{iterate_pairs}

        System.out.println("\n单独遍历键 Key");
        // [region]{iterate_keys}
        // 单独遍历键 key
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        // [endregion]{iterate_keys}

        System.out.println("\n单独遍历值 Value");
        // [region]{iterate_values}
        // 单独遍历值 value
        for (String val : map.values()) {
            System.out.println(val);
        }
        // [endregion]{iterate_values}
    }
}
