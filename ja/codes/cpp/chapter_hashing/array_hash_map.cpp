/**
 * File: array_hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* キーと値のペア */
struct Pair {
  public:
    int key;
    string val;
    Pair(int key, string val) {
        this->key = key;
        this->val = val;
    }
};

/* 配列で実装したハッシュテーブル */
class ArrayHashMap {
  private:
    vector<Pair *> buckets;

  public:
    ArrayHashMap() {
        // 100 個のバケットを含む配列を初期化する
        buckets = vector<Pair *>(100);
    }

    ~ArrayHashMap() {
        // メモリを解放する
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

    /* 取得操作 */
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
        // メモリを解放し、nullptr に設定する
        delete buckets[index];
        buckets[index] = nullptr;
    }

    /* キーと値のペアをすべて取得する */
    vector<Pair *> pairSet() {
        vector<Pair *> pairSet;
        for (Pair *pair : buckets) {
            if (pair != nullptr) {
                pairSet.push_back(pair);
            }
        }
        return pairSet;
    }

    /* すべてのキーを取得する */
    vector<int> keySet() {
        vector<int> keySet;
        for (Pair *pair : buckets) {
            if (pair != nullptr) {
                keySet.push_back(pair->key);
            }
        }
        return keySet;
    }

    /* すべての値を取得する */
    vector<string> valueSet() {
        vector<string> valueSet;
        for (Pair *pair : buckets) {
            if (pair != nullptr) {
                valueSet.push_back(pair->val);
            }
        }
        return valueSet;
    }

    /* ハッシュテーブルを表示する */
    void print() {
        for (Pair *kv : pairSet()) {
            cout << kv->key << " -> " << kv->val << endl;
        }
    }
};

// テストケースは array_hash_map_test.cpp を参照
