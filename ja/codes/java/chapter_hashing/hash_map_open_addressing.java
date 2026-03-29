/**
 * File: hash_map_open_addressing.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

/* オープンアドレス法ハッシュテーブル */
class HashMapOpenAddressing {
    private int size; // キーと値のペア数
    private int capacity = 4; // ハッシュテーブル容量
    private final double loadThres = 2.0 / 3.0; // リサイズを発動する負荷率のしきい値
    private final int extendRatio = 2; // 拡張倍率
    private Pair[] buckets; // バケット配列
    private final Pair TOMBSTONE = new Pair(-1, "-1"); // 削除済みマーク

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

    /* key に対応するバケットインデックスを探す */
    private int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // 線形プロービングを行い、空バケットに達したら終了
        while (buckets[index] != null) {
            // key が見つかったら、対応するバケットのインデックスを返す
            if (buckets[index].key == key) {
                // 以前に削除マークが見つかっていれば、そのインデックスへキーと値のペアを移動
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // 移動後のバケットインデックスを返す
                }
                return index; // バケットのインデックスを返す
            }
            // 最初に見つかった削除マークを記録
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // バケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % capacity;
        }
        // key が存在しない場合は追加位置のインデックスを返す
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* 検索操作 */
    public String get(int key) {
        // key に対応するバケットインデックスを探す
        int index = findBucket(key);
        // キーと値の組が見つかったら、対応する val を返す
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // キーと値の組が存在しなければ null を返す
        return null;
    }

    /* 追加操作 */
    public void put(int key, String val) {
        // 負荷率がしきい値を超えたら、リサイズを実行
        if (loadFactor() > loadThres) {
            extend();
        }
        // key に対応するバケットインデックスを探す
        int index = findBucket(key);
        // キーと値の組が見つかったら、val を上書きして返す
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index].val = val;
            return;
        }
        // キーと値の組が存在しない場合は、その組を追加する
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* 削除操作 */
    public void remove(int key) {
        // key に対応するバケットインデックスを探す
        int index = findBucket(key);
        // キーと値の組が見つかったら、削除マーカーで上書きする
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* ハッシュテーブルを拡張 */
    private void extend() {
        // 元のハッシュテーブルを一時保存
        Pair[] bucketsTmp = buckets;
        // リサイズ後の新しいハッシュテーブルを初期化
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
        for (Pair pair : bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュテーブルを出力 */
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
        // ハッシュテーブルを初期化
        HashMapOpenAddressing hashmap = new HashMapOpenAddressing();

        // 追加操作
        // ハッシュテーブルにキーと値の組 (key, val) を追加する
        hashmap.put(12836, "シャオハー");
        hashmap.put(15937, "シャオルオ");
        hashmap.put(16750, "シャオスワン");
        hashmap.put(13276, "シャオファー");
        hashmap.put(10583, "シャオヤー");
        System.out.println("\n追加後のハッシュ表は\nKey -> Value");
        hashmap.print();

        // 検索操作
        // ハッシュテーブルにキー key を入力し、値 val を得る
        String name = hashmap.get(13276);
        System.out.println("\n学籍番号 13276 を入力すると、氏名 " + name);

        // 削除操作
        // ハッシュテーブルからキーと値の組 (key, val) を削除する
        hashmap.remove(16750);
        System.out.println("\n16750 を削除すると、ハッシュ表は\nKey -> Value");
        hashmap.print();
    }
}
