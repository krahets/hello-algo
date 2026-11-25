/**
* File: hash_map_open_addressing.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

/* オープンアドレス法によるハッシュ表 */
class HashMapOpenAddressing {
    int size; // キーと値のペアの数
    int capacity = 4; // ハッシュ表の容量
    double loadThres = 2.0 / 3.0; // 表を拡張する負荷率のしきい値
    int extendRatio = 2; // 容量の拡張倍率
    Pair[] buckets; // バケットの配列
    Pair TOMBSTONE = new(-1, "-1"); // 削除済みマーカー

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

    /* key に対応するバケットのインデックスを探す */
    int FindBucket(int key) {
        int index = HashFunc(key);
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
    public string? Get(int key) {
        // key に対応するバケットのインデックスを探す
        int index = FindBucket(key);
        // ペアが見つかったら対応する val を返す
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // ペアがなければ null を返す
        return null;
    }

    /* 追加 */
    public void Put(int key, string val) {
        // 負荷率がしきい値を超えたら表を拡張する
        if (LoadFactor() > loadThres) {
            Extend();
        }
        // key に対応するバケットのインデックスを探す
        int index = FindBucket(key);
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
    public void Remove(int key) {
        // key に対応するバケットのインデックスを探す
        int index = FindBucket(key);
        // ペアが見つかったら削除済みマーカーで置き換える
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* ハッシュ表を拡張する */
    void Extend() {
        // 元のハッシュ表を一時保存する
        Pair[] bucketsTmp = buckets;
        // 拡張後の新しいハッシュ表を初期化する
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // 元のハッシュ表から新しい表にペアを移す
        foreach (Pair pair in bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                Put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュ表を表示する */
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
        /* ハッシュ表を初期化する */
        HashMapOpenAddressing map = new();

        /* 追加 */
        // ハッシュ表にペア (key, value) を追加する
        map.Put(12836, "小哈");
        map.Put(15937, "小啰");
        map.Put(16750, "小算");
        map.Put(13276, "小法");
        map.Put(10583, "小鸭");
        Console.WriteLine("\n追加後のハッシュ表\nKey -> Value");
        map.Print();

        /* 検索 */
        // ハッシュ表でキー key に対応する値 value を取得する
        string? name = map.Get(13276);
        Console.WriteLine("\n学籍番号 13276 に対応する名前は " + name);

        /* 削除 */
        // ハッシュ表からペア (key, value) を削除する
        map.Remove(16750);
        Console.WriteLine("\n16750 を削除した後のハッシュ表\nKey -> Value");
        map.Print();
    }
}
