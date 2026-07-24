/**
 * File: array_hash_map.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、内存安全、const正确性、重复键处理
 */

#include "../utils/common.hpp"
#include <vector>
#include <string>
#include <iostream>

/* 键值对 */
struct Pair {
public:
    int key;
    std::string val;

    // 构造函数
    Pair(int key, std::string val) : key(key), val(std::move(val)) {}
};

/* 基于数组实现的哈希表 */
class ArrayHashMap {
private:
    std::vector<Pair*> buckets;
    static const int BUCKET_SIZE = 100;

    /* 哈希函数 */
    int hashFunc(int key) const {
        return key % BUCKET_SIZE;
    }

public:
    /* 初始化 100 个桶 */
    ArrayHashMap() {
        buckets.resize(BUCKET_SIZE, nullptr);
    }

    /* 析构函数，释放所有内存 */
    ~ArrayHashMap() {
        for (Pair*& bucket : buckets) {
            delete bucket;
            bucket = nullptr;
        }
        buckets.clear();
    }

    /* 禁止拷贝（避免浅拷贝 double free） */
    ArrayHashMap(const ArrayHashMap&) = delete;
    ArrayHashMap& operator=(const ArrayHashMap&) = delete;

    /* 查询操作 */
    std::string get(int key) const {
        int idx = hashFunc(key);
        Pair* pair = buckets[idx];
        return pair ? pair->val : "";
    }

    /* 添加操作（自动覆盖重复键）*/
    void put(int key, std::string val) {
        int idx = hashFunc(key);
        // 若已存在，先释放旧内存
        if (buckets[idx] != nullptr) {
            delete buckets[idx];
        }
        buckets[idx] = new Pair(key, std::move(val));
    }

    /* 删除操作 */
    void remove(int key) {
        int idx = hashFunc(key);
        delete buckets[idx];
        buckets[idx] = nullptr;
    }

    /* 获取所有键值对 */
    std::vector<Pair*> pairSet() const {
        std::vector<Pair*> res;
        for (Pair* p : buckets) {
            if (p) res.push_back(p);
        }
        return res;
    }

    /* 获取所有键 */
    std::vector<int> keySet() const {
        std::vector<int> res;
        for (Pair* p : buckets) {
            if (p) res.push_back(p->key);
        }
        return res;
    }

    /* 获取所有值 */
    std::vector<std::string> valueSet() const {
        std::vector<std::string> res;
        for (Pair* p : buckets) {
            if (p) res.push_back(p->val);
        }
        return res;
    }

    /* 打印哈希表 */
    void print() const {
        for (const Pair* kv : pairSet()) {
            std::cout << kv->key << " -> " << kv->val << '\n';
        }
    }
};
