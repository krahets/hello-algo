/**
 * File: hash_map_open_addressing.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* 开放寻址哈希表 */
class HashMapOpenAddressing {
  private:
    int size;                             // 键值对数量
    int capacity = 4;                     // 哈希表容量
    const double loadThres = 2.0 / 3.0;     // 触发扩容的负载因子阈值
    const int extendRatio = 2;            // 扩容倍数
    vector<Pair *> buckets;               // 桶数组
    Pair *TOMBSTONE = new Pair(-1, "-1"); // 删除标记

  public:
    /* 构造方法 */
    HashMapOpenAddressing() : size(0), buckets(capacity, nullptr) {
    }

    /* 析构方法 */
    ~HashMapOpenAddressing() {
        for (Pair *pair : buckets) {
            if (pair != nullptr && pair != TOMBSTONE) {
                delete pair;
            }
        }
        delete TOMBSTONE;
    }

    /* 哈希函数 */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* 负载因子 */
    double loadFactor() {
        return (double)size / capacity;
    }

    /* 搜索 key 对应的桶索引 */
    int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // 线性探测，当遇到空桶时跳出
        while (buckets[index] != nullptr) {
            // 若遇到 key ，返回对应的桶索引
            if (buckets[index]->key == key) {
                // 若之前遇到了删除标记，则将键值对移动至该索引处
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // 返回移动后的桶索引
                }
                return index; // 返回桶索引
            }
            // 记录遇到的首个删除标记
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // 计算桶索引，越过尾部则返回头部
            index = (index + 1) % capacity;
        }
        // 若 key 不存在，则返回添加点的索引
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* 查询操作 */
    string get(int key) {
        // 搜索 key 对应的桶索引
        int index = findBucket(key);
        // 若找到键值对，则返回对应 val
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            return buckets[index]->val;
        }
        // 若键值对不存在，则返回空字符串
        return "";
    }

    /* 添加操作 */
    void put(int key, string val) {
        // 当负载因子超过阈值时，执行扩容
        if (loadFactor() > loadThres) {
            extend();
        }
        // 搜索 key 对应的桶索引
        int index = findBucket(key);
        // 若找到键值对，则覆盖 val 并返回
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            buckets[index]->val = val;
            return;
        }
        // 若键值对不存在，则添加该键值对
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* 删除操作 */
    void remove(int key) {
        // 搜索 key 对应的桶索引
        int index = findBucket(key);
        // 若找到键值对，则用删除标记覆盖它
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            delete buckets[index];
            buckets[index] = TOMBSTONE;
            size--;
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
            if (pair != nullptr && pair != TOMBSTONE) {
                put(pair->key, pair->val);
                delete pair;
            }
        }
    }

    /* 打印哈希表 */
    void print() {
        for (Pair *pair : buckets) {
            if (pair == nullptr) {
                cout << "nullptr" << endl;
            } else if (pair == TOMBSTONE) {
                cout << "TOMBSTONE" << endl;
            } else {
                cout << pair->key << " -> " << pair->val << endl;
            }
        }
    }
};

/* Driver Code */
int main() {
    // 初始化哈希表
    HashMapOpenAddressing hashmap;

    // 添加操作
    // 在哈希表中添加键值对 (key, val)
    hashmap.put(12836, "小哈");
    hashmap.put(15937, "小啰");
    hashmap.put(16750, "小算");
    hashmap.put(13276, "小法");
    hashmap.put(10583, "小鸭");
    cout << "\n添加完成后，哈希表为\nKey -> Value" << endl;
    hashmap.print();

    // 查询操作
    // 向哈希表中输入键 key ，得到值 val
    string name = hashmap.get(13276);
    cout << "\n输入学号 13276 ，查询到姓名 " << name << endl;

    // 删除操作
    // 在哈希表中删除键值对 (key, val)
    hashmap.remove(16750);
    cout << "\n删除 16750 后，哈希表为\nKey -> Value" << endl;
    hashmap.print();

    return 0;
}
