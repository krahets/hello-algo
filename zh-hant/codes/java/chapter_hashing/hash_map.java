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
        /* 初始化雜湊表 */
        Map<Integer, String> map = new HashMap<>();

        /* 新增操作 */
        // 在雜湊表中新增鍵值對 (key, value)
        map.put(12836, "小哈");
        map.put(15937, "小囉");
        map.put(16750, "小算");
        map.put(13276, "小法");
        map.put(10583, "小鴨");
        System.out.println("\n新增後的雜湊表\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* 查詢操作 */
        // 輸入鍵 key，從雜湊表取得對應的值 value
        String name = map.get(15937);
        System.out.println("\n輸入學號 15937，查得姓名 " + name);

        /* 刪除操作 */
        // 從雜湊表刪除鍵值對 (key, value)
        map.remove(10583);
        System.out.println("\n刪除 10583 後的雜湊表\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* 走訪雜湊表 */
        System.out.println("\n走訪鍵值對 Key->Value");
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        System.out.println("\n只走訪鍵 Key");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\n只走訪值 Value");
        for (String val : map.values()) {
            System.out.println(val);
        }
    }
}
