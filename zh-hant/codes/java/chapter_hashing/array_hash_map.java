/**
 * File: array_hash_map.java
 * Created Time: 2022-12-04
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.*;

/* 鍵值對 */
class Pair {
    public int key;
    public String val;

    public Pair(int key, String val) {
        this.key = key;
        this.val = val;
    }
}

/* 以陣列實作的雜湊表 */
class ArrayHashMap {
    private List<Pair> buckets;

    public ArrayHashMap() {
        // 初始化包含 100 個桶的陣列
        buckets = new ArrayList<>();
        for (int i = 0; i < 100; i++) {
            buckets.add(null);
        }
    }

    /* 雜湊函式 */
    private int hashFunc(int key) {
        int index = key % 100;
        return index;
    }

    /* 查詢操作 */
    public String get(int key) {
        int index = hashFunc(key);
        Pair pair = buckets.get(index);
        if (pair == null)
            return null;
        return pair.val;
    }

    /* 新增操作 */
    public void put(int key, String val) {
        Pair pair = new Pair(key, val);
        int index = hashFunc(key);
        buckets.set(index, pair);
    }

    /* 刪除操作 */
    public void remove(int key) {
        int index = hashFunc(key);
        // 設為 null，表示刪除
        buckets.set(index, null);
    }

    /* 取得所有鍵值對 */
    public List<Pair> pairSet() {
        List<Pair> pairSet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                pairSet.add(pair);
        }
        return pairSet;
    }

    /* 取得所有鍵 */
    public List<Integer> keySet() {
        List<Integer> keySet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                keySet.add(pair.key);
        }
        return keySet;
    }

    /* 取得所有值 */
    public List<String> valueSet() {
        List<String> valueSet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                valueSet.add(pair.val);
        }
        return valueSet;
    }

    /* 印出雜湊表 */
    public void print() {
        for (Pair kv : pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
    }
}

public class array_hash_map {
    public static void main(String[] args) {
        /* 初始化雜湊表 */
        ArrayHashMap map = new ArrayHashMap();

        /* 新增操作 */
        // 在雜湊表中新增鍵值對 (key, value)
        map.put(12836, "小哈");
        map.put(15937, "小囉");
        map.put(16750, "小算");
        map.put(13276, "小法");
        map.put(10583, "小鴨");
        System.out.println("\n新增後的雜湊表\nKey -> Value");
        map.print();

        /* 查詢操作 */
        // 輸入鍵 key，從雜湊表取得對應的值 value
        String name = map.get(15937);
        System.out.println("\n輸入學號 15937，查得姓名 " + name);

        /* 刪除操作 */
        // 從雜湊表刪除鍵值對 (key, value)
        map.remove(10583);
        System.out.println("\n刪除 10583 後的雜湊表\nKey -> Value");
        map.print();

        /* 走訪雜湊表 */
        System.out.println("\n走訪鍵值對 Key->Value");
        for (Pair kv : map.pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
        System.out.println("\n只走訪鍵 Key");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\n只走訪值 Value");
        for (String val : map.valueSet()) {
            System.out.println(val);
        }
    }
}
