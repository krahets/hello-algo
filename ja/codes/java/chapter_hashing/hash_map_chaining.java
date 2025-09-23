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
    int size; // キー値ペアの数
    int capacity; // ハッシュテーブルの容量
    double loadThres; // 拡張をトリガーする負荷率の閾値
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

    /* クエリ操作 */
    String get(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // バケットを走査、キーが見つかった場合対応するvalを返す
        for (Pair pair : bucket) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // キーが見つからない場合、nullを返す
        return null;
    }

    /* 追加操作 */
    void put(int key, String val) {
        // 負荷率が閾値を超えた場合、拡張を実行
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // バケットを走査、指定したキーに遭遇した場合、対応するvalを更新して戻る
        for (Pair pair : bucket) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // キーが見つからない場合、キー値ペアを末尾に追加
        Pair pair = new Pair(key, val);
        bucket.add(pair);
        size++;
    }

    /* 削除操作 */
    void remove(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // バケットを走査、その中からキー値ペアを削除
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
        // 元のハッシュテーブルを一時的に保存
        List<List<Pair>> bucketsTmp = buckets;
        // 拡張された新しいハッシュテーブルを初期化
        capacity *= extendRatio;
        buckets = new ArrayList<>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.add(new ArrayList<>());
        }
        size = 0;
        // 元のハッシュテーブルから新しいハッシュテーブルにキー値ペアを移動
        for (List<Pair> bucket : bucketsTmp) {
            for (Pair pair : bucket) {
                put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュテーブルを印刷 */
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
        String name = map.get(13276);
        System.out.println("\n学生ID 13276を入力、名前 " + name + " を見つけました");

        /* 削除操作 */
        // ハッシュテーブルからキー値ペア (key, value) を削除
        map.remove(12836);
        System.out.println("\n12836を削除後のハッシュテーブル\nKey -> Value");
        map.print();
    }
}