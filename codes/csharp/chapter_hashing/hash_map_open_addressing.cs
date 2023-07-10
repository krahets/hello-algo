/**
* File: hash_map_open_addressing.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

/* 开放寻址哈希表 */
class HashMapOpenAddressing {
    int size; // 键值对数量
    int capacity; // 哈希表容量
    double loadThres; // 触发扩容的负载因子阈值
    int extendRatio; // 扩容倍数
    Pair[] buckets; // 桶数组
    Pair removed; // 删除标记

    /* 构造方法 */
    public HashMapOpenAddressing() {
        size = 0;
        capacity = 4;
        loadThres = 2.0 / 3.0;
        extendRatio = 2;
        buckets = new Pair[capacity];
        removed = new Pair(-1, "-1");
    }

    /* 哈希函数 */
    private int hashFunc(int key) {
        return key % capacity;
    }

    /* 负载因子 */
    private double loadFactor() {
        return (double)size / capacity;
    }

    /* 查询操作 */
    public string get(int key) {
        int index = hashFunc(key);
        // 线性探测，从 index 开始向后遍历
        for (int i = 0; i < capacity; i++) {
            // 计算桶索引，越过尾部返回头部
            int j = (index + i) % capacity;
            // 若遇到空桶，说明无此 key ，则返回 null
            if (buckets[j] == null)
                return null;
            // 若遇到指定 key ，则返回对应 val
            if (buckets[j].key == key && buckets[j] != removed)
                return buckets[j].val;
        }
        return null;
    }

    /* 添加操作 */
    public void put(int key, string val) {
        // 当负载因子超过阈值时，执行扩容
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        // 线性探测，从 index 开始向后遍历
        for (int i = 0; i < capacity; i++) {
            // 计算桶索引，越过尾部返回头部
            int j = (index + i) % capacity;
            // 若遇到空桶、或带有删除标记的桶，则将键值对放入该桶
            if (buckets[j] == null || buckets[j] == removed) {
                buckets[j] = new Pair(key, val);
                size += 1;
                return;
            }
            // 若遇到指定 key ，则更新对应 val
            if (buckets[j].key == key) {
                buckets[j].val = val;
                return;
            }
        }
    }

    /* 删除操作 */
    public void remove(int key) {
        int index = hashFunc(key);
        // 线性探测，从 index 开始向后遍历
        for (int i = 0; i < capacity; i++) {
            // 计算桶索引，越过尾部返回头部
            int j = (index + i) % capacity;
            // 若遇到空桶，说明无此 key ，则直接返回
            if (buckets[j] == null) {
                return;
            }
            // 若遇到指定 key ，则标记删除并返回
            if (buckets[j].key == key) {
                buckets[j] = removed;
                size -= 1;
                return;
            }
        }
    }

    /* 扩容哈希表 */
    private void extend() {
        // 暂存原哈希表
        Pair[] bucketsTmp = buckets;
        // 初始化扩容后的新哈希表
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // 将键值对从原哈希表搬运至新哈希表
        foreach (Pair pair in bucketsTmp) {
            if (pair != null && pair != removed) {
                put(pair.key, pair.val);
            }
        }
    }

    /* 打印哈希表 */
    public void print() {
        foreach (Pair pair in buckets) {
            if (pair != null) {
                Console.WriteLine(pair.key + " -> " + pair.val);
            } else {
                Console.WriteLine("null");
            }
        }
    }
}

public class hash_map_open_addressing {
    [Test]
    public void Test() {
        /* 初始化哈希表 */
        HashMapOpenAddressing map = new HashMapOpenAddressing();

        /* 添加操作 */
        // 在哈希表中添加键值对 (key, value)
        map.put(12836, "小哈");
        map.put(15937, "小啰");
        map.put(16750, "小算");
        map.put(13276, "小法");
        map.put(10583, "小鸭");
        Console.WriteLine("\n添加完成后，哈希表为\nKey -> Value");
        map.print();

        /* 查询操作 */
        // 向哈希表输入键 key ，得到值 value
        string name = map.get(13276);
        Console.WriteLine("\n输入学号 13276 ，查询到姓名 " + name);

        /* 删除操作 */
        // 在哈希表中删除键值对 (key, value)
        map.remove(16750);
        Console.WriteLine("\n删除 16750 后，哈希表为\nKey -> Value");
        map.print();
    }
}
