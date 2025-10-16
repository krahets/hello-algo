/**
 * File: hash_map_open_addressing.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

/* オープンアドレス法ハッシュテーブル */
class HashMapOpenAddressing {
    private int size; // キー値ペアの数
    private int capacity = 4; // ハッシュテーブルの容量
    private final double loadThres = 2.0 / 3.0; // 拡張をトリガーする負荷率の閾値
    private final int extendRatio = 2; // 拡張倍率
    private Pair[] buckets; // バケット配列
    private final Pair TOMBSTONE = new Pair(-1, "-1"); // 削除マーク

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

    /* keyに対応するバケットインデックスを検索 */
    private int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // 線形探査、空のバケットに遭遇したら終了
        while (buckets[index] != null) {
            // keyに遭遇した場合、対応するバケットインデックスを返す
            if (buckets[index].key == key) {
                // 以前に削除マークに遭遇していた場合、キー値ペアをそのインデックスに移動
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // 移動後のバケットインデックスを返す
                }
                return index; // バケットインデックスを返す
            }
            // 最初に遭遇した削除マークを記録
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // バケットインデックスを計算、末尾を超えた場合は先頭に戻る
            index = (index + 1) % capacity;
        }
        // keyが存在しない場合、挿入ポイントのインデックスを返す
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* クエリ操作 */
    public String get(int key) {
        // keyに対応するバケットインデックスを検索
        int index = findBucket(key);
        // キー値ペアが見つかった場合、対応するvalを返す
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // キー値ペアが存在しない場合、nullを返す
        return null;
    }

    /* 追加操作 */
    public void put(int key, String val) {
        // 負荷率が閾値を超えた場合、拡張を実行
        if (loadFactor() > loadThres) {
            extend();
        }
        // keyに対応するバケットインデックスを検索
        int index = findBucket(key);
        // キー値ペアが見つかった場合、valを上書きして戻る
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index].val = val;
            return;
        }
        // キー値ペアが存在しない場合、キー値ペアを追加
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* 削除操作 */
    public void remove(int key) {
        // keyに対応するバケットインデックスを検索
        int index = findBucket(key);
        // キー値ペアが見つかった場合、削除マークで覆う
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* ハッシュテーブルを拡張 */
    private void extend() {
        // 元のハッシュテーブルを一時的に保存
        Pair[] bucketsTmp = buckets;
        // 拡張された新しいハッシュテーブルを初期化
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // 元のハッシュテーブルから新しいハッシュテーブルにキー値ペアを移動
        for (Pair pair : bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュテーブルを印刷 */
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
        // ハッシュテーブルにキー値ペア (key, val) を追加
        hashmap.put(12836, "Ha");
        hashmap.put(15937, "Luo");
        hashmap.put(16750, "Suan");
        hashmap.put(13276, "Fa");
        hashmap.put(10583, "Ya");
        System.out.println("\n追加後のハッシュテーブル\nKey -> Value");
        hashmap.print();

        // クエリ操作
        // ハッシュテーブルにキーを入力して値valを取得
        String name = hashmap.get(13276);
        System.out.println("\n学生ID 13276を入力、名前 " + name + " を見つけました");

        // 削除操作
        // ハッシュテーブルからキー値ペア (key, val) を削除
        hashmap.remove(16750);
        System.out.println("\n16750を削除後のハッシュテーブル\nKey -> Value");
        hashmap.print();
    }
}