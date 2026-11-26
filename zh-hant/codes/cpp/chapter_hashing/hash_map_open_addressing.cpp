/**
 * File: hash_map_open_addressing.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* 採用開放定址法的雜湊表 */
class HashMapOpenAddressing {
  private:
    int size;                             // 鍵值對數量
    int capacity = 4;                     // 雜湊表容量
    const double loadThres = 2.0 / 3.0;     // 觸發容量擴充的負載因子門檻
    const int extendRatio = 2;            // 容量擴充倍數
    vector<Pair *> buckets;               // 桶陣列
    Pair *TOMBSTONE = new Pair(-1, "-1"); // 刪除標記

  public:
    /* 建構方法 */
    HashMapOpenAddressing() : size(0), buckets(capacity, nullptr) {
    }

    /* 解構方法 */
    ~HashMapOpenAddressing() {
        for (Pair *pair : buckets) {
            if (pair != nullptr && pair != TOMBSTONE) {
                delete pair;
            }
        }
        delete TOMBSTONE;
    }

    /* 雜湊函式 */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* 負載因子 */
    double loadFactor() {
        return (double)size / capacity;
    }

    /* 尋找 key 對應的桶索引 */
    int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // 進行線性探測，遇到空桶就跳出迴圈
        while (buckets[index] != nullptr) {
            // 若遇到 key，回傳對應的桶索引
            if (buckets[index]->key == key) {
                // 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // 回傳移動後的桶索引
                }
                return index; // 回傳桶索引
            }
            // 記錄遇到的第一個刪除標記
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // 計算桶索引，超過陣列尾端就回到開頭
            index = (index + 1) % capacity;
        }
        // 若 key 不存在，回傳可插入位置的索引
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* 查詢操作 */
    string get(int key) {
        // 尋找 key 對應的桶索引
        int index = findBucket(key);
        // 若找到鍵值對，回傳對應的 val
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            return buckets[index]->val;
        }
        // 若鍵值對不存在，回傳空字串
        return "";
    }

    /* 新增操作 */
    void put(int key, string val) {
        // 當負載因子超過門檻時，擴充容量
        if (loadFactor() > loadThres) {
            extend();
        }
        // 尋找 key 對應的桶索引
        int index = findBucket(key);
        // 若找到鍵值對，覆寫 val 並結束操作
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            buckets[index]->val = val;
            return;
        }
        // 若鍵值對不存在，新增該鍵值對
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* 刪除操作 */
    void remove(int key) {
        // 尋找 key 對應的桶索引
        int index = findBucket(key);
        // 若找到鍵值對，以刪除標記取代它
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            delete buckets[index];
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* 擴充雜湊表容量 */
    void extend() {
        // 暫存原本的雜湊表
        vector<Pair *> bucketsTmp = buckets;
        // 初始化擴充後的新雜湊表
        capacity *= extendRatio;
        buckets = vector<Pair *>(capacity, nullptr);
        size = 0;
        // 將鍵值對從原本的雜湊表移到新表
        for (Pair *pair : bucketsTmp) {
            if (pair != nullptr && pair != TOMBSTONE) {
                put(pair->key, pair->val);
                delete pair;
            }
        }
    }

    /* 印出雜湊表 */
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

/* 主程式 */
int main() {
    // 初始化雜湊表
    HashMapOpenAddressing hashmap;

    // 新增操作
    // 在雜湊表中新增鍵值對 (key, val)
    hashmap.put(12836, "小哈");
    hashmap.put(15937, "小囉");
    hashmap.put(16750, "小算");
    hashmap.put(13276, "小法");
    hashmap.put(10583, "小鴨");
    cout << "\n新增後的雜湊表\nKey -> Value" << endl;
    hashmap.print();

    // 查詢操作
    // 輸入鍵 key，從雜湊表取得對應的值 val
    string name = hashmap.get(13276);
    cout << "\n輸入學號 13276，查得姓名 " << name << endl;

    // 刪除操作
    // 從雜湊表刪除鍵值對 (key, val)
    hashmap.remove(16750);
    cout << "\n刪除 16750 後的雜湊表\nKey -> Value" << endl;
    hashmap.print();

    return 0;
}
