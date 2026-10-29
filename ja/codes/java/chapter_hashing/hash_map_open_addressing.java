/**
 * File: hash_map_open_addressing.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

/* オープンアドレス法のハッシュテーブル */
class HashMapOpenAddressing {
    private int size; // キーと値のペアの数
    private int capacity = 4; // ハッシュテーブルの容量
    private final double loadThres = 2.0 / 3.0; // 容量の拡張を開始する負荷率のしきい値
    private final int extendRatio = 2; // 容量の拡張倍率
    private Pair[] buckets; // バケット配列
    private final Pair TOMBSTONE = new Pair(-1, "-1"); // 削除マーカー

    /* コンストラクタ */
    public HashMapOpenAddressing() {
        size = 0;
        buckets = new Pair[capacity];
    }

    /* ハッシュ関数 */
    private int hashFunc(int key) {
        return key % capacity;
    }

    /* 負荷率 */
    private double loadFactor() {
        return (double) size / capacity;
    }

    /* key に対応するバケットのインデックスを探索する */
    private int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // 線形探索法で探索し、空のバケットに到達したら終了する
        while (buckets[index] != null) {
            // key が見つかった場合、対応するバケットのインデックスを返す
            if (buckets[index].key == key) {
                // それ以前に削除マーカーが見つかっていれば、そのインデックスにキーと値のペアを移す
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // 移動後のバケットのインデックスを返す
                }
                return index; // バケットのインデックスを返す
            }
            // 最初に見つかった削除マーカーを記録する
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // バケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % capacity;
        }
        // key が存在しない場合、追加位置のインデックスを返す
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* 取得操作 */
    public String get(int key) {
        // key に対応するバケットのインデックスを探索する
        int index = findBucket(key);
        // キーと値のペアが見つかった場合、対応する val を返す
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // キーと値のペアが存在しない場合、null を返す
        return null;
    }

    /* 追加操作 */
    public void put(int key, String val) {
        // 負荷率がしきい値を超えた場合、容量を拡張する
        if (loadFactor() > loadThres) {
            extend();
        }
        // key に対応するバケットのインデックスを探索する
        int index = findBucket(key);
        // キーと値のペアが見つかった場合、val を上書きして戻る
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index].val = val;
            return;
        }
        // キーと値のペアが存在しない場合、そのペアを追加する
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* 削除操作 */
    public void remove(int key) {
        // key に対応するバケットのインデックスを探索する
        int index = findBucket(key);
        // キーと値のペアが見つかった場合、削除マーカーで上書きする
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* ハッシュテーブルの容量を拡張する */
    private void extend() {
        // 元のハッシュテーブルを一時保存する
        Pair[] bucketsTmp = buckets;
        // 拡張後の新しいハッシュテーブルを初期化する
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
        for (Pair pair : bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュテーブルを表示する */
    public void print() {
        for (Pair pair : buckets) {
            if (pair == null) {
                System.out.println("null");
            } else if (pair == TOMBSTONE) {
                System.out.println("TOMBSTONE");
            } else {
                System.out.println(pair.key + " -> " + pair.val);
            }
        }
    }
}

public class hash_map_open_addressing {
    public static void main(String[] args) {
        // ハッシュテーブルを初期化する
        HashMapOpenAddressing hashmap = new HashMapOpenAddressing();

        // 追加操作
        // ハッシュテーブルにキーと値のペア (key, val) を追加する
        hashmap.put(12836, "小哈");
        hashmap.put(15937, "小啰");
        hashmap.put(16750, "小算");
        hashmap.put(13276, "小法");
        hashmap.put(10583, "小鸭");
        System.out.println("\n追加後のハッシュテーブル\nKey -> Value");
        hashmap.print();

        // 取得操作
        // ハッシュテーブルにキー key を渡し、値 val を取得する
        String name = hashmap.get(13276);
        System.out.println("\n学生番号 13276 に対応する氏名は " + name);

        // 削除操作
        // ハッシュテーブルからキーと値のペア (key, val) を削除する
        hashmap.remove(16750);
        System.out.println("\n16750 を削除した後のハッシュテーブル\nKey -> Value");
        hashmap.print();
    }
}
