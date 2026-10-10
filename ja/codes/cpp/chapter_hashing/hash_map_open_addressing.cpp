/**
 * File: hash_map_open_addressing.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* オープンアドレス法ハッシュテーブル */
class HashMapOpenAddressing {
  private:
    int size;                             // キーと値のペア数
    int capacity = 4;                     // ハッシュテーブル容量
    const double loadThres = 2.0 / 3.0;     // リサイズを発動する負荷率のしきい値
    const int extendRatio = 2;            // 拡張倍率
    vector<Pair *> buckets;               // バケット配列
    Pair *TOMBSTONE = new Pair(-1, "-1"); // 削除済みマーク

  public:
    /* コンストラクタ */
    HashMapOpenAddressing() : size(0), buckets(capacity, nullptr) {
    }

    /* デストラクタメソッド */
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

    /* key に対応するバケットインデックスを探す */
    int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // 線形プロービングを行い、空バケットに達したら終了
        while (buckets[index] != nullptr) {
            // key が見つかったら、対応するバケットのインデックスを返す
            if (buckets[index]->key == key) {
                // 以前に削除マークが見つかっていれば、そのインデックスへキーと値のペアを移動
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // 移動後のバケットインデックスを返す
                }
                return index; // バケットのインデックスを返す
            }
            // 最初に見つかった削除マークを記録
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // バケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % capacity;
        }
        // key が存在しない場合は追加位置のインデックスを返す
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* 検索操作 */
    string get(int key) {
        // key に対応するバケットインデックスを探す
        int index = findBucket(key);
        // キーと値の組が見つかったら、対応する val を返す
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            return buckets[index]->val;
        }
        // キーと値の組が存在しない場合は空文字列を返す
        return "";
    }

    /* 追加操作 */
    void put(int key, string val) {
        // 負荷率がしきい値を超えたら、リサイズを実行
        if (loadFactor() > loadThres) {
            extend();
        }
        // key に対応するバケットインデックスを探す
        int index = findBucket(key);
        // キーと値の組が見つかったら、val を上書きして返す
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            buckets[index]->val = val;
            return;
        }
        // キーと値の組が存在しない場合は、その組を追加する
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* 削除操作 */
    void remove(int key) {
        // key に対応するバケットインデックスを探す
        int index = findBucket(key);
        // キーと値の組が見つかったら、削除マーカーで上書きする
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
        // リサイズ後の新しいハッシュテーブルを初期化
        capacity *= extendRatio;
        buckets = vector<Pair *>(capacity, nullptr);
        size = 0;
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
        for (Pair *pair : bucketsTmp) {
            if (pair != nullptr && pair != TOMBSTONE) {
                put(pair->key, pair->val);
                delete pair;
            }
        }
    }

    /* ハッシュテーブルを出力 */
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

/* Driver Code */
int main() {
    // ハッシュテーブルを初期化
    HashMapOpenAddressing hashmap;

    // 追加操作
    // ハッシュテーブルにキーと値の組 (key, val) を追加する
    hashmap.put(12836, "シャオハー");
    hashmap.put(15937, "シャオルオ");
    hashmap.put(16750, "シャオスワン");
    hashmap.put(13276, "シャオファー");
    hashmap.put(10583, "シャオヤー");
    cout << "\n追加完了後、ハッシュテーブルは\nKey -> Value" << endl;
    hashmap.print();

    // 検索操作
    // ハッシュテーブルにキー key を入力し、値 val を得る
    string name = hashmap.get(13276);
    cout << "\n学籍番号 13276 を入力すると、氏名 " << name << endl;

    // 削除操作
    // ハッシュテーブルからキーと値の組 (key, val) を削除する
    hashmap.remove(16750);
    cout << "\n16750 を削除した後、ハッシュテーブルは\nKey -> Value" << endl;
    hashmap.print();

    return 0;
}
