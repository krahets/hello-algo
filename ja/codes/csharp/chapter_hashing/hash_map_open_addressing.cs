/**
* File: hash_map_open_addressing.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

/* オープンアドレス法のハッシュテーブル */
class HashMapOpenAddressing {
    int size; // キーと値のペアの数
    int capacity = 4; // ハッシュテーブルの容量
    double loadThres = 2.0 / 3.0; // 容量の拡張を開始する負荷率のしきい値
    int extendRatio = 2; // 容量の拡張倍率
    Pair[] buckets; // バケット配列
    Pair TOMBSTONE = new(-1, "-1"); // 削除マーカー

    /* コンストラクタ */
    public HashMapOpenAddressing() {
        size = 0;
        buckets = new Pair[capacity];
    }

    /* ハッシュ関数 */
    int HashFunc(int key) {
        return key % capacity;
    }

    /* 負荷率 */
    double LoadFactor() {
        return (double)size / capacity;
    }

    /* key に対応するバケットのインデックスを探索する */
    int FindBucket(int key) {
        int index = HashFunc(key);
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
    public string? Get(int key) {
        // key に対応するバケットのインデックスを探索する
        int index = FindBucket(key);
        // キーと値のペアが見つかった場合、対応する val を返す
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // キーと値のペアが存在しない場合、null を返す
        return null;
    }

    /* 追加操作 */
    public void Put(int key, string val) {
        // 負荷率がしきい値を超えた場合、容量を拡張する
        if (LoadFactor() > loadThres) {
            Extend();
        }
        // key に対応するバケットのインデックスを探索する
        int index = FindBucket(key);
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
    public void Remove(int key) {
        // key に対応するバケットのインデックスを探索する
        int index = FindBucket(key);
        // キーと値のペアが見つかった場合、削除マーカーで上書きする
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* ハッシュテーブルの容量を拡張する */
    void Extend() {
        // 元のハッシュテーブルを一時保存する
        Pair[] bucketsTmp = buckets;
        // 拡張後の新しいハッシュテーブルを初期化する
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
        foreach (Pair pair in bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                Put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュテーブルを表示する */
    public void Print() {
        foreach (Pair pair in buckets) {
            if (pair == null) {
                Console.WriteLine("null");
            } else if (pair == TOMBSTONE) {
                Console.WriteLine("TOMBSTONE");
            } else {
                Console.WriteLine(pair.key + " -> " + pair.val);
            }
        }
    }
}

public class hash_map_open_addressing {
    [Test]
    public void Test() {
        /* ハッシュテーブルを初期化する */
        HashMapOpenAddressing map = new();

        /* 追加操作 */
        // ハッシュテーブルにキーと値のペア (key, value) を追加する
        map.Put(12836, "小哈");
        map.Put(15937, "小啰");
        map.Put(16750, "小算");
        map.Put(13276, "小法");
        map.Put(10583, "小鸭");
        Console.WriteLine("\n追加後のハッシュテーブル\nKey -> Value");
        map.Print();

        /* 取得操作 */
        // ハッシュテーブルにキー key を渡し、値 value を取得する
        string? name = map.Get(13276);
        Console.WriteLine("\n学生番号 13276 に対応する氏名は " + name);

        /* 削除操作 */
        // ハッシュテーブルからキーと値のペア (key, value) を削除する
        map.Remove(16750);
        Console.WriteLine("\n16750 を削除した後のハッシュテーブル\nKey -> Value");
        map.Print();
    }
}
