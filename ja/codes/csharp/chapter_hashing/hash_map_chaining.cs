/**
* File: hash_map_chaining.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

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
        buckets = new List<List<Pair>>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.Add([]);
        }
    }

    /* ハッシュ関数 */
    int HashFunc(int key) {
        return key % capacity;
    }

    /* 負荷率 */
    double LoadFactor() {
        return (double)size / capacity;
    }

    /* 検索操作 */
    public string? Get(int key) {
        int index = HashFunc(key);
        // バケットを走査し、key が見つかれば対応する val を返す
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // key が見つからない場合は null を返す
        return null;
    }

    /* 追加操作 */
    public void Put(int key, string val) {
        // 負荷率がしきい値を超えたら、リサイズを実行
        if (LoadFactor() > loadThres) {
            Extend();
        }
        int index = HashFunc(key);
        // バケットを走査し、指定した key が見つかれば対応する val を更新して返す
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // その key が存在しなければ、キーと値のペアを末尾に追加
        buckets[index].Add(new Pair(key, val));
        size++;
    }

    /* 削除操作 */
    public void Remove(int key) {
        int index = HashFunc(key);
        // バケットを走査してキーと値のペアを削除
        foreach (Pair pair in buckets[index].ToList()) {
            if (pair.key == key) {
                buckets[index].Remove(pair);
                size--;
                break;
            }
        }
    }

    /* ハッシュテーブルを拡張 */
    void Extend() {
        // 元のハッシュテーブルを一時保存
        List<List<Pair>> bucketsTmp = buckets;
        // リサイズ後の新しいハッシュテーブルを初期化
        capacity *= extendRatio;
        buckets = new List<List<Pair>>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.Add([]);
        }
        size = 0;
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
        foreach (List<Pair> bucket in bucketsTmp) {
            foreach (Pair pair in bucket) {
                Put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュテーブルを出力 */
    public void Print() {
        foreach (List<Pair> bucket in buckets) {
            List<string> res = [];
            foreach (Pair pair in bucket) {
                res.Add(pair.key + " -> " + pair.val);
            }
            foreach (string kv in res) {
                Console.WriteLine(kv);
            }
        }
    }
}

public class hash_map_chaining {
    [Test]
    public void Test() {
        /* ハッシュテーブルを初期化 */
        HashMapChaining map = new();

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
        map.Remove(12836);
        Console.WriteLine("\n12836 を削除した後、ハッシュテーブルは\nKey -> Value");
        map.Print();
    }
}