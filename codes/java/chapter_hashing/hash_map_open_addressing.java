/**
 * File: hash_map_open_addressing.java
 * Created Time: 2023-06-13
 * Author: Krahets (krahets@163.com)
 */

package chapter_hashing;

/* 开放寻址哈希表 */
class HashMapOpenAddressing {
    private int size; // 键值对数量
    private int capacity; // 哈希表容量
    private double loadThres; // 触发扩容的负载因子阈值
    private int extendRatio; // 扩容倍数
    private Pair[] buckets; // 桶数组
    private Pair removed; // 删除标记

   /* 构造方法 */
    public HashMapOpenAddressing() {
        size = 0;
        capacity = 4;
        buckets = new Pair[capacity];
    }

    /* 哈希函数 */
    private int hashFunc(int key) {
        return key % capacity;
    }

    /* 负载因子 */
    private double loadFactor() {
        return (double) size / capacity;
    }
    /* 是否被占用 */
    private boolean isOccupied(int index) {
        return buckets[index] != null  && buckets[index] != removed;
    }

    /* 搜索 key 对应的桶索引 */
    private int findBucket(int key) {
        int index = hashFunc(key);
        // 线性探测，当遇到空桶时跳出
        while (isOccupied(index)) {
            // 若遇到 key ，返回对应桶索引
            if (buckets[index].key == key)
                return index;
            // 计算桶索引，越过尾部返回头部
            index = (index + 1) % capacity;
        }
        return index;
    }

    /* 查询操作 */
    public String get(int key) {
        int index = findBucket(key);
        // 若找到桶索引，则返回对应 val
        if (isOccupied(index))
            return buckets[index].val;
        // 若未找到桶索引，则返回 null
        return null;
    }

    /* 添加操作 */
    public void put(int key, String val) {
        int index = findBucket(key);
        // 若找到桶索引，则覆盖 val 并返回
        if (isOccupied(index)) {
            buckets[index].val = val;
            return;
        }
        // 当负载因子超过阈值时，执行扩容
        if (loadFactor() > loadThres) {
            extend();
            index = findBucket(key);
        }

        // 若未找到桶索引，则添加该键值对
        buckets[index] = new Pair(key, val);
        size++;

    }

    /* 删除操作 */
    public void remove(int key) {
        int index = findBucket(key);
        // 若找到桶索引，则标记删除它
        if (isOccupied(index)) {
            buckets[index] = removed;
            size--;
            // 移动,确保每个key的hash位置和实际位置之间都是连续占用的。
            int j = (index + 1) % capacity;
            while (isOccupied(j)) {
                int k = hashFunc(buckets[j].key);
                if ((index < j) && (k > j || k <= index) ||
                        (index > j) && (k > j && k <= index)) {
                    buckets[index] = buckets[j];
                    buckets[j] = removed;
                    index = j;
                }
                j = (j + 1) % capacity;
            }
        }
    }

    /* 扩容哈希表 */
    private void extend() {
        Pair[] oldBuckets = buckets;
        // 初始化扩容后的新哈希表
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // 将键值对从原哈希表搬运至新哈希表
        for (Pair pair : oldBuckets) {
            if (pair != null && pair != removed)
                put(pair.key, pair.val);
        }
    }

    /* 打印哈希表 */
    public void print() {
        for (Pair pair : buckets) {
            if (pair != null)
                System.out.println(pair.key + " -> " + pair.val);
            else
                System.out.println("null");
        }
    }
}
    
public class hash_map_open_addressing {
    public static void main(String[] args) {
        /* 初始化哈希表 */
        HashMapOpenAddressing map = new HashMapOpenAddressing();

        /* 添加操作 */
        // 在哈希表中添加键值对 (key, value)
        map.put(12836, "小哈");
        map.put(15937, "小啰");
        map.put(16750, "小算");
        map.put(13276, "小法");
        map.put(10583, "小鸭");
        System.out.println("\n添加完成后，哈希表为\nKey -> Value");
        map.print();

        /* 查询操作 */
        // 向哈希表输入键 key ，得到值 value
        String name = map.get(13276);
        System.out.println("\n输入学号 13276 ，查询到姓名 " + name);

        /* 删除操作 */
        // 在哈希表中删除键值对 (key, value)
        map.remove(16750);
        System.out.println("\n删除 16750 后，哈希表为\nKey -> Value");
        map.print();
    }
}
