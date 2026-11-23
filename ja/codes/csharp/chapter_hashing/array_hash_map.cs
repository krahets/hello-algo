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

/* 配列で実装したハッシュテーブル */
class ArrayHashMap {
    List<Pair?> buckets;
    public ArrayHashMap() {
        // 100 個のバケットを含む配列を初期化する
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

    /* 取得操作 */
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
        // null に設定して、削除を表す
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

    /* ハッシュテーブルを表示する */
    public void Print() {
        foreach (Pair kv in PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
    }
}


public class array_hash_map {
    [Test]
    public void Test() {
        /* ハッシュテーブルを初期化する */
        ArrayHashMap map = new();

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
        string? name = map.Get(15937);
        Console.WriteLine("\n学生番号 15937 に対応する氏名は " + name);

        /* 削除操作 */
        // ハッシュテーブルからキーと値のペア (key, value) を削除する
        map.Remove(10583);
        Console.WriteLine("\n10583 を削除した後のハッシュテーブル\nKey -> Value");
        map.Print();

        /* ハッシュテーブルを走査する */
        Console.WriteLine("\nキーと値のペア Key->Value を走査する");
        foreach (Pair kv in map.PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
        Console.WriteLine("\nキー Key だけを走査する");
        foreach (int key in map.KeySet()) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\n値 Value だけを走査する");
        foreach (string val in map.ValueSet()) {
            Console.WriteLine(val);
        }
    }
}
