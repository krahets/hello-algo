/**
 * File: hash_map_open_addressing.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、内存安全、禁止拷贝、const正确性、类型安全
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

/* 开放寻址哈希表（线性探测） */
class HashMapOpenAddressing {
private:
    int size;
    int capacity;
    const double loadThres;
    const int extendRatio;
    std::vector<Pair*> buckets;
    Pair* const TOMBSTONE;

    /* 哈希函数 */
    int hashFunc(int key) const {
        return key % capacity;
    }

    /* 负载因子 */
    double loadFactor() const {
        return static_cast<double>(size) / capacity;
    }

    /* 查找 key 对应的桶索引 */
    int findBucket(int key) const {
        int index = hashFunc(key);
        int firstTombstone = -1;

        while (buckets[index] != nullptr) {
            if (buckets[index]->key == key) {
                return (firstTombstone != -1) ? firstTombstone : index;
            }
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            index = (index + 1) % capacity;
        }
        return (firstTombstone != -1) ? firstTombstone : index;
    }

public:
    /* 构造 */
    HashMapOpenAddressing()
        : size(0),
          capacity(4),
          loadThres(2.0 / 3.0),
          extendRatio(2),
          buckets(capacity, nullptr),
          TOMBSTONE(new Pair(-1, "-1")) {}

    /* 析构 */
    ~HashMapOpenAddressing() {
        for (Pair* p : buckets) {
            if (p != nullptr && p != TOMBSTONE) {
                delete p;
            }
        }
        delete TOMBSTONE;
    }

    // 禁止拷贝/赋值，防止浅拷贝 double free
    HashMapOpenAddressing(const HashMapOpenAddressing&) = delete;
    HashMapOpenAddressing& operator=(const HashMapOpenAddressing&) = delete;

    /* 查询 */
    std::string get(int key) const {
        int idx = findBucket(key);
        Pair* p = buckets[idx];
        return (p != nullptr && p != TOMBSTONE) ? p->val : "";
    }

    /* 添加 */
    void put(int key, std::string val) {
        if (loadFactor() > loadThres) {
            extend();
        }
        int idx = findBucket(key);
        Pair* p = buckets[idx];

        if (p != nullptr && p != TOMBSTONE) {
            p->val = std::move(val);
            return;
        }
        buckets[idx] = new Pair(key, std::move(val));
        ++size;
    }

    /* 删除 */
    void remove(int key) {
        int idx = findBucket(key);
        Pair* p = buckets[idx];

        if (p != nullptr && p != TOMBSTONE) {
            delete p;
            buckets[idx] = TOMBSTONE;
            --size;
        }
    }

    /* 扩容 */
    void extend() {
        auto oldBuckets = std::move(buckets);
        capacity *= extendRatio;
        buckets.assign(capacity, nullptr);
        size = 0;

        for (Pair* p : oldBuckets) {
            if (p != nullptr && p != TOMBSTONE) {
                put(p->key, p->val);
                delete p;
            }
        }
    }

    /* 打印 */
    void print() const {
        for (const Pair* p : buckets) {
            if (p == nullptr) {
                std::cout << "nullptr\n";
            } else if (p == TOMBSTONE) {
                std::cout << "TOMBSTONE\n";
            } else {
                std::cout << p->key << " -> " << p->val << "\n";
            }
        }
    }
};

/* Driver Code */
int main() {
    HashMapOpenAddressing hashmap;

    hashmap.put(12836, "小哈");
    hashmap.put(15937, "小啰");
    hashmap.put(16750, "小算");
    hashmap.put(13276, "小法");
    hashmap.put(10583, "小鸭");
    std::cout << "\n添加完成后，哈希表为\nKey -> Value\n";
    hashmap.print();

    std::string name = hashmap.get(13276);
    std::cout << "\n输入学号 13276 ，查询到姓名 " << name << "\n";

    hashmap.remove(16750);
    std::cout << "\n删除 16750 后，哈希表为\nKey -> Value\n";
    hashmap.print();

    return 0;
}
