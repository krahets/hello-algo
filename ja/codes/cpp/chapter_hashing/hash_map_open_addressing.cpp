/**
 * File: hash_map_open_addressing.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* オープンアドレス法のハッシュテーブル */
class HashMapOpenAddressing {
  private:
    int size;                             // キーと値のペアの数
    int capacity = 4;                     // ハッシュテーブルの容量
    const double loadThres = 2.0 / 3.0;     // 容量の拡張を開始する負荷率のしきい値
    const int extendRatio = 2;            // 容量の拡張倍率
    vector<Pair *> buckets;               // バケット配列
    Pair *TOMBSTONE = new Pair(-1, "-1"); // 削除マーカー

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

    /* key に対応するバケットのインデックスを探索する */
    int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // 線形探索法で探索し、空のバケットに到達したら終了する
        while (buckets[index] != nullptr) {
            // key が見つかった場合、対応するバケットのインデックスを返す
            if (buckets[index]->key == key) {
                // それ以前に削除マーカーが見つかっていれば、そのインデックスにキーと値のペアを移す
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // 移動後のバケットのインデックスを返す
                }
                return index; // バケットのインデックスを返す
            }
            // 最初に見つかった削除マーカーを記録する
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // バケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % capacity;
        }
        // key が存在しない場合、追加位置のインデックスを返す
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* 取得操作 */
    string get(int key) {
        // key に対応するバケットのインデックスを探索する
        int index = findBucket(key);
        // キーと値のペアが見つかった場合、対応する val を返す
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            return buckets[index]->val;
        }
        // キーと値のペアが存在しない場合、空文字列を返す
        return "";
    }

    /* 追加操作 */
    void put(int key, string val) {
        // 負荷率がしきい値を超えた場合、容量を拡張する
        if (loadFactor() > loadThres) {
            extend();
        }
        // key に対応するバケットのインデックスを探索する
        int index = findBucket(key);
        // キーと値のペアが見つかった場合、val を上書きして戻る
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            buckets[index]->val = val;
            return;
        }
        // キーと値のペアが存在しない場合、そのペアを追加する
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* 削除操作 */
    void remove(int key) {
        // key に対応するバケットのインデックスを探索する
        int index = findBucket(key);
        // キーと値のペアが見つかった場合、削除マーカーで上書きする
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            delete buckets[index];
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* ハッシュテーブルの容量を拡張する */
    void extend() {
        // 元のハッシュテーブルを一時保存する
        vector<Pair *> bucketsTmp = buckets;
        // 拡張後の新しいハッシュテーブルを初期化する
        capacity *= extendRatio;
        buckets = vector<Pair *>(capacity, nullptr);
        size = 0;
        // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
        for (Pair *pair : bucketsTmp) {
            if (pair != nullptr && pair != TOMBSTONE) {
                put(pair->key, pair->val);
                delete pair;
            }
        }
    }

    /* ハッシュテーブルを表示する */
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

/* 実行用コード */
int main() {
    // ハッシュテーブルを初期化する
    HashMapOpenAddressing hashmap;

    // 追加操作
    // ハッシュテーブルにキーと値のペア (key, val) を追加する
    hashmap.put(12836, "小哈");
    hashmap.put(15937, "小啰");
    hashmap.put(16750, "小算");
    hashmap.put(13276, "小法");
    hashmap.put(10583, "小鸭");
    cout << "\n追加後のハッシュテーブル\nKey -> Value" << endl;
    hashmap.print();

    // 取得操作
    // ハッシュテーブルにキー key を渡し、値 val を取得する
    string name = hashmap.get(13276);
    cout << "\n学生番号 13276 に対応する氏名は " << name << endl;

    // 削除操作
    // ハッシュテーブルからキーと値のペア (key, val) を削除する
    hashmap.remove(16750);
    cout << "\n16750 を削除した後のハッシュテーブル\nKey -> Value" << endl;
    hashmap.print();

    return 0;
}
