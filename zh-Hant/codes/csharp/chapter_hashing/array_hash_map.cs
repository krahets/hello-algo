/**
 * File: array_hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

/* 键值对 int->string */
class Pair(int key, string val) {
    public int key = key;
    public string val = val;
}

/* 基于数组实现的哈希表 */
class ArrayHashMap {
    List<Pair?> buckets;
    public ArrayHashMap() {
        // 初始化数组，包含 100 个桶
        buckets = [];
        for (int i = 0; i < 100; i++) {
            buckets.Add(null);
        }
    }

    /* 哈希函数 */
    int HashFunc(int key) {
        int index = key % 100;
        return index;
    }

    /* 查询操作 */
    public string? Get(int key) {
        int index = HashFunc(key);
        Pair? pair = buckets[index];
        if (pair == null) return null;
        return pair.val;
    }

    /* 添加操作 */
    public void Put(int key, string val) {
        Pair pair = new(key, val);
        int index = HashFunc(key);
        buckets[index] = pair;
    }

    /* 删除操作 */
    public void Remove(int key) {
        int index = HashFunc(key);
        // 置为 null ，代表删除
        buckets[index] = null;
    }

    /* 获取所有键值对 */
    public List<Pair> PairSet() {
        List<Pair> pairSet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                pairSet.Add(pair);
        }
        return pairSet;
    }

    /* 获取所有键 */
    public List<int> KeySet() {
        List<int> keySet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                keySet.Add(pair.key);
        }
        return keySet;
    }

    /* 获取所有值 */
    public List<string> ValueSet() {
        List<string> valueSet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                valueSet.Add(pair.val);
        }
        return valueSet;
    }

    /* 打印哈希表 */
    public void Print() {
        foreach (Pair kv in PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
    }
}


public class array_hash_map {
    [Test]
    public void Test() {
        /* 初始化哈希表 */
        ArrayHashMap map = new();

        /* 添加操作 */
        // 在哈希表中添加键值对 (key, value)
        map.Put(12836, "小哈");
        map.Put(15937, "小啰");
        map.Put(16750, "小算");
        map.Put(13276, "小法");
        map.Put(10583, "小鸭");
        Console.WriteLine("\n添加完成后，哈希表为\nKey -> Value");
        map.Print();

        /* 查询操作 */
        // 向哈希表中输入键 key ，得到值 value
        string? name = map.Get(15937);
        Console.WriteLine("\n输入学号 15937 ，查询到姓名 " + name);

        /* 删除操作 */
        // 在哈希表中删除键值对 (key, value)
        map.Remove(10583);
        Console.WriteLine("\n删除 10583 后，哈希表为\nKey -> Value");
        map.Print();

        /* 遍历哈希表 */
        Console.WriteLine("\n遍历键值对 Key->Value");
        foreach (Pair kv in map.PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
        Console.WriteLine("\n单独遍历键 Key");
        foreach (int key in map.KeySet()) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\n单独遍历值 Value");
        foreach (string val in map.ValueSet()) {
            Console.WriteLine(val);
        }
    }
}
