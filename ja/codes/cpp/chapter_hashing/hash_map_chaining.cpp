/**
 * File: hash_map_chaining.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* チェイン法ハッシュテーブル */
class HashMapChaining {
  private:
    int size;                       // キーと値のペア数
    int capacity;                   // ハッシュテーブル容量
    double loadThres;               // リサイズを発動する負荷率のしきい値
    int extendRatio;                // 拡張倍率
    vector<vector<Pair *>> buckets; // バケット配列

  public:
    /* コンストラクタ */
    HashMapChaining() : size(0), capacity(4), loadThres(2.0 / 3.0), extendRatio(2) {
        buckets.resize(capacity);
    }

    /* デストラクタメソッド */
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

    /* 検索操作 */
    string get(int key) {
        int index = hashFunc(key);
        // バケットを走査し、key が見つかれば対応する val を返す
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                return pair->val;
            }
        }
        // key が見つからない場合は空文字列を返す
        return "";
    }

    /* 追加操作 */
    void put(int key, string val) {
        // 負荷率がしきい値を超えたら、リサイズを実行
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        // バケットを走査し、指定した key が見つかれば対応する val を更新して返す
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                pair->val = val;
                return;
            }
        }
        // その key が存在しなければ、キーと値のペアを末尾に追加
        buckets[index].push_back(new Pair(key, val));
        size++;
    }

    /* 削除操作 */
    void remove(int key) {
        int index = hashFunc(key);
        auto &bucket = buckets[index];
        // バケットを走査してキーと値のペアを削除
        for (int i = 0; i < bucket.size(); i++) {
            if (bucket[i]->key == key) {
                Pair *tmp = bucket[i];
                bucket.erase(bucket.begin() + i); // そこからキーと値の組を削除する
                delete tmp;                       // メモリを解放する
                size--;
                return;
            }
        }
    }

    /* ハッシュテーブルを拡張 */
    void extend() {
        // 元のハッシュテーブルを一時保存
        vector<vector<Pair *>> bucketsTmp = buckets;
        // リサイズ後の新しいハッシュテーブルを初期化
        capacity *= extendRatio;
        buckets.clear();
        buckets.resize(capacity);
        size = 0;
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
        for (auto &bucket : bucketsTmp) {
            for (Pair *pair : bucket) {
                put(pair->key, pair->val);
                // メモリを解放する
                delete pair;
            }
        }
    }

    /* ハッシュテーブルを出力 */
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
    /* ハッシュテーブルを初期化 */
    HashMapChaining map = HashMapChaining();

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加
    map.put(12836, "シャオハー");
    map.put(15937, "シャオルオ");
    map.put(16750, "シャオスワン");
    map.put(13276, "シャオファー");
    map.put(10583, "シャオヤー");
    cout << "\n追加完了後、ハッシュテーブルは\nKey -> Value" << endl;
    map.print();

    /* 検索操作 */
    // キー key をハッシュテーブルに渡し、値 value を取得
    string name = map.get(13276);
    cout << "\n学籍番号 13276 を入力すると、氏名 " << name << endl;

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    map.remove(12836);
    cout << "\n12836 を削除した後、ハッシュテーブルは\nKey -> Value" << endl;
    map.print();

    return 0;
}
