/**
* File: hash_map_chaining.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

/* チェイン法のハッシュテーブル */
class HashMapChaining {
    int size; // キーと値のペアの数
    int capacity; // ハッシュテーブルの容量
    double loadThres; // 容量の拡張を開始する負荷率のしきい値
    int extendRatio; // 容量の拡張倍率
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

    /* 取得操作 */
    public string? Get(int key) {
        int index = HashFunc(key);
        // バケットを走査し、key が見つかったら対応する val を返す
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // key が見つからなかった場合、null を返す
        return null;
    }

    /* 追加操作 */
    public void Put(int key, string val) {
        // 負荷率がしきい値を超えた場合、容量を拡張する
        if (LoadFactor() > loadThres) {
            Extend();
        }
        int index = HashFunc(key);
        // バケットを走査し、指定された key が見つかったら、対応する val を更新して戻る
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // key が存在しない場合、キーと値のペアを末尾に追加する
        buckets[index].Add(new Pair(key, val));
        size++;
    }

    /* 削除操作 */
    public void Remove(int key) {
        int index = HashFunc(key);
        // バケットを走査し、キーと値のペアを削除する
        foreach (Pair pair in buckets[index].ToList()) {
            if (pair.key == key) {
                buckets[index].Remove(pair);
                size--;
                break;
            }
        }
    }

    /* ハッシュテーブルの容量を拡張する */
    void Extend() {
        // 元のハッシュテーブルを一時保存する
        List<List<Pair>> bucketsTmp = buckets;
        // 拡張後の新しいハッシュテーブルを初期化する
        capacity *= extendRatio;
        buckets = new List<List<Pair>>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.Add([]);
        }
        size = 0;
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
        foreach (List<Pair> bucket in bucketsTmp) {
            foreach (Pair pair in bucket) {
                Put(pair.key, pair.val);
            }
        }
    }

    /* ハッシュテーブルを表示する */
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
        /* ハッシュテーブルを初期化する */
        HashMapChaining map = new();

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
        map.Remove(12836);
        Console.WriteLine("\n12836 を削除した後のハッシュテーブル\nKey -> Value");
        map.Print();
    }
}