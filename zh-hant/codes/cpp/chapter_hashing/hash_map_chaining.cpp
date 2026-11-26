/**
 * File: hash_map_chaining.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* 鏈結法雜湊表 */
class HashMapChaining {
  private:
    int size;                       // 鍵值對數量
    int capacity;                   // 雜湊表容量
    double loadThres;               // 觸發容量擴充的負載因子門檻
    int extendRatio;                // 容量擴充倍數
    vector<vector<Pair *>> buckets; // 桶陣列

  public:
    /* 建構方法 */
    HashMapChaining() : size(0), capacity(4), loadThres(2.0 / 3.0), extendRatio(2) {
        buckets.resize(capacity);
    }

    /* 解構方法 */
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
        // 走訪桶中的元素，若找到 key，就回傳對應的 val
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                return pair->val;
            }
        }
        // 若找不到 key，則回傳空字串
        return "";
    }

    /* 新增操作 */
    void put(int key, string val) {
        // 當負載因子超過門檻時，擴充容量
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        // 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                pair->val = val;
                return;
            }
        }
        // 若沒有這個 key，就將鍵值對加到尾端
        buckets[index].push_back(new Pair(key, val));
        size++;
    }

    /* 刪除操作 */
    void remove(int key) {
        int index = hashFunc(key);
        auto &bucket = buckets[index];
        // 走訪桶中的元素，從中刪除鍵值對
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

    /* 擴充雜湊表容量 */
    void extend() {
        // 暫存原本的雜湊表
        vector<vector<Pair *>> bucketsTmp = buckets;
        // 初始化擴充後的新雜湊表
        capacity *= extendRatio;
        buckets.clear();
        buckets.resize(capacity);
        size = 0;
        // 將鍵值對從原本的雜湊表移到新表
        for (auto &bucket : bucketsTmp) {
            for (Pair *pair : bucket) {
                put(pair->key, pair->val);
                // 釋放記憶體
                delete pair;
            }
        }
    }

    /* 印出雜湊表 */
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

/* 主程式 */
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
    cout << "\n新增後的雜湊表\nKey -> Value" << endl;
    map.print();

    /* 查詢操作 */
    // 輸入鍵 key，從雜湊表取得對應的值 value
    string name = map.get(13276);
    cout << "\n輸入學號 13276，查得姓名 " << name << endl;

    /* 刪除操作 */
    // 從雜湊表刪除鍵值對 (key, value)
    map.remove(12836);
    cout << "\n刪除 12836 後的雜湊表\nKey -> Value" << endl;
    map.print();

    return 0;
}
