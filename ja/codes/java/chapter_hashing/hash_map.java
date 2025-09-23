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
        // ハッシュテーブルにキー値ペア (key, value) を追加
        map.put(12836, "Ha");
        map.put(15937, "Luo");
        map.put(16750, "Suan");
        map.put(13276, "Fa");
        map.put(10583, "Ya");
        System.out.println("\n追加後、ハッシュテーブルは\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* 検索操作 */
        // ハッシュテーブルにキーを入力し、値を取得
        String name = map.get(15937);
        System.out.println("\n学生番号 15937 を入力し、名前 " + name + " を見つけました");

        /* 削除操作 */
        // ハッシュテーブルからキー値ペア (key, value) を削除
        map.remove(10583);
        System.out.println("\n10583 を削除後、ハッシュテーブルは\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* ハッシュテーブルの走査 */
        System.out.println("\nキー値ペアを走査 Key->Value");
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        System.out.println("\nキーを個別に走査 Key");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\n値を個別に走査 Value");
        for (String val : map.values()) {
            System.out.println(val);
        }
    }
}