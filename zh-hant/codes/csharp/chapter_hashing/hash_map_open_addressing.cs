/**
* File: hash_map_open_addressing.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

/* 採用開放定址法的雜湊表 */
class HashMapOpenAddressing {
    int size; // 鍵值對數量
    int capacity = 4; // 雜湊表容量
    double loadThres = 2.0 / 3.0; // 觸發容量擴充的負載因子門檻
    int extendRatio = 2; // 容量擴充倍數
    Pair[] buckets; // 桶陣列
    Pair TOMBSTONE = new(-1, "-1"); // 刪除標記

    /* 建構方法 */
    public HashMapOpenAddressing() {
        size = 0;
        buckets = new Pair[capacity];
    }

    /* 雜湊函式 */
    int HashFunc(int key) {
        return key % capacity;
    }

    /* 負載因子 */
    double LoadFactor() {
        return (double)size / capacity;
    }

    /* 尋找 key 對應的桶索引 */
    int FindBucket(int key) {
        int index = HashFunc(key);
        int firstTombstone = -1;
        // 進行線性探測，遇到空桶就跳出迴圈
        while (buckets[index] != null) {
            // 若遇到 key，回傳對應的桶索引
            if (buckets[index].key == key) {
                // 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // 回傳移動後的桶索引
                }
                return index; // 回傳桶索引
            }
            // 記錄遇到的第一個刪除標記
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // 計算桶索引，超過陣列尾端就回到開頭
            index = (index + 1) % capacity;
        }
        // 若 key 不存在，回傳可插入位置的索引
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* 查詢操作 */
    public string? Get(int key) {
        // 尋找 key 對應的桶索引
        int index = FindBucket(key);
        // 若找到鍵值對，回傳對應的 val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // 若鍵值對不存在，回傳 null
        return null;
    }

    /* 新增操作 */
    public void Put(int key, string val) {
        // 當負載因子超過門檻時，擴充容量
        if (LoadFactor() > loadThres) {
            Extend();
        }
        // 尋找 key 對應的桶索引
        int index = FindBucket(key);
        // 若找到鍵值對，覆寫 val 並結束操作
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index].val = val;
            return;
        }
        // 若鍵值對不存在，新增該鍵值對
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* 刪除操作 */
    public void Remove(int key) {
        // 尋找 key 對應的桶索引
        int index = FindBucket(key);
        // 若找到鍵值對，以刪除標記取代它
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* 擴充雜湊表容量 */
    void Extend() {
        // 暫存原本的雜湊表
        Pair[] bucketsTmp = buckets;
        // 初始化擴充後的新雜湊表
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // 將鍵值對從原本的雜湊表移到新表
        foreach (Pair pair in bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                Put(pair.key, pair.val);
            }
        }
    }

    /* 印出雜湊表 */
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
        /* 初始化雜湊表 */
        HashMapOpenAddressing map = new();

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
        map.Remove(16750);
        Console.WriteLine("\n刪除 16750 後的雜湊表\nKey -> Value");
        map.Print();
    }
}
