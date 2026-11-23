/**
 * File: hash_map_chaining.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* チェイン法のハッシュテーブル */
class HashMapChaining {
  private:
    int size;                       // キーと値のペアの数
    int capacity;                   // ハッシュテーブルの容量
    double loadThres;               // 容量の拡張を開始する負荷率のしきい値
    int extendRatio;                // 容量の拡張倍率
    vector<vector<Pair *>> buckets; // バケット配列

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

    /* 取得操作 */
    string get(int key) {
        int index = hashFunc(key);
        // バケットを走査し、key が見つかったら対応する val を返す
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                return pair->val;
            }
        }
        // key が見つからなかった場合、空文字列を返す
        return "";
    }

    /* 追加操作 */
    void put(int key, string val) {
        // 負荷率がしきい値を超えた場合、容量を拡張する
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        // バケットを走査し、指定された key が見つかったら、対応する val を更新して戻る
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                pair->val = val;
                return;
            }
        }
        // key が存在しない場合、キーと値のペアを末尾に追加する
        buckets[index].push_back(new Pair(key, val));
        size++;
    }

    /* 削除操作 */
    void remove(int key) {
        int index = hashFunc(key);
        auto &bucket = buckets[index];
        // バケットを走査し、キーと値のペアを削除する
        for (int i = 0; i < bucket.size(); i++) {
            if (bucket[i]->key == key) {
                Pair *tmp = bucket[i];
                bucket.erase(bucket.begin() + i); // キーと値のペアを削除する
                delete tmp;                       // メモリを解放する
                size--;
                return;
            }
        }
    }

    /* ハッシュテーブルの容量を拡張する */
    void extend() {
        // 元のハッシュテーブルを一時保存する
        vector<vector<Pair *>> bucketsTmp = buckets;
        // 拡張後の新しいハッシュテーブルを初期化する
        capacity *= extendRatio;
        buckets.clear();
        buckets.resize(capacity);
        size = 0;
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
        for (auto &bucket : bucketsTmp) {
            for (Pair *pair : bucket) {
                put(pair->key, pair->val);
                // メモリを解放する
                delete pair;
            }
        }
    }

    /* ハッシュテーブルを表示する */
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

/* 実行用コード */
int main() {
    /* ハッシュテーブルを初期化する */
    HashMapChaining map = HashMapChaining();

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加する
    map.put(12836, "小哈");
    map.put(15937, "小啰");
    map.put(16750, "小算");
    map.put(13276, "小法");
    map.put(10583, "小鸭");
    cout << "\n追加後のハッシュテーブル\nKey -> Value" << endl;
    map.print();

    /* 取得操作 */
    // ハッシュテーブルにキー key を渡し、値 value を取得する
    string name = map.get(13276);
    cout << "\n学生番号 13276 に対応する氏名は " << name << endl;

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除する
    map.remove(12836);
    cout << "\n12836 を削除した後のハッシュテーブル\nKey -> Value" << endl;
    map.print();

    return 0;
}
