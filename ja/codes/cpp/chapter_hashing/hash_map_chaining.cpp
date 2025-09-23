/**
 * File: hash_map_chaining.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* チェイン法ハッシュテーブル */
class HashMapChaining {
  private:
    int size;                       // キー値ペアの数
    int capacity;                   // ハッシュテーブルの容量
    double loadThres;               // 拡張をトリガーする負荷率の閾値
    int extendRatio;                // 拡張倍率
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
                // メモリを解放
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

    /* クエリ操作 */
    string get(int key) {
        int index = hashFunc(key);
        // バケットを走査、キーが見つかった場合、対応するvalを返却
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                return pair->val;
            }
        }
        // キーが見つからない場合、空文字列を返却
        return "";
    }

    /* 追加操作 */
    void put(int key, string val) {
        // 負荷率が閾値を超えた場合、拡張を実行
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        // バケットを走査、指定キーに遭遇した場合、対応するvalを更新して返却
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                pair->val = val;
                return;
            }
        }
        // キーが見つからない場合、キー値ペアを末尾に追加
        buckets[index].push_back(new Pair(key, val));
        size++;
    }

    /* 削除操作 */
    void remove(int key) {
        int index = hashFunc(key);
        auto &bucket = buckets[index];
        // バケットを走査、キー値ペアを削除
        for (int i = 0; i < bucket.size(); i++) {
            if (bucket[i]->key == key) {
                Pair *tmp = bucket[i];
                bucket.erase(bucket.begin() + i); // キー値ペアを削除
                delete tmp;                       // メモリを解放
                size--;
                return;
            }
        }
    }

    /* ハッシュテーブルを拡張 */
    void extend() {
        // 元のハッシュテーブルを一時保存
        vector<vector<Pair *>> bucketsTmp = buckets;
        // 拡張された新しいハッシュテーブルを初期化
        capacity *= extendRatio;
        buckets.clear();
        buckets.resize(capacity);
        size = 0;
        // 元のハッシュテーブルから新しいハッシュテーブルにキー値ペアを移動
        for (auto &bucket : bucketsTmp) {
            for (Pair *pair : bucket) {
                put(pair->key, pair->val);
                // メモリを解放
                delete pair;
            }
        }
    }

    /* ハッシュテーブルを印刷 */
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

/* ドライバーコード */
int main() {
    /* ハッシュテーブルを初期化 */
    HashMapChaining map = HashMapChaining();

    /* 追加操作 */
    // キー値ペア(key, value)をハッシュテーブルに追加
    map.put(12836, "Ha");
    map.put(15937, "Luo");
    map.put(16750, "Suan");
    map.put(13276, "Fa");
    map.put(10583, "Ya");
    cout << "\nAfter adding, the hash table is\nKey -> Value" << endl;
    map.print();

    /* クエリ操作 */
    // ハッシュテーブルにキーを入力、値を取得
    string name = map.get(13276);
    cout << "\nEnter student ID 13276, found name " << name << endl;

    /* 削除操作 */
    // ハッシュテーブルからキー値ペア(key, value)を削除
    map.remove(12836);
    cout << "\nAfter removing 12836, the hash table is\nKey -> Value" << endl;
    map.print();

    return 0;
}