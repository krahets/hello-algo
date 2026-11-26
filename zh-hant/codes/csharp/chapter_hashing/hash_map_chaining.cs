/**
* File: hash_map_chaining.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

/* 鏈結法雜湊表 */
class HashMapChaining {
    int size; // 鍵值對數量
    int capacity; // 雜湊表容量
    double loadThres; // 觸發容量擴充的負載因子門檻
    int extendRatio; // 容量擴充倍數
    List<List<Pair>> buckets; // 桶陣列

    /* 建構方法 */
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

    /* 雜湊函式 */
    int HashFunc(int key) {
        return key % capacity;
    }

    /* 負載因子 */
    double LoadFactor() {
        return (double)size / capacity;
    }

    /* 查詢操作 */
    public string? Get(int key) {
        int index = HashFunc(key);
        // 走訪桶中的元素，若找到 key，就回傳對應的 val
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // 若找不到 key，回傳 null
        return null;
    }

    /* 新增操作 */
    public void Put(int key, string val) {
        // 當負載因子超過門檻時，擴充容量
        if (LoadFactor() > loadThres) {
            Extend();
        }
        int index = HashFunc(key);
        // 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // 若沒有這個 key，就將鍵值對加到尾端
        buckets[index].Add(new Pair(key, val));
        size++;
    }

    /* 刪除操作 */
    public void Remove(int key) {
        int index = HashFunc(key);
        // 走訪桶中的元素，從中刪除鍵值對
        foreach (Pair pair in buckets[index].ToList()) {
            if (pair.key == key) {
                buckets[index].Remove(pair);
                size--;
                break;
            }
        }
    }

    /* 擴充雜湊表容量 */
    void Extend() {
        // 暫存原本的雜湊表
        List<List<Pair>> bucketsTmp = buckets;
        // 初始化擴充後的新雜湊表
        capacity *= extendRatio;
        buckets = new List<List<Pair>>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.Add([]);
        }
        size = 0;
        // 將鍵值對從原本的雜湊表移到新表
        foreach (List<Pair> bucket in bucketsTmp) {
            foreach (Pair pair in bucket) {
                Put(pair.key, pair.val);
            }
        }
    }

    /* 印出雜湊表 */
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
        /* 初始化雜湊表 */
        HashMapChaining map = new();

        /* 新增操作 */
        // 在雜湊表中新增鍵值對 (key, value)
        map.Put(12836, "小哈");
        map.Put(15937, "小囉");
        map.Put(16750, "小算");
        map.Put(13276, "小法");
        map.Put(10583, "小鴨");
        Console.WriteLine("\n新增後的雜湊表\nKey -> Value");
        map.Print();

        /* 查詢操作 */
        // 輸入鍵 key，從雜湊表取得對應的值 value
        string? name = map.Get(13276);
        Console.WriteLine("\n輸入學號 13276，查得姓名 " + name);

        /* 刪除操作 */
        // 從雜湊表刪除鍵值對 (key, value)
        map.Remove(12836);
        Console.WriteLine("\n刪除 12836 後的雜湊表\nKey -> Value");
        map.Print();
    }
}