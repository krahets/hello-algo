/**
 * File: hash_map_chaining.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* 鏈式位址雜湊表 */
class HashMapChaining {
  private:
    int size;                       // 鍵值對數量
    int capacity;                   // 雜湊表容量
    double loadThres;               // 觸發擴容的負載因子閾值
    int extendRatio;                // 擴容倍數
    vector<vector<Pair *>> buckets; // 桶陣列

  public:
    /* 建構子 */
    HashMapChaining() : size(0), capacity(4), loadThres(2.0 / 3.0), extendRatio(2) {
        buckets.resize(capacity);
    }

    /* 析構方法 */
    ~HashMapChaining() {
        for (auto &bucket : buckets) {
            for (Pair *pair : bucket) {
                // 釋放記憶體
                delete pair;
            }
        }
    }

    /* 雜湊函式 */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* 負載因子 */
    double loadFactor() {
        return (double)size / (double)capacity;
    }

    /* 查詢操作 */
    string get(int key) {
        int index = hashFunc(key);
        // 走訪桶，若找到 key ，則返回對應 val
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                return pair->val;
            }
        }
        // 若未找到 key ，則返回空字串
        return "";
    }

    /* 新增操作 */
    void put(int key, string val) {
        // 當負載因子超過閾值時，執行擴容
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        // 走訪桶，若遇到指定 key ，則更新對應 val 並返回
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                pair->val = val;
                return;
            }
        }
        // 若無該 key ，則將鍵值對新增至尾部
        buckets[index].push_back(new Pair(key, val));
        size++;
    }

    /* 刪除操作 */
    void remove(int key) {
        int index = hashFunc(key);
        auto &bucket = buckets[index];
        // 走訪桶，從中刪除鍵值對
        for (int i = 0; i < bucket.size(); i++) {
            if (bucket[i]->key == key) {
                Pair *tmp = bucket[i];
                bucket.erase(bucket.begin() + i); // 從中刪除鍵值對
                delete tmp;                       // 釋放記憶體
                size--;
                return;
            }
        }
    }

    /* 擴容雜湊表 */
    void extend() {
        // 暫存原雜湊表
        vector<vector<Pair *>> bucketsTmp = buckets;
        // 初始化擴容後的新雜湊表
        capacity *= extendRatio;
        buckets.clear();
        buckets.resize(capacity);
        size = 0;
        // 將鍵值對從原雜湊表搬運至新雜湊表
        for (auto &bucket : bucketsTmp) {
            for (Pair *pair : bucket) {
                put(pair->key, pair->val);
                // 釋放記憶體
                delete pair;
            }
        }
    }

    /* 列印雜湊表 */
    void print() {
        for (auto &bucket : buckets) {
            cout << "[";
            for (Pair *pair : bucket) {
                cout << pair->key << " -> " << pair->val << ", ";
            }
            cout << "]\n";
        }
    }
};

/* Driver Code */
int main() {
    /* 初始化雜湊表 */
    HashMapChaining map = HashMapChaining();

    /* 新增操作 */
    // 在雜湊表中新增鍵值對 (key, value)
    map.put(12836, "小哈");
    map.put(15937, "小囉");
    map.put(16750, "小算");
    map.put(13276, "小法");
    map.put(10583, "小鴨");
    cout << "\n新增完成後，雜湊表為\nKey -> Value" << endl;
    map.print();

    /* 查詢操作 */
    // 向雜湊表中輸入鍵 key ，得到值 value
    string name = map.get(13276);
    cout << "\n輸入學號 13276 ，查詢到姓名 " << name << endl;

    /* 刪除操作 */
    // 在雜湊表中刪除鍵值對 (key, value)
    map.remove(12836);
    cout << "\n刪除 12836 後，雜湊表為\nKey -> Value" << endl;
    map.print();

    return 0;
}
