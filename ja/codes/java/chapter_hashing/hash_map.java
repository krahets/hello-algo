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
        /* ハッシュ表を初期化する */
        Map<Integer, String> map = new HashMap<>();

        /* 追加 */
        // ハッシュ表にペア (key, value) を追加する
        map.put(12836, "小哈");
        map.put(15937, "小啰");
        map.put(16750, "小算");
        map.put(13276, "小法");
        map.put(10583, "小鸭");
        System.out.println("\n追加後のハッシュ表\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* 検索 */
        // ハッシュ表でキー key に対応する値 value を取得する
        String name = map.get(15937);
        System.out.println("\n学籍番号 15937 に対応する名前は " + name);

        /* 削除 */
        // ハッシュ表からペア (key, value) を削除する
        map.remove(10583);
        System.out.println("\n10583 を削除した後のハッシュ表\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* ハッシュ表を走査する */
        System.out.println("\nキーと値のペアを順に表示 Key->Value");
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        System.out.println("\nキーだけを順に表示 Key");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\n値だけを順に表示 Value");
        for (String val : map.values()) {
            System.out.println(val);
        }
    }
}
