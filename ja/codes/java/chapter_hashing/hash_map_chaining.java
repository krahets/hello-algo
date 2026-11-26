/**
 * File: hash_map_chaining.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.ArrayList;
import java.util.List;

/* チェイン法によるハッシュ表 */
class HashMapChaining {
    int size; // キーと値のペアの数
    int capacity; // ハッシュ表の容量
    double loadThres; // 表を拡張する負荷率のしきい値
    int extendRatio; // 容量の拡張倍率
    List<List<Pair>> buckets; // バケットの配列

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

    /* 検索 */
    String get(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // バケットを走査し、key が見つかったら対応する val を返す
        for (Pair pair : bucket) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // key が見つからなければ null を返す
        return null;
    }

    /* 追加 */
    void put(int key, String val) {
        // 負荷率がしきい値を超えたら表を拡張する
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
        for (Pair pair : bucket) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // key がなければ末尾にペアを追加する
        Pair pair = new Pair(key, val);
        bucket.add(pair);
        size++;
    }

    /* 削除 */
    void remove(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // バケットを走査し、該当するペアを削除する
        for (Pair pair : bucket) {
            if (pair.key == key) {
                bucket.remove(pair);
                size--;
                break;
            }
        }
    }

    /* ハッシュ表を拡張する */
    void extend() {
        // 元のハッシュ表を一時保存する
        List<List<Pair>> bucketsTmp = buckets;
        // 拡張後の新しいハッシュ表を初期化する
        capacity *= extendRatio;
        buckets = new ArrayList<>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.add(new ArrayList<>());
        }
        size = 0;
        // 元のハッシュ表から新しい表にペアを移す
        for (List<Pair> bucket : bucketsTmp) {
            for (Pair pair : bucket) {
                put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュ表を表示する */
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
        /* ハッシュ表を初期化する */
        HashMapChaining map = new HashMapChaining();

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
        String name = map.get(13276);
        System.out.println("\n学籍番号 13276 に対応する名前は " + name);

        /* 削除 */
        // ハッシュ表からペア (key, value) を削除する
        map.remove(12836);
        System.out.println("\n12836 を削除した後のハッシュ表\nKey -> Value");
        map.print();
    }
}
