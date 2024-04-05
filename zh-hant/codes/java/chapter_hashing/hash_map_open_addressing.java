/**
 * File: hash_map_open_addressing.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

/* 開放定址雜湊表 */
class HashMapOpenAddressing {
    private int size; // 鍵值對數量
    private int capacity = 4; // 雜湊表容量
    private final double loadThres = 2.0 / 3.0; // 觸發擴容的負載因子閾值
    private final int extendRatio = 2; // 擴容倍數
    private Pair[] buckets; // 桶陣列
    private final Pair TOMBSTONE = new Pair(-1, "-1"); // 刪除標記

    /* 建構子 */
    public HashMapOpenAddressing() {
        size = 0;
        buckets = new Pair[capacity];
    }

    /* 雜湊函式 */
    private int hashFunc(int key) {
        return key % capacity;
    }

    /* 負載因子 */
    private double loadFactor() {
        return (double) size / capacity;
    }

    /* 搜尋 key 對應的桶索引 */
    private int findBucket(int key) {
        int index = hashFunc(key);
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
    public String get(int key) {
        // 搜尋 key 對應的桶索引
        int index = findBucket(key);
        // 若找到鍵值對，則返回對應 val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // 若鍵值對不存在，則返回 null
        return null;
    }

    /* 新增操作 */
    public void put(int key, String val) {
        // 當負載因子超過閾值時，執行擴容
        if (loadFactor() > loadThres) {
            extend();
        }
        // 搜尋 key 對應的桶索引
        int index = findBucket(key);
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
    public void remove(int key) {
        // 搜尋 key 對應的桶索引
        int index = findBucket(key);
        // 若找到鍵值對，則用刪除標記覆蓋它
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* 擴容雜湊表 */
    private void extend() {
        // 暫存原雜湊表
        Pair[] bucketsTmp = buckets;
        // 初始化擴容後的新雜湊表
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // 將鍵值對從原雜湊表搬運至新雜湊表
        for (Pair pair : bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair.val);
            }
        }
    }

    /* 列印雜湊表 */
    public void print() {
        for (Pair pair : buckets) {
            if (pair == null) {
                System.out.println("null");
            } else if (pair == TOMBSTONE) {
                System.out.println("TOMBSTONE");
            } else {
                System.out.println(pair.key + " -> " + pair.val);
            }
        }
    }
}

public class hash_map_open_addressing {
    public static void main(String[] args) {
        // 初始化雜湊表
        HashMapOpenAddressing hashmap = new HashMapOpenAddressing();

        // 新增操作
        // 在雜湊表中新增鍵值對 (key, val)
        hashmap.put(12836, "小哈");
        hashmap.put(15937, "小囉");
        hashmap.put(16750, "小算");
        hashmap.put(13276, "小法");
        hashmap.put(10583, "小鴨");
        System.out.println("\n新增完成後，雜湊表為\nKey -> Value");
        hashmap.print();

        // 查詢操作
        // 向雜湊表中輸入鍵 key ，得到值 val
        String name = hashmap.get(13276);
        System.out.println("\n輸入學號 13276 ，查詢到姓名 " + name);

        // 刪除操作
        // 在雜湊表中刪除鍵值對 (key, val)
        hashmap.remove(16750);
        System.out.println("\n刪除 16750 後，雜湊表為\nKey -> Value");
        hashmap.print();
    }
}
