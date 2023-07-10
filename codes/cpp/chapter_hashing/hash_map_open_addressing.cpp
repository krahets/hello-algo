/**
 * File: hash_map_open_addressing.cpp
 * Created Time: 2023-06-13
 * Author: Krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* 开放寻址哈希表 */
class HashMapOpenAddressing {
  private:
    int size;               // 键值对数量
    int capacity;           // 哈希表容量
    double loadThres;       // 触发扩容的负载因子阈值
    int extendRatio;        // 扩容倍数
    vector<Pair *> buckets; // 桶数组
    Pair *removed;          // 删除标记

  public:
    /* 构造方法 */
    HashMapOpenAddressing() {
        // 构造方法
        size = 0;
        capacity = 4;
        loadThres = 2.0 / 3.0;
        extendRatio = 2;
        buckets = vector<Pair *>(capacity, nullptr);
        removed = new Pair(-1, "-1");
    }

    /* 哈希函数 */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* 负载因子 */
    double loadFactor() {
        return static_cast<double>(size) / capacity;
    }

    /* 查询操作 */
    string get(int key) {
        int index = hashFunc(key);
        // 线性探测，从 index 开始向后遍历
        for (int i = 0; i < capacity; i++) {
            // 计算桶索引，越过尾部返回头部
            int j = (index + i) % capacity;
            // 若遇到空桶，说明无此 key ，则返回 nullptr
            if (buckets[j] == nullptr)
                return nullptr;
            // 若遇到指定 key ，则返回对应 val
            if (buckets[j]->key == key && buckets[j] != removed)
                return buckets[j]->val;
        }
        return nullptr;
    }

    /* 添加操作 */
    void put(int key, string val) {
        // 当负载因子超过阈值时，执行扩容
        if (loadFactor() > loadThres)
            extend();
        int index = hashFunc(key);
        // 线性探测，从 index 开始向后遍历
        for (int i = 0; i < capacity; i++) {
            // 计算桶索引，越过尾部返回头部
            int j = (index + i) % capacity;
            // 若遇到空桶、或带有删除标记的桶，则将键值对放入该桶
            if (buckets[j] == nullptr || buckets[j] == removed) {
                buckets[j] = new Pair(key, val);
                size += 1;
                return;
            }
            // 若遇到指定 key ，则更新对应 val
            if (buckets[j]->key == key) {
                buckets[j]->val = val;
                return;
            }
        }
    }

    /* 删除操作 */
    void remove(int key) {
        int index = hashFunc(key);
        // 线性探测，从 index 开始向后遍历
        for (int i = 0; i < capacity; i++) {
            // 计算桶索引，越过尾部返回头部
            int j = (index + i) % capacity;
            // 若遇到空桶，说明无此 key ，则直接返回
            if (buckets[j] == nullptr)
                return;
            // 若遇到指定 key ，则标记删除并返回
            if (buckets[j]->key == key) {
                delete buckets[j]; // 释放内存
                buckets[j] = removed;
                size -= 1;
                return;
            }
        }
    }

    /* 扩容哈希表 */
    void extend() {
        // 暂存原哈希表
        vector<Pair *> bucketsTmp = buckets;
        // 初始化扩容后的新哈希表
        capacity *= extendRatio;
        buckets = vector<Pair *>(capacity, nullptr);
        size = 0;
        // 将键值对从原哈希表搬运至新哈希表
        for (Pair *pair : bucketsTmp) {
            if (pair != nullptr && pair != removed) {
                put(pair->key, pair->val);
            }
        }
    }

    /* 打印哈希表 */
    void print() {
        for (auto &pair : buckets) {
            if (pair != nullptr) {
                cout << pair->key << " -> " << pair->val << endl;
            } else {
                cout << "nullptr" << endl;
            }
        }
    }
};

/* Driver Code */
int main() {
    /* 初始化哈希表 */
    HashMapOpenAddressing map = HashMapOpenAddressing();

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
    string name = map.get(13276);
    cout << "\n输入学号 13276 ，查询到姓名 " << name << endl;

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.remove(16750);
    cout << "\n删除 16750 后，哈希表为\nKey -> Value" << endl;
    map.print();

    return 0;
}
