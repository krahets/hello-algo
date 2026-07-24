/**
 * File: array_hash_map_test.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、内存安全、const正确性、禁止拷贝、无警告
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

/* 基于数组实现的哈希表 */
class ArrayHashMap {
private:
    std::vector<Pair*> buckets;
    static const int BUCKET_SIZE = 100;

    int hashFunc(int key) const {
        return key % BUCKET_SIZE;
    }

public:
    ArrayHashMap() {
        buckets.resize(BUCKET_SIZE, nullptr);
    }

    ~ArrayHashMap() {
        for (Pair*& p : buckets) {
            delete p;
            p = nullptr;
        }
        buckets.clear();
    }

    // 禁止拷贝，防止浅拷贝 double free
    ArrayHashMap(const ArrayHashMap&) = delete;
    ArrayHashMap& operator=(const ArrayHashMap&) = delete;

    std::string get(int key) const {
        int idx = hashFunc(key);
        return buckets[idx] ? buckets[idx]->val : "";
    }

    void put(int key, std::string val) {
        int idx = hashFunc(key);
        // 安全覆盖：先删除旧值
        if (buckets[idx]) {
            delete buckets[idx];
        }
        buckets[idx] = new Pair(key, std::move(val));
    }

    void remove(int key) {
        int idx = hashFunc(key);
        delete buckets[idx];
        buckets[idx] = nullptr;
    }

    std::vector<Pair*> pairSet() const {
        std::vector<Pair*> res;
        for (auto p : buckets) {
            if (p) res.push_back(p);
        }
        return res;
    }

    std::vector<int> keySet() const {
        std::vector<int> res;
        for (auto p : buckets) {
            if (p) res.push_back(p->key);
        }
        return res;
    }

    std::vector<std::string> valueSet() const {
        std::vector<std::string> res;
        for (auto p : buckets) {
            if (p) res.push_back(p->val);
        }
        return res;
    }

    void print() const {
        for (auto kv : pairSet()) {
            std::cout << kv->key << " -> " << kv->val << '\n';
        }
    }
};

/* Driver Code */
int main() {
    /* 初始化哈希表 */
    ArrayHashMap map;

    /* 添加操作 */
    map.put(12836, "小哈");
    map.put(15937, "小啰");
    map.put(16750, "小算");
    map.put(13276, "小法");
    map.put(10583, "小鸭");
    std::cout << "\n添加完成后，哈希表为\nKey -> Value\n";
    map.print();

    /* 查询操作 */
    std::string name = map.get(15937);
    std::cout << "\n输入学号 15937 ，查询到姓名 " << name << '\n';

    /* 删除操作 */
    map.remove(10583);
    std::cout << "\n删除 10583 后，哈希表为\nKey -> Value\n";
    map.print();

    /* 遍历哈希表 */
    std::cout << "\n遍历键值对 Key->Value\n";
    for (auto kv : map.pairSet()) {
        std::cout << kv->key << " -> " << kv->val << '\n';
    }

    std::cout << "\n单独遍历键 Key\n";
    for (auto key : map.keySet()) {
        std::cout << key << '\n';
    }

    std::cout << "\n单独遍历值 Value\n";
    for (auto val : map.valueSet()) {
        std::cout << val << '\n';
    }

    return 0;
}
