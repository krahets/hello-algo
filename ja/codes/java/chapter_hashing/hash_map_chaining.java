/**
 * File: hash_map_chaining.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.ArrayList;
import java.util.List;

/* チェイン法ハッシュテーブル */
class HashMapChaining {
    int size; // キーと値のペア数
    int capacity; // ハッシュテーブル容量
    double loadThres; // リサイズを発動する負荷率のしきい値
    int extendRatio; // 拡張倍率
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

    /* 検索操作 */
    String get(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // バケットを走査し、key が見つかれば対応する val を返す
        for (Pair pair : bucket) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // key が見つからない場合は null を返す
        return null;
    }

    /* 追加操作 */
    void put(int key, String val) {
        // 負荷率がしきい値を超えたら、リサイズを実行
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // バケットを走査し、指定した key が見つかれば対応する val を更新して返す
        for (Pair pair : bucket) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // その key が存在しなければ、キーと値のペアを末尾に追加
        Pair pair = new Pair(key, val);
        bucket.add(pair);
        size++;
    }

    /* 削除操作 */
    void remove(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // バケットを走査してキーと値のペアを削除
        for (Pair pair : bucket) {
            if (pair.key == key) {
                bucket.remove(pair);
                size--;
                break;
            }
        }
    }

    /* ハッシュテーブルを拡張 */
    void extend() {
        // 元のハッシュテーブルを一時保存
        List<List<Pair>> bucketsTmp = buckets;
        // リサイズ後の新しいハッシュテーブルを初期化
        capacity *= extendRatio;
        buckets = new ArrayList<>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.add(new ArrayList<>());
        }
        size = 0;
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
        for (List<Pair> bucket : bucketsTmp) {
            for (Pair pair : bucket) {
                put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュテーブルを出力 */
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
        /* ハッシュテーブルを初期化 */
        HashMapChaining map = new HashMapChaining();

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
        String name = map.get(13276);
        System.out.println("\n学籍番号 13276 を入力すると、氏名 " + name);

        /* 削除操作 */
        // ハッシュテーブルからキーと値のペア (key, value) を削除
        map.remove(12836);
        System.out.println("\n12836 を削除すると、ハッシュ表は\nKey -> Value");
        map.print();
    }
}
