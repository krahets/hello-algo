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
        /* ハッシュテーブルを初期化 */
        Map<Integer, String> map = new HashMap<>();

        /* 追加操作 */
        // ハッシュテーブルにキーと値のペア (key, value) を追加
        map.put(12836, "シャオハー");
        map.put(15937, "シャオルオ");
        map.put(16750, "シャオスワン");
        map.put(13276, "シャオファー");
        map.put(10583, "シャオヤー");
        System.out.println("\n追加後のハッシュ表は\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* 検索操作 */
        // キー key をハッシュテーブルに渡し、値 value を取得
        String name = map.get(15937);
        System.out.println("\n学籍番号 15937 を入力すると、氏名 " + name);

        /* 削除操作 */
        // ハッシュテーブルからキーと値のペア (key, value) を削除
        map.remove(10583);
        System.out.println("\n10583 を削除すると、ハッシュ表は\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* ハッシュテーブルを走査 */
        System.out.println("\nキーと値の組 Key->Value を走査");
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        System.out.println("\nキー Key のみを走査");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\n値 Value のみを走査");
        for (String val : map.values()) {
            System.out.println(val);
        }
    }
}
