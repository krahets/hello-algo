/**
 * File: hash_map_chaining.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* チェイン法によるハッシュ表 */
class HashMapChaining {
  private:
    int size;                       // キーと値のペアの数
    int capacity;                   // ハッシュ表の容量
    double loadThres;               // 表を拡張する負荷率のしきい値
    int extendRatio;                // 容量の拡張倍率
    vector<vector<Pair *>> buckets; // バケットの配列

  public:
    /* コンストラクタ */
    HashMapChaining() : size(0), capacity(4), loadThres(2.0 / 3.0), extendRatio(2) {
        buckets.resize(capacity);
    }

    /* デストラクタ */
    ~HashMapChaining() {
        for (auto &bucket : buckets) {
            for (Pair *pair : bucket) {
                // メモリを解放する
                delete pair;
            }
        }
    }

    /* ハッシュ関数 */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* 負荷率 */
    double loadFactor() {
        return (double)size / (double)capacity;
    }

    /* 検索 */
    string get(int key) {
        int index = hashFunc(key);
        // バケットを走査し、key が見つかったら対応する val を返す
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                return pair->val;
            }
        }
        // key が見つからなければ空文字列を返す
        return "";
    }

    /* 追加 */
    void put(int key, string val) {
        // 負荷率がしきい値を超えたら表を拡張する
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        // バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                pair->val = val;
                return;
            }
        }
        // key がなければ末尾にペアを追加する
        buckets[index].push_back(new Pair(key, val));
        size++;
    }

    /* 削除 */
    void remove(int key) {
        int index = hashFunc(key);
        auto &bucket = buckets[index];
        // バケットを走査し、該当するペアを削除する
        for (int i = 0; i < bucket.size(); i++) {
            if (bucket[i]->key == key) {
                Pair *tmp = bucket[i];
                bucket.erase(bucket.begin() + i); // 該当するペアを削除する
                delete tmp;                       // メモリを解放する
                size--;
                return;
            }
        }
    }

    /* ハッシュ表を拡張する */
    void extend() {
        // 元のハッシュ表を一時保存する
        vector<vector<Pair *>> bucketsTmp = buckets;
        // 拡張後の新しいハッシュ表を初期化する
        capacity *= extendRatio;
        buckets.clear();
        buckets.resize(capacity);
        size = 0;
        // 元のハッシュ表から新しい表にペアを移す
        for (auto &bucket : bucketsTmp) {
            for (Pair *pair : bucket) {
                put(pair->key, pair->val);
                // メモリを解放する
                delete pair;
            }
        }
    }

    /* ハッシュ表を表示する */
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

/* 実行例 */
int main() {
    /* ハッシュ表を初期化する */
    HashMapChaining map = HashMapChaining();

    /* 追加 */
    // ハッシュ表にペア (key, value) を追加する
    map.put(12836, "小哈");
    map.put(15937, "小啰");
    map.put(16750, "小算");
    map.put(13276, "小法");
    map.put(10583, "小鸭");
    cout << "\n追加後のハッシュ表\nKey -> Value" << endl;
    map.print();

    /* 検索 */
    // ハッシュ表でキー key に対応する値 value を取得する
    string name = map.get(13276);
    cout << "\n学籍番号 13276 に対応する名前は " << name << endl;

    /* 削除 */
    // ハッシュ表からペア (key, value) を削除する
    map.remove(12836);
    cout << "\n12836 を削除した後のハッシュ表\nKey -> Value" << endl;
    map.print();

    return 0;
}
