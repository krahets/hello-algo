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
        /* ハッシュテーブルを初期化する */
        Map<Integer, String> map = new HashMap<>();

        /* 追加操作 */
        // ハッシュテーブルにキーと値のペア (key, value) を追加する
        map.put(12836, "小哈");
        map.put(15937, "小啰");
        map.put(16750, "小算");
        map.put(13276, "小法");
        map.put(10583, "小鸭");
        System.out.println("\n追加後のハッシュテーブル\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* 取得操作 */
        // ハッシュテーブルにキー key を渡し、値 value を取得する
        String name = map.get(15937);
        System.out.println("\n学生番号 15937 に対応する氏名は " + name);

        /* 削除操作 */
        // ハッシュテーブルからキーと値のペア (key, value) を削除する
        map.remove(10583);
        System.out.println("\n10583 を削除した後のハッシュテーブル\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* ハッシュテーブルを走査する */
        System.out.println("\nキーと値のペア Key->Value を走査する");
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        System.out.println("\nキー Key だけを走査する");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\n値 Value だけを走査する");
        for (String val : map.values()) {
            System.out.println(val);
        }
    }
}
