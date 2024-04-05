/**
 * File: array_hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

/* 鍵值對 int->string */
class Pair(int key, string val) {
    public int key = key;
    public string val = val;
}

/* 基於陣列實現的雜湊表 */
class ArrayHashMap {
    List<Pair?> buckets;
    public ArrayHashMap() {
        // 初始化陣列，包含 100 個桶
        buckets = [];
        for (int i = 0; i < 100; i++) {
            buckets.Add(null);
        }
    }

    /* 雜湊函式 */
    int HashFunc(int key) {
        int index = key % 100;
        return index;
    }

    /* 查詢操作 */
    public string? Get(int key) {
        int index = HashFunc(key);
        Pair? pair = buckets[index];
        if (pair == null) return null;
        return pair.val;
    }

    /* 新增操作 */
    public void Put(int key, string val) {
        Pair pair = new(key, val);
        int index = HashFunc(key);
        buckets[index] = pair;
    }

    /* 刪除操作 */
    public void Remove(int key) {
        int index = HashFunc(key);
        // 置為 null ，代表刪除
        buckets[index] = null;
    }

    /* 獲取所有鍵值對 */
    public List<Pair> PairSet() {
        List<Pair> pairSet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                pairSet.Add(pair);
        }
        return pairSet;
    }

    /* 獲取所有鍵 */
    public List<int> KeySet() {
        List<int> keySet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                keySet.Add(pair.key);
        }
        return keySet;
    }

    /* 獲取所有值 */
    public List<string> ValueSet() {
        List<string> valueSet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                valueSet.Add(pair.val);
        }
        return valueSet;
    }

    /* 列印雜湊表 */
    public void Print() {
        foreach (Pair kv in PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
    }
}


public class array_hash_map {
    [Test]
    public void Test() {
        /* 初始化雜湊表 */
        ArrayHashMap map = new();

        /* 新增操作 */
        // 在雜湊表中新增鍵值對 (key, value)
        map.Put(12836, "小哈");
        map.Put(15937, "小囉");
        map.Put(16750, "小算");
        map.Put(13276, "小法");
        map.Put(10583, "小鴨");
        Console.WriteLine("\n新增完成後，雜湊表為\nKey -> Value");
        map.Print();

        /* 查詢操作 */
        // 向雜湊表中輸入鍵 key ，得到值 value
        string? name = map.Get(15937);
        Console.WriteLine("\n輸入學號 15937 ，查詢到姓名 " + name);

        /* 刪除操作 */
        // 在雜湊表中刪除鍵值對 (key, value)
        map.Remove(10583);
        Console.WriteLine("\n刪除 10583 後，雜湊表為\nKey -> Value");
        map.Print();

        /* 走訪雜湊表 */
        Console.WriteLine("\n走訪鍵值對 Key->Value");
        foreach (Pair kv in map.PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
        Console.WriteLine("\n單獨走訪鍵 Key");
        foreach (int key in map.KeySet()) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\n單獨走訪值 Value");
        foreach (string val in map.ValueSet()) {
            Console.WriteLine(val);
        }
    }
}
