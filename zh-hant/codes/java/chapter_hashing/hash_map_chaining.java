/**
 * File: hash_map_chaining.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.ArrayList;
import java.util.List;

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
        buckets = new ArrayList<>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.add(new ArrayList<>());
        }
    }

    /* 雜湊函式 */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* 負載因子 */
    double loadFactor() {
        return (double) size / capacity;
    }

    /* 查詢操作 */
    String get(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // 走訪桶中的元素，若找到 key，就回傳對應的 val
        for (Pair pair : bucket) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // 若找不到 key，回傳 null
        return null;
    }

    /* 新增操作 */
    void put(int key, String val) {
        // 當負載因子超過門檻時，擴充容量
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
        for (Pair pair : bucket) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // 若沒有這個 key，就將鍵值對加到尾端
        Pair pair = new Pair(key, val);
        bucket.add(pair);
        size++;
    }

    /* 刪除操作 */
    void remove(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // 走訪桶中的元素，從中刪除鍵值對
        for (Pair pair : bucket) {
            if (pair.key == key) {
                bucket.remove(pair);
                size--;
                break;
            }
        }
    }

    /* 擴充雜湊表容量 */
    void extend() {
        // 暫存原本的雜湊表
        List<List<Pair>> bucketsTmp = buckets;
        // 初始化擴充後的新雜湊表
        capacity *= extendRatio;
        buckets = new ArrayList<>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.add(new ArrayList<>());
        }
        size = 0;
        // 將鍵值對從原本的雜湊表移到新表
        for (List<Pair> bucket : bucketsTmp) {
            for (Pair pair : bucket) {
                put(pair.key, pair.val);
            }
        }
    }

    /* 印出雜湊表 */
    void print() {
        for (List<Pair> bucket : buckets) {
            List<String> res = new ArrayList<>();
            for (Pair pair : bucket) {
                res.add(pair.key + " -> " + pair.val);
            }
            System.out.println(res);
        }
    }
}

public class hash_map_chaining {
    public static void main(String[] args) {
        /* 初始化雜湊表 */
        HashMapChaining map = new HashMapChaining();

        /* 新增操作 */
        // 在雜湊表中新增鍵值對 (key, value)
        map.put(12836, "小哈");
        map.put(15937, "小囉");
        map.put(16750, "小算");
        map.put(13276, "小法");
        map.put(10583, "小鴨");
        System.out.println("\n新增後的雜湊表\nKey -> Value");
        map.print();

        /* 查詢操作 */
        // 輸入鍵 key，從雜湊表取得對應的值 value
        String name = map.get(13276);
        System.out.println("\n輸入學號 13276，查得姓名 " + name);

        /* 刪除操作 */
        // 從雜湊表刪除鍵值對 (key, value)
        map.remove(12836);
        System.out.println("\n刪除 12836 後的雜湊表\nKey -> Value");
        map.print();
    }
}
