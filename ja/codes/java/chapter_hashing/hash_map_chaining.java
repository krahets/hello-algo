/**
 * File: hash_map_chaining.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.ArrayList;
import java.util.List;

/* チェイン法のハッシュテーブル */
class HashMapChaining {
    int size; // キーと値のペアの数
    int capacity; // ハッシュテーブルの容量
    double loadThres; // 容量の拡張を開始する負荷率のしきい値
    int extendRatio; // 容量の拡張倍率
    List<List<Pair>> buckets; // バケット配列

    /* コンストラクタ */
    public HashMapChaining() {
        size = 0;
        capacity = 4;
        loadThres = 2.0 / 3.0;
        extendRatio = 2;
        buckets = new ArrayList<>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.add(new ArrayList<>());
        }
    }

    /* ハッシュ関数 */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* 負荷率 */
    double loadFactor() {
        return (double) size / capacity;
    }

    /* 取得操作 */
    String get(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // バケットを走査し、key が見つかったら対応する val を返す
        for (Pair pair : bucket) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // key が見つからなかった場合、null を返す
        return null;
    }

    /* 追加操作 */
    void put(int key, String val) {
        // 負荷率がしきい値を超えた場合、容量を拡張する
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // バケットを走査し、指定された key が見つかったら、対応する val を更新して戻る
        for (Pair pair : bucket) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // key が存在しない場合、キーと値のペアを末尾に追加する
        Pair pair = new Pair(key, val);
        bucket.add(pair);
        size++;
    }

    /* 削除操作 */
    void remove(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // バケットを走査し、キーと値のペアを削除する
        for (Pair pair : bucket) {
            if (pair.key == key) {
                bucket.remove(pair);
                size--;
                break;
            }
        }
    }

    /* ハッシュテーブルの容量を拡張する */
    void extend() {
        // 元のハッシュテーブルを一時保存する
        List<List<Pair>> bucketsTmp = buckets;
        // 拡張後の新しいハッシュテーブルを初期化する
        capacity *= extendRatio;
        buckets = new ArrayList<>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.add(new ArrayList<>());
        }
        size = 0;
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
        for (List<Pair> bucket : bucketsTmp) {
            for (Pair pair : bucket) {
                put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュテーブルを表示する */
    void print() {
        for (List<Pair> bucket : buckets) {
            List<String> res = new ArrayList<>();
            for (Pair pair : bucket) {
                res.add(pair.key + " -> " + pair.val);
            }
            System.out.println(res);
        }
    }
}

public class hash_map_chaining {
    public static void main(String[] args) {
        /* ハッシュテーブルを初期化する */
        HashMapChaining map = new HashMapChaining();

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
        String name = map.get(13276);
        System.out.println("\n学生番号 13276 に対応する氏名は " + name);

        /* 削除操作 */
        // ハッシュテーブルからキーと値のペア (key, value) を削除する
        map.remove(12836);
        System.out.println("\n12836 を削除した後のハッシュテーブル\nKey -> Value");
        map.print();
    }
}
