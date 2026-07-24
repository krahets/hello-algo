/**
 * File: hash_map_chaining.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、内存安全、const正确性、禁止拷贝、类型安全
 */

#include <vector>
#include <string>
#include <iostream>

/* 键值对 */
struct Pair {
public:
    int key;
    std::string val;
    Pair(int key, std::string val) : key(key), val(std::move(val)) {}
};

/* 链式地址哈希表 */
class HashMapChaining {
private:
    int size;                       // 键值对数量
    int capacity;                   // 哈希表容量
    double loadThres;               // 负载因子阈值
    int extendRatio;                // 扩容倍数
    std::vector<std::vector<Pair*>> buckets; // 桶数组

    /* 哈希函数 */
    int hashFunc(int key) const {
        return key % capacity;
    }

    /* 负载因子 */
    double loadFactor() const {
        return static_cast<double>(size) / capacity;
    }

public:
    /* 构造方法 */
    HashMapChaining()
        : size(0), capacity(4), loadThres(2.0 / 3.0), extendRatio(2) {
        buckets.resize(capacity);
    }

    /* 析构方法 */
    ~HashMapChaining() {
        clear();
    }

    // 禁止拷贝与赋值（避免浅拷贝导致 double free）
    HashMapChaining(const HashMapChaining&) = delete;
    HashMapChaining& operator=(const HashMapChaining&) = delete;

    /* 释放所有内存 */
    void clear() {
        for (auto& bucket : buckets) {
            for (Pair* p : bucket) {
                delete p;
            }
            bucket.clear();
        }
        buckets.clear();
        size = 0;
        capacity = 0;
    }

    /* 查询操作 */
    std::string get(int key) const {
        int idx = hashFunc(key);
        for (const Pair* p : buckets[idx]) {
            if (p->key == key) {
                return p->val;
            }
        }
        return "";
    }

    /* 添加操作 */
    void put(int key, std::string val) {
        if (loadFactor() > loadThres) {
            extend();
        }
        int idx = hashFunc(key);
        // 遍历更新
        for (Pair* p : buckets[idx]) {
            if (p->key == key) {
                p->val = std::move(val);
                return;
            }
        }
        // 新增
        buckets[idx].emplace_back(new Pair(key, std::move(val)));
        ++size;
    }

    /* 删除操作 */
    void remove(int key) {
        int idx = hashFunc(key);
        auto& bucket = buckets[idx];
        for (auto it = bucket.begin(); it != bucket.end(); ++it) {
            if ((*it)->key == key) {
                delete *it;
                bucket.erase(it);
                --size;
                return;
            }
        }
    }

    /* 扩容哈希表 */
    void extend() {
        // 暂存旧桶
        auto oldBuckets = std::move(buckets);
        // 新容量
        capacity *= extendRatio;
        buckets.clear();
        buckets.resize(capacity);
        size = 0;
        // 重新哈希
        for (auto& bucket : oldBuckets) {
            for (Pair* p : bucket) {
                put(p->key, std::move(p->val));
                delete p;
            }
            bucket.clear();
        }
    }

    /* 打印哈希表 */
    void print() const {
        for (const auto& bucket : buckets) {
            std::cout << "[";
            for (const Pair* p : bucket) {
                std::cout << p->key << " -> " << p->val << ", ";
            }
            std::cout << "]\n";
        }
    }
};

/* Driver Code */
int main() {
    HashMapChaining map;

    map.put(12836, "小哈");
    map.put(15937, "小啰");
    map.put(16750, "小算");
    map.put(13276, "小法");
    map.put(10583, "小鸭");
    std::cout << "\n添加完成后，哈希表为\nKey -> Value\n";
    map.print();

    std::string name = map.get(13276);
    std::cout << "\n输入学号 13276 ，查询到姓名 " << name << '\n';

    map.remove(12836);
    std::cout << "\n删除 12836 后，哈希表为\nKey -> Value\n";
    map.print();

    return 0;
}
