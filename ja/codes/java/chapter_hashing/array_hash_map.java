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

/* 配列で実装したハッシュ表 */
class ArrayHashMap {
    private List<Pair> buckets;

    public ArrayHashMap() {
        // 100 個のバケットを持つ配列を初期化する
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

    /* 検索 */
    public String get(int key) {
        int index = hashFunc(key);
        Pair pair = buckets.get(index);
        if (pair == null)
            return null;
        return pair.val;
    }

    /* 追加 */
    public void put(int key, String val) {
        Pair pair = new Pair(key, val);
        int index = hashFunc(key);
        buckets.set(index, pair);
    }

    /* 削除 */
    public void remove(int key) {
        int index = hashFunc(key);
        // null を代入して削除する
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

    /* ハッシュ表を表示する */
    public void print() {
        for (Pair kv : pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
    }
}

public class array_hash_map {
    public static void main(String[] args) {
        /* ハッシュ表を初期化する */
        ArrayHashMap map = new ArrayHashMap();

        /* 追加 */
        // ハッシュ表にペア (key, value) を追加する
        map.put(12836, "小哈");
        map.put(15937, "小啰");
        map.put(16750, "小算");
        map.put(13276, "小法");
        map.put(10583, "小鸭");
        System.out.println("\n追加後のハッシュ表\nKey -> Value");
        map.print();

        /* 検索 */
        // ハッシュ表でキー key に対応する値 value を取得する
        String name = map.get(15937);
        System.out.println("\n学籍番号 15937 に対応する名前は " + name);

        /* 削除 */
        // ハッシュ表からペア (key, value) を削除する
        map.remove(10583);
        System.out.println("\n10583 を削除した後のハッシュ表\nKey -> Value");
        map.print();

        /* ハッシュ表を走査する */
        System.out.println("\nキーと値のペアを順に表示 Key->Value");
        for (Pair kv : map.pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
        System.out.println("\nキーだけを順に表示 Key");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\n値だけを順に表示 Value");
        for (String val : map.valueSet()) {
            System.out.println(val);
        }
    }
}
