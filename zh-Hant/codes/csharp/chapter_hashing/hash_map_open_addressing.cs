/**
* File: hash_map_open_addressing.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

/* 開放定址雜湊表 */
class HashMapOpenAddressing {
    int size; // 鍵值對數量
    int capacity = 4; // 雜湊表容量
    double loadThres = 2.0 / 3.0; // 觸發擴容的負載因子閾值
    int extendRatio = 2; // 擴容倍數
    Pair[] buckets; // 桶陣列
    Pair TOMBSTONE = new(-1, "-1"); // 刪除標記

    /* 建構子 */
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

    /* 搜尋 key 對應的桶索引 */
    int FindBucket(int key) {
        int index = HashFunc(key);
        int firstTombstone = -1;
        // 線性探查，當遇到空桶時跳出
        while (buckets[index] != null) {
            // 若遇到 key ，返回對應的桶索引
            if (buckets[index].key == key) {
                // 若之前遇到了刪除標記，則將鍵值對移動至該索引處
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // 返回移動後的桶索引
                }
                return index; // 返回桶索引
            }
            // 記錄遇到的首個刪除標記
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // 計算桶索引，越過尾部則返回頭部
            index = (index + 1) % capacity;
        }
        // 若 key 不存在，則返回新增點的索引
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* 查詢操作 */
    public string? Get(int key) {
        // 搜尋 key 對應的桶索引
        int index = FindBucket(key);
        // 若找到鍵值對，則返回對應 val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // 若鍵值對不存在，則返回 null
        return null;
    }

    /* 新增操作 */
    public void Put(int key, string val) {
        // 當負載因子超過閾值時，執行擴容
        if (LoadFactor() > loadThres) {
            Extend();
        }
        // 搜尋 key 對應的桶索引
        int index = FindBucket(key);
        // 若找到鍵值對，則覆蓋 val 並返回
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index].val = val;
            return;
        }
        // 若鍵值對不存在，則新增該鍵值對
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* 刪除操作 */
    public void Remove(int key) {
        // 搜尋 key 對應的桶索引
        int index = FindBucket(key);
        // 若找到鍵值對，則用刪除標記覆蓋它
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* 擴容雜湊表 */
    void Extend() {
        // 暫存原雜湊表
        Pair[] bucketsTmp = buckets;
        // 初始化擴容後的新雜湊表
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // 將鍵值對從原雜湊表搬運至新雜湊表
        foreach (Pair pair in bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                Put(pair.key, pair.val);
            }
        }
    }

    /* 列印雜湊表 */
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
        Console.WriteLine("\n新增完成後，雜湊表為\nKey -> Value");
        map.Print();

        /* 查詢操作 */
        // 向雜湊表中輸入鍵 key ，得到值 value
        string? name = map.Get(13276);
        Console.WriteLine("\n輸入學號 13276 ，查詢到姓名 " + name);

        /* 刪除操作 */
        // 在雜湊表中刪除鍵值對 (key, value)
        map.Remove(16750);
        Console.WriteLine("\n刪除 16750 後，雜湊表為\nKey -> Value");
        map.Print();
    }
}
