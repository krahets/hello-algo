/**
 * File: array_hash_map.java
 * Created Time: 2022-12-04
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.*;

/* キー値ペア */
class Pair {
    public int key;
    public String val;

    public Pair(int key, String val) {
        this.key = key;
        this.val = val;
    }
}

/* 配列実装に基づくハッシュテーブル */
class ArrayHashMap {
    private List<Pair> buckets;

    public ArrayHashMap() {
        // 100個のバケットを含む配列を初期化
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

    /* クエリ操作 */
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
        // nullに設定して削除を示す
        buckets.set(index, null);
    }

    /* すべてのキー値ペアを取得 */
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

    /* ハッシュテーブルを印刷 */
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
        // ハッシュテーブルにキー値ペア (key, value) を追加
        map.put(12836, "Ha");
        map.put(15937, "Luo");
        map.put(16750, "Suan");
        map.put(13276, "Fa");
        map.put(10583, "Ya");
        System.out.println("\n追加後のハッシュテーブル\nKey -> Value");
        map.print();

        /* クエリ操作 */
        // ハッシュテーブルにキーを入力して値を取得
        String name = map.get(15937);
        System.out.println("\n学生ID 15937を入力、名前 " + name + " を見つけました");

        /* 削除操作 */
        // ハッシュテーブルからキー値ペア (key, value) を削除
        map.remove(10583);
        System.out.println("\n10583を削除後のハッシュテーブル\nKey -> Value");
        map.print();

        /* ハッシュテーブルを走査 */
        System.out.println("\nキー値ペアを走査 Key->Value");
        for (Pair kv : map.pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
        System.out.println("\nキーを個別に走査 Key");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\n値を個別に走査 Value");
        for (String val : map.valueSet()) {
            System.out.println(val);
        }
    }
}