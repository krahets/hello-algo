/**
 * File: hash_map_open_addressing.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* オープンアドレス法ハッシュテーブル */
class HashMapOpenAddressing {
  private:
    int size;                             // キー値ペアの数
    int capacity = 4;                     // ハッシュテーブルの容量
    const double loadThres = 2.0 / 3.0;     // 拡張をトリガーする負荷率の閾値
    const int extendRatio = 2;            // 拡張倍率
    vector<Pair *> buckets;               // バケット配列
    Pair *TOMBSTONE = new Pair(-1, "-1"); // 削除マーク

  public:
    /* コンストラクタ */
    HashMapOpenAddressing() : size(0), buckets(capacity, nullptr) {
    }

    /* デストラクタ */
    ~HashMapOpenAddressing() {
        for (Pair *pair : buckets) {
            if (pair != nullptr && pair != TOMBSTONE) {
                delete pair;
            }
        }
        delete TOMBSTONE;
    }

    /* ハッシュ関数 */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* 負荷率 */
    double loadFactor() {
        return (double)size / capacity;
    }

    /* keyに対応するバケットインデックスを検索 */
    int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // 線形探査、空のバケットに遭遇したら中断
        while (buckets[index] != nullptr) {
            // keyに遭遇した場合、対応するバケットインデックスを返却
            if (buckets[index]->key == key) {
                // 以前に削除マークに遭遇していた場合、キー値ペアをそのインデックスに移動
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // 移動されたバケットインデックスを返却
                }
                return index; // バケットインデックスを返却
            }
            // 最初に遭遇した削除マークを記録
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // バケットインデックスを計算、末尾を超えた場合は先頭に戻る
            index = (index + 1) % capacity;
        }
        // keyが存在しない場合、挿入ポイントのインデックスを返却
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* クエリ操作 */
    string get(int key) {
        // keyに対応するバケットインデックスを検索
        int index = findBucket(key);
        // キー値ペアが見つかった場合、対応するvalを返却
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            return buckets[index]->val;
        }
        // キー値ペアが存在しない場合、空文字列を返却
        return "";
    }

    /* 追加操作 */
    void put(int key, string val) {
        // 負荷率が閾値を超えた場合、拡張を実行
        if (loadFactor() > loadThres) {
            extend();
        }
        // keyに対応するバケットインデックスを検索
        int index = findBucket(key);
        // キー値ペアが見つかった場合、valを上書きして返却
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            buckets[index]->val = val;
            return;
        }
        // キー値ペアが存在しない場合、キー値ペアを追加
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* 削除操作 */
    void remove(int key) {
        // keyに対応するバケットインデックスを検索
        int index = findBucket(key);
        // キー値ペアが見つかった場合、削除マークで覆う
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            delete buckets[index];
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* ハッシュテーブルを拡張 */
    void extend() {
        // 元のハッシュテーブルを一時保存
        vector<Pair *> bucketsTmp = buckets;
        // 拡張された新しいハッシュテーブルを初期化
        capacity *= extendRatio;
        buckets = vector<Pair *>(capacity, nullptr);
        size = 0;
        // 元のハッシュテーブルから新しいハッシュテーブルにキー値ペアを移動
        for (Pair *pair : bucketsTmp) {
            if (pair != nullptr && pair != TOMBSTONE) {
                put(pair->key, pair->val);
                delete pair;
            }
        }
    }

    /* ハッシュテーブルを印刷 */
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

/* ドライバーコード */
int main() {
    // ハッシュテーブルを初期化
    HashMapOpenAddressing hashmap;

    // 追加操作
    // キー値ペア(key, val)をハッシュテーブルに追加
    hashmap.put(12836, "Ha");
    hashmap.put(15937, "Luo");
    hashmap.put(16750, "Suan");
    hashmap.put(13276, "Fa");
    hashmap.put(10583, "Ya");
    cout << "\nAfter adding, the hash table is\nKey -> Value" << endl;
    hashmap.print();

    // クエリ操作
    // ハッシュテーブルにキーを入力、値valを取得
    string name = hashmap.get(13276);
    cout << "\nEnter student ID 13276, found name " << name << endl;

    // 削除操作
    // ハッシュテーブルからキー値ペア(key, val)を削除
    hashmap.remove(16750);
    cout << "\nAfter removing 16750, the hash table is\nKey -> Value" << endl;
    hashmap.print();

    return 0;
}