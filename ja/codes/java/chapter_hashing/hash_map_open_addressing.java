/**
 * File: hash_map_open_addressing.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

/* オープンアドレス法によるハッシュ表 */
class HashMapOpenAddressing {
    private int size; // キーと値のペアの数
    private int capacity = 4; // ハッシュ表の容量
    private final double loadThres = 2.0 / 3.0; // 表を拡張する負荷率のしきい値
    private final int extendRatio = 2; // 容量の拡張倍率
    private Pair[] buckets; // バケットの配列
    private final Pair TOMBSTONE = new Pair(-1, "-1"); // 削除済みマーカー

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

    /* key に対応するバケットのインデックスを探す */
    private int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // 線形探索を行い、空のバケットに出会ったらループを抜ける
        while (buckets[index] != null) {
            // key が見つかったら、そのバケットのインデックスを返す
            if (buckets[index].key == key) {
                // それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // 移動先のバケットのインデックスを返す
                }
                return index; // バケットのインデックスを返す
            }
            // 最初に見つかった削除済みマーカーの位置を記録する
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % capacity;
        }
        // key がなければ挿入位置のインデックスを返す
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* 検索 */
    public String get(int key) {
        // key に対応するバケットのインデックスを探す
        int index = findBucket(key);
        // ペアが見つかったら対応する val を返す
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // ペアがなければ null を返す
        return null;
    }

    /* 追加 */
    public void put(int key, String val) {
        // 負荷率がしきい値を超えたら表を拡張する
        if (loadFactor() > loadThres) {
            extend();
        }
        // key に対応するバケットのインデックスを探す
        int index = findBucket(key);
        // ペアが見つかったら val を上書きして処理を終える
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index].val = val;
            return;
        }
        // ペアがなければ新しく追加する
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* 削除 */
    public void remove(int key) {
        // key に対応するバケットのインデックスを探す
        int index = findBucket(key);
        // ペアが見つかったら削除済みマーカーで置き換える
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* ハッシュ表を拡張する */
    private void extend() {
        // 元のハッシュ表を一時保存する
        Pair[] bucketsTmp = buckets;
        // 拡張後の新しいハッシュ表を初期化する
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // 元のハッシュ表から新しい表にペアを移す
        for (Pair pair : bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュ表を表示する */
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
        // ハッシュ表を初期化する
        HashMapOpenAddressing hashmap = new HashMapOpenAddressing();

        // 追加
        // ハッシュ表にペア (key, val) を追加する
        hashmap.put(12836, "小哈");
        hashmap.put(15937, "小啰");
        hashmap.put(16750, "小算");
        hashmap.put(13276, "小法");
        hashmap.put(10583, "小鸭");
        System.out.println("\n追加後のハッシュ表\nKey -> Value");
        hashmap.print();

        // 検索
        // ハッシュ表でキー key に対応する値 val を取得する
        String name = hashmap.get(13276);
        System.out.println("\n学籍番号 13276 に対応する名前は " + name);

        // 削除
        // ハッシュ表からペア (key, val) を削除する
        hashmap.remove(16750);
        System.out.println("\n16750 を削除した後のハッシュ表\nKey -> Value");
        hashmap.print();
    }
}
