/**
 * File: array_hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* キー値ペア */
struct Pair {
  public:
    int key;
    string val;
    Pair(int key, string val) {
        this->key = key;
        this->val = val;
    }
};

/* 配列実装に基づくハッシュテーブル */
class ArrayHashMap {
  private:
    vector<Pair *> buckets;

  public:
    ArrayHashMap() {
        // 配列を初期化、100個のバケットを含む
        buckets = vector<Pair *>(100);
    }

    ~ArrayHashMap() {
        // メモリを解放
        for (const auto &bucket : buckets) {
            delete bucket;
        }
        buckets.clear();
    }

    /* ハッシュ関数 */
    int hashFunc(int key) {
        int index = key % 100;
        return index;
    }

    /* クエリ操作 */
    string get(int key) {
        int index = hashFunc(key);
        Pair *pair = buckets[index];
        if (pair == nullptr)
            return "";
        return pair->val;
    }

    /* 追加操作 */
    void put(int key, string val) {
        Pair *pair = new Pair(key, val);
        int index = hashFunc(key);
        buckets[index] = pair;
    }

    /* 削除操作 */
    void remove(int key) {
        int index = hashFunc(key);
        // メモリを解放してnullptrに設定
        delete buckets[index];
        buckets[index] = nullptr;
    }

    /* すべてのキー値ペアを取得 */
    vector<Pair *> pairSet() {
        vector<Pair *> pairSet;
        for (Pair *pair : buckets) {
            if (pair != nullptr) {
                pairSet.push_back(pair);
            }
        }
        return pairSet;
    }

    /* すべてのキーを取得 */
    vector<int> keySet() {
        vector<int> keySet;
        for (Pair *pair : buckets) {
            if (pair != nullptr) {
                keySet.push_back(pair->key);
            }
        }
        return keySet;
    }

    /* すべての値を取得 */
    vector<string> valueSet() {
        vector<string> valueSet;
        for (Pair *pair : buckets) {
            if (pair != nullptr) {
                valueSet.push_back(pair->val);
            }
        }
        return valueSet;
    }

    /* ハッシュテーブルを印刷 */
    void print() {
        for (Pair *kv : pairSet()) {
            cout << kv->key << " -> " << kv->val << endl;
        }
    }
};

// テストケースはarray_hash_map_test.cppを参照