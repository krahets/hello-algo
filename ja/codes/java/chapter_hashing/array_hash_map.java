/**
 * File: array_hash_map.java
 * Created Time: 2022-12-04
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.*;

/* キーと値の組 */
class Pair {
    public int key;
    public String val;

    public Pair(int key, String val) {
        this.key = key;
        this.val = val;
    }
}

/* 配列ベースのハッシュテーブル */
class ArrayHashMap {
    private List<Pair> buckets;

    public ArrayHashMap() {
        // 100 個のバケットを含む配列を初期化
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

    /* 検索操作 */
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
        // null に設定し、削除を表す
        buckets.set(index, null);
    }

    /* すべてのキーと値のペアを取得 */
    public List<Pair> pairSet() {
        List<Pair> pairSet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                pairSet.add(pair);
        }
        return pairSet;
    }

    /* すべてのキーを取得 */
    public List<Integer> keySet() {
        List<Integer> keySet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                keySet.add(pair.key);
        }
        return keySet;
    }

    /* すべての値を取得 */
    public List<String> valueSet() {
        List<String> valueSet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                valueSet.add(pair.val);
        }
        return valueSet;
    }

    /* ハッシュテーブルを出力 */
    public void print() {
        for (Pair kv : pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
    }
}

public class array_hash_map {
    public static void main(String[] args) {
        /* ハッシュテーブルを初期化 */
        ArrayHashMap map = new ArrayHashMap();

        /* 追加操作 */
        // ハッシュテーブルにキーと値のペア (key, value) を追加
        map.put(12836, "シャオハー");
        map.put(15937, "シャオルオ");
        map.put(16750, "シャオスワン");
        map.put(13276, "シャオファー");
        map.put(10583, "シャオヤー");
        System.out.println("\n追加後のハッシュ表は\nKey -> Value");
        map.print();

        /* 検索操作 */
        // キー key をハッシュテーブルに渡し、値 value を取得
        String name = map.get(15937);
        System.out.println("\n学籍番号 15937 を入力すると、氏名 " + name);

        /* 削除操作 */
        // ハッシュテーブルからキーと値のペア (key, value) を削除
        map.remove(10583);
        System.out.println("\n10583 を削除すると、ハッシュ表は\nKey -> Value");
        map.print();

        /* ハッシュテーブルを走査 */
        System.out.println("\nキーと値の組 Key->Value を走査");
        for (Pair kv : map.pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
        System.out.println("\nキー Key のみを走査");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\n値 Value のみを走査");
        for (String val : map.valueSet()) {
            System.out.println(val);
        }
    }
}
