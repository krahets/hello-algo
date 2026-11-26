/**
 * File: array_hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

/* キーと値のペア int->string */
class Pair(int key, string val) {
    public int key = key;
    public string val = val;
}

/* 配列で実装したハッシュ表 */
class ArrayHashMap {
    List<Pair?> buckets;
    public ArrayHashMap() {
        // 100 個のバケットを持つ配列を初期化する
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

    /* 検索 */
    public string? Get(int key) {
        int index = HashFunc(key);
        Pair? pair = buckets[index];
        if (pair == null) return null;
        return pair.val;
    }

    /* 追加 */
    public void Put(int key, string val) {
        Pair pair = new(key, val);
        int index = HashFunc(key);
        buckets[index] = pair;
    }

    /* 削除 */
    public void Remove(int key) {
        int index = HashFunc(key);
        // null を代入して削除する
        buckets[index] = null;
    }

    /* キーと値のペアをすべて取得する */
    public List<Pair> PairSet() {
        List<Pair> pairSet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                pairSet.Add(pair);
        }
        return pairSet;
    }

    /* すべてのキーを取得する */
    public List<int> KeySet() {
        List<int> keySet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                keySet.Add(pair.key);
        }
        return keySet;
    }

    /* すべての値を取得する */
    public List<string> ValueSet() {
        List<string> valueSet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                valueSet.Add(pair.val);
        }
        return valueSet;
    }

    /* ハッシュ表を表示する */
    public void Print() {
        foreach (Pair kv in PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
    }
}


public class array_hash_map {
    [Test]
    public void Test() {
        /* ハッシュ表を初期化する */
        ArrayHashMap map = new();

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
        string? name = map.Get(15937);
        Console.WriteLine("\n学籍番号 15937 に対応する名前は " + name);

        /* 削除 */
        // ハッシュ表からペア (key, value) を削除する
        map.Remove(10583);
        Console.WriteLine("\n10583 を削除した後のハッシュ表\nKey -> Value");
        map.Print();

        /* ハッシュ表を走査する */
        Console.WriteLine("\nキーと値のペアを順に表示 Key->Value");
        foreach (Pair kv in map.PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
        Console.WriteLine("\nキーだけを順に表示 Key");
        foreach (int key in map.KeySet()) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\n値だけを順に表示 Value");
        foreach (string val in map.ValueSet()) {
            Console.WriteLine(val);
        }
    }
}
