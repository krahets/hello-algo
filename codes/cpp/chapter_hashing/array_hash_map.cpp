/**
 * File: array_hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* 键值对 int->String */
struct Entry {
  public:
    int key;
    string val;
    Entry(int key, string val) {
        this->key = key;
        this->val = val;
    }
};

/* 基于数组简易实现的哈希表 */
class ArrayHashMap {
  private:
    vector<Entry *> buckets;

  public:
    ArrayHashMap() {
        // 初始化数组，包含 100 个桶
        buckets = vector<Entry *>(100);
    }

    ~ArrayHashMap() {
        // 释放内存
        for (const auto &bucket : buckets) {
            delete bucket;
        }
        buckets.clear();
    }

    /* 哈希函数 */
    int hashFunc(int key) {
        int index = key % 100;
        return index;
    }

    /* 查询操作 */
    string get(int key) {
        int index = hashFunc(key);
        Entry *pair = buckets[index];
        if (pair == nullptr)
            return nullptr;
        return pair->val;
    }

    /* 添加操作 */
    void put(int key, string val) {
        Entry *pair = new Entry(key, val);
        int index = hashFunc(key);
        buckets[index] = pair;
    }

    /* 删除操作 */
    void remove(int key) {
        int index = hashFunc(key);
        // 释放内存并置为 nullptr
        delete buckets[index];
        buckets[index] = nullptr;
    }

    /* 获取所有键值对 */
    vector<Entry *> entrySet() {
        vector<Entry *> entrySet;
        for (Entry *pair : buckets) {
            if (pair != nullptr) {
                entrySet.push_back(pair);
            }
        }
        return entrySet;
    }

    /* 获取所有键 */
    vector<int> keySet() {
        vector<int> keySet;
        for (Entry *pair : buckets) {
            if (pair != nullptr) {
                keySet.push_back(pair->key);
            }
        }
        return keySet;
    }

    /* 获取所有值 */
    vector<string> valueSet() {
        vector<string> valueSet;
        for (Entry *pair : buckets) {
            if (pair != nullptr) {
                valueSet.push_back(pair->val);
            }
        }
        return valueSet;
    }

    /* 打印哈希表 */
    void print() {
        for (Entry *kv : entrySet()) {
            cout << kv->key << " -> " << kv->val << endl;
        }
    }
};

/* Driver Code */
int main() {
    /* 初始化哈希表 */
    ArrayHashMap map = ArrayHashMap();

    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map.put(12836, "小哈");
    map.put(15937, "小啰");
    map.put(16750, "小算");
    map.put(13276, "小法");
    map.put(10583, "小鸭");
    cout << "\n添加完成后，哈希表为\nKey -> Value" << endl;
    map.print();

    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    string name = map.get(15937);
    cout << "\n输入学号 15937 ，查询到姓名 " << name << endl;

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.remove(10583);
    cout << "\n删除 10583 后，哈希表为\nKey -> Value" << endl;
    map.print();

    /* 遍历哈希表 */
    cout << "\n遍历键值对 Key->Value" << endl;
    for (auto kv : map.entrySet()) {
        cout << kv->key << " -> " << kv->val << endl;
    }

    cout << "\n单独遍历键 Key" << endl;
    for (auto key : map.keySet()) {
        cout << key << endl;
    }

    cout << "\n单独遍历值 Value" << endl;
    for (auto val : map.valueSet()) {
        cout << val << endl;
    }

    return 0;
}
