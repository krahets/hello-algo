/**
 * File: array_hash_map.java
 * Created Time: 2022-12-04
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.*;

/* キーと値のペア */
class Pair {
    public int key;
    public String val;

    public Pair(int key, String val) {
        this.key = key;
        this.val = val;
    }
}

/* 配列で実装したハッシュテーブル */
class ArrayHashMap {
    private List<Pair> buckets;

    public ArrayHashMap() {
        // 100 個のバケットを含む配列を初期化する
        buckets = new ArrayList<>();
        for (int i = 0; i < 100; i++) {
            buckets.add(null);
        }
    }

    /* ハッシュ関数 */
    private int hashFunc(int key) {
        int index = key % 100;
        return index;
    }

    /* 取得操作 */
    public String get(int key) {
        int index = hashFunc(key);
        Pair pair = buckets.get(index);
        if (pair == null)
            return null;
        return pair.val;
    }

    /* 追加操作 */
    public void put(int key, String val) {
        Pair pair = new Pair(key, val);
        int index = hashFunc(key);
        buckets.set(index, pair);
    }

    /* 削除操作 */
    public void remove(int key) {
        int index = hashFunc(key);
        // null に設定して、削除を表す
        buckets.set(index, null);
    }

    /* キーと値のペアをすべて取得する */
    public List<Pair> pairSet() {
        List<Pair> pairSet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                pairSet.add(pair);
        }
        return pairSet;
    }

    /* すべてのキーを取得する */
    public List<Integer> keySet() {
        List<Integer> keySet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                keySet.add(pair.key);
        }
        return keySet;
    }

    /* すべての値を取得する */
    public List<String> valueSet() {
        List<String> valueSet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                valueSet.add(pair.val);
        }
        return valueSet;
    }

    /* ハッシュテーブルを表示する */
    public void print() {
        for (Pair kv : pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
    }
}

public class array_hash_map {
    public static void main(String[] args) {
        /* ハッシュテーブルを初期化する */
        ArrayHashMap map = new ArrayHashMap();

        /* 追加操作 */
        // ハッシュテーブルにキーと値のペア (key, value) を追加する
        map.put(12836, "小哈");
        map.put(15937, "小啰");
        map.put(16750, "小算");
        map.put(13276, "小法");
        map.put(10583, "小鸭");
        System.out.println("\n追加後のハッシュテーブル\nKey -> Value");
        map.print();

        /* 取得操作 */
        // ハッシュテーブルにキー key を渡し、値 value を取得する
        String name = map.get(15937);
        System.out.println("\n学生番号 15937 に対応する氏名は " + name);

        /* 削除操作 */
        // ハッシュテーブルからキーと値のペア (key, value) を削除する
        map.remove(10583);
        System.out.println("\n10583 を削除した後のハッシュテーブル\nKey -> Value");
        map.print();

        /* ハッシュテーブルを走査する */
        System.out.println("\nキーと値のペア Key->Value を走査する");
        for (Pair kv : map.pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
        System.out.println("\nキー Key だけを走査する");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\n値 Value だけを走査する");
        for (String val : map.valueSet()) {
            System.out.println(val);
        }
    }
}
