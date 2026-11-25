/**
* File: hash_map_chaining.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

/* チェイン法によるハッシュ表 */
class HashMapChaining {
    int size; // キーと値のペアの数
    int capacity; // ハッシュ表の容量
    double loadThres; // 表を拡張する負荷率のしきい値
    int extendRatio; // 容量の拡張倍率
    List<List<Pair>> buckets; // バケットの配列

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

    /* 検索 */
    public string? Get(int key) {
        int index = HashFunc(key);
        // バケットを走査し、key が見つかったら対応する val を返す
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // key が見つからなければ null を返す
        return null;
    }

    /* 追加 */
    public void Put(int key, string val) {
        // 負荷率がしきい値を超えたら表を拡張する
        if (LoadFactor() > loadThres) {
            Extend();
        }
        int index = HashFunc(key);
        // バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // key がなければ末尾にペアを追加する
        buckets[index].Add(new Pair(key, val));
        size++;
    }

    /* 削除 */
    public void Remove(int key) {
        int index = HashFunc(key);
        // バケットを走査し、該当するペアを削除する
        foreach (Pair pair in buckets[index].ToList()) {
            if (pair.key == key) {
                buckets[index].Remove(pair);
                size--;
                break;
            }
        }
    }

    /* ハッシュ表を拡張する */
    void Extend() {
        // 元のハッシュ表を一時保存する
        List<List<Pair>> bucketsTmp = buckets;
        // 拡張後の新しいハッシュ表を初期化する
        capacity *= extendRatio;
        buckets = new List<List<Pair>>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.Add([]);
        }
        size = 0;
        // 元のハッシュ表から新しい表にペアを移す
        foreach (List<Pair> bucket in bucketsTmp) {
            foreach (Pair pair in bucket) {
                Put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュ表を表示する */
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
        /* ハッシュ表を初期化する */
        HashMapChaining map = new();

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
        map.Remove(12836);
        Console.WriteLine("\n12836 を削除した後のハッシュ表\nKey -> Value");
        map.Print();
    }
}