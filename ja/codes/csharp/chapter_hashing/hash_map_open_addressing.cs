/**
* File: hash_map_open_addressing.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

/* オープンアドレス法ハッシュテーブル */
class HashMapOpenAddressing {
    int size; // キーと値のペア数
    int capacity = 4; // ハッシュテーブル容量
    double loadThres = 2.0 / 3.0; // リサイズを発動する負荷率のしきい値
    int extendRatio = 2; // 拡張倍率
    Pair[] buckets; // バケット配列
    Pair TOMBSTONE = new(-1, "-1"); // 削除済みマーク

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

    /* key に対応するバケットインデックスを探す */
    int FindBucket(int key) {
        int index = HashFunc(key);
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
    public string? Get(int key) {
        // key に対応するバケットインデックスを探す
        int index = FindBucket(key);
        // キーと値の組が見つかったら、対応する val を返す
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // キーと値の組が存在しなければ null を返す
        return null;
    }

    /* 追加操作 */
    public void Put(int key, string val) {
        // 負荷率がしきい値を超えたら、リサイズを実行
        if (LoadFactor() > loadThres) {
            Extend();
        }
        // key に対応するバケットインデックスを探す
        int index = FindBucket(key);
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
    public void Remove(int key) {
        // key に対応するバケットインデックスを探す
        int index = FindBucket(key);
        // キーと値の組が見つかったら、削除マーカーで上書きする
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* ハッシュテーブルを拡張 */
    void Extend() {
        // 元のハッシュテーブルを一時保存
        Pair[] bucketsTmp = buckets;
        // リサイズ後の新しいハッシュテーブルを初期化
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
        foreach (Pair pair in bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                Put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュテーブルを出力 */
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
        /* ハッシュテーブルを初期化 */
        HashMapOpenAddressing map = new();

        /* 追加操作 */
        // ハッシュテーブルにキーと値のペア (key, value) を追加
        map.Put(12836, "シャオハー");
        map.Put(15937, "シャオルオ");
        map.Put(16750, "シャオスワン");
        map.Put(13276, "シャオファー");
        map.Put(10583, "シャオヤー");
        Console.WriteLine("\n追加完了後、ハッシュテーブルは\nKey -> Value");
        map.Print();

        /* 検索操作 */
        // キー key をハッシュテーブルに渡し、値 value を取得
        string? name = map.Get(13276);
        Console.WriteLine("\n学籍番号 13276 を入力すると、氏名 " + name);

        /* 削除操作 */
        // ハッシュテーブルからキーと値のペア (key, value) を削除
        map.Remove(16750);
        Console.WriteLine("\n16750 を削除した後、ハッシュテーブルは\nKey -> Value");
        map.Print();
    }
}
