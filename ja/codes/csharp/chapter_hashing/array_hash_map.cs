/**
 * File: array_hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

/* キーと値の組 int->string */
class Pair(int key, string val) {
    public int key = key;
    public string val = val;
}

/* 配列ベースのハッシュテーブル */
class ArrayHashMap {
    List<Pair?> buckets;
    public ArrayHashMap() {
        // 100 個のバケットを含む配列を初期化
        buckets = [];
        for (int i = 0; i < 100; i++) {
            buckets.Add(null);
        }
    }

    /* ハッシュ関数 */
    int HashFunc(int key) {
        int index = key % 100;
        return index;
    }

    /* 検索操作 */
    public string? Get(int key) {
        int index = HashFunc(key);
        Pair? pair = buckets[index];
        if (pair == null) return null;
        return pair.val;
    }

    /* 追加操作 */
    public void Put(int key, string val) {
        Pair pair = new(key, val);
        int index = HashFunc(key);
        buckets[index] = pair;
    }

    /* 削除操作 */
    public void Remove(int key) {
        int index = HashFunc(key);
        // null に設定し、削除を表す
        buckets[index] = null;
    }

    /* すべてのキーと値のペアを取得 */
    public List<Pair> PairSet() {
        List<Pair> pairSet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                pairSet.Add(pair);
        }
        return pairSet;
    }

    /* すべてのキーを取得 */
    public List<int> KeySet() {
        List<int> keySet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                keySet.Add(pair.key);
        }
        return keySet;
    }

    /* すべての値を取得 */
    public List<string> ValueSet() {
        List<string> valueSet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                valueSet.Add(pair.val);
        }
        return valueSet;
    }

    /* ハッシュテーブルを出力 */
    public void Print() {
        foreach (Pair kv in PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
    }
}


public class array_hash_map {
    [Test]
    public void Test() {
        /* ハッシュテーブルを初期化 */
        ArrayHashMap map = new();

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
        string? name = map.Get(15937);
        Console.WriteLine("\n学籍番号 15937 を入力すると、氏名 " + name);

        /* 削除操作 */
        // ハッシュテーブルからキーと値のペア (key, value) を削除
        map.Remove(10583);
        Console.WriteLine("\n10583 を削除した後、ハッシュテーブルは\nKey -> Value");
        map.Print();

        /* ハッシュテーブルを走査 */
        Console.WriteLine("\nキーと値のペア Key->Value を走査");
        foreach (Pair kv in map.PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
        Console.WriteLine("\nキー Key のみを走査");
        foreach (int key in map.KeySet()) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\n値 Value のみを走査");
        foreach (string val in map.ValueSet()) {
            Console.WriteLine(val);
        }
    }
}
