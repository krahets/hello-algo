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
        /* ハッシュテーブルを初期化する */
        Map<Integer, String> map = new HashMap<>();
        // [endregion]{init_hash_map}

        // [region]{add_pairs}
        /* 追加操作 */
        // ハッシュテーブルにキーと値のペア (key, value) を追加する
        map.put(12836, "小哈");
        map.put(15937, "小啰");
        map.put(16750, "小算");
        map.put(13276, "小法");
        map.put(10583, "小鸭");
        // [endregion]{add_pairs}
        System.out.println("\n追加後のハッシュテーブル\nKey -> Value");
        PrintUtil.printHashMap(map);

        // [region]{get_value}
        /* 取得操作 */
        // ハッシュテーブルにキー key を渡し、値 value を取得する
        String name = map.get(15937);
        // [endregion]{get_value}
        System.out.println("\n学生番号 15937 に対応する氏名は " + name);

        // [region]{remove_pair}
        /* 削除操作 */
        // ハッシュテーブルからキーと値のペア (key, value) を削除する
        map.remove(10583);
        // [endregion]{remove_pair}
        System.out.println("\n10583 を削除した後のハッシュテーブル\nKey -> Value");
        PrintUtil.printHashMap(map);

        System.out.println("\nキーと値のペア Key->Value を走査する");
        // [region]{iterate_pairs}
        /* ハッシュテーブルを走査する */
        // キーと値のペア key->value を走査する
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        // [endregion]{iterate_pairs}

        System.out.println("\nキー Key だけを走査する");
        // [region]{iterate_keys}
        // キー key だけを走査する
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        // [endregion]{iterate_keys}

        System.out.println("\n値 Value だけを走査する");
        // [region]{iterate_values}
        // 値 value だけを走査する
        for (String val : map.values()) {
            System.out.println(val);
        }
        // [endregion]{iterate_values}
    }
}
