/**
 * File: hash_map_open_addressing.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* オープンアドレス法によるハッシュ表 */
class HashMapOpenAddressing {
  private:
    int size;                             // キーと値のペアの数
    int capacity = 4;                     // ハッシュ表の容量
    const double loadThres = 2.0 / 3.0;     // 表を拡張する負荷率のしきい値
    const int extendRatio = 2;            // 容量の拡張倍率
    vector<Pair *> buckets;               // バケットの配列
    Pair *TOMBSTONE = new Pair(-1, "-1"); // 削除済みマーカー

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

    /* key に対応するバケットのインデックスを探す */
    int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // 線形探索を行い、空のバケットに出会ったらループを抜ける
        while (buckets[index] != nullptr) {
            // key が見つかったら、そのバケットのインデックスを返す
            if (buckets[index]->key == key) {
                // それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // 移動先のバケットのインデックスを返す
                }
                return index; // バケットのインデックスを返す
            }
            // 最初に見つかった削除済みマーカーの位置を記録する
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % capacity;
        }
        // key がなければ挿入位置のインデックスを返す
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* 検索 */
    string get(int key) {
        // key に対応するバケットのインデックスを探す
        int index = findBucket(key);
        // ペアが見つかったら対応する val を返す
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            return buckets[index]->val;
        }
        // ペアがなければ空文字列を返す
        return "";
    }

    /* 追加 */
    void put(int key, string val) {
        // 負荷率がしきい値を超えたら表を拡張する
        if (loadFactor() > loadThres) {
            extend();
        }
        // key に対応するバケットのインデックスを探す
        int index = findBucket(key);
        // ペアが見つかったら val を上書きして処理を終える
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            buckets[index]->val = val;
            return;
        }
        // ペアがなければ新しく追加する
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* 削除 */
    void remove(int key) {
        // key に対応するバケットのインデックスを探す
        int index = findBucket(key);
        // ペアが見つかったら削除済みマーカーで置き換える
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            delete buckets[index];
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* ハッシュ表を拡張する */
    void extend() {
        // 元のハッシュ表を一時保存する
        vector<Pair *> bucketsTmp = buckets;
        // 拡張後の新しいハッシュ表を初期化する
        capacity *= extendRatio;
        buckets = vector<Pair *>(capacity, nullptr);
        size = 0;
        // 元のハッシュ表から新しい表にペアを移す
        for (Pair *pair : bucketsTmp) {
            if (pair != nullptr && pair != TOMBSTONE) {
                put(pair->key, pair->val);
                delete pair;
            }
        }
    }

    /* ハッシュ表を表示する */
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

/* 実行例 */
int main() {
    // ハッシュ表を初期化する
    HashMapOpenAddressing hashmap;

    // 追加
    // ハッシュ表にペア (key, val) を追加する
    hashmap.put(12836, "小哈");
    hashmap.put(15937, "小啰");
    hashmap.put(16750, "小算");
    hashmap.put(13276, "小法");
    hashmap.put(10583, "小鸭");
    cout << "\n追加後のハッシュ表\nKey -> Value" << endl;
    hashmap.print();

    // 検索
    // ハッシュ表でキー key に対応する値 val を取得する
    string name = hashmap.get(13276);
    cout << "\n学籍番号 13276 に対応する名前は " << name << endl;

    // 削除
    // ハッシュ表からペア (key, val) を削除する
    hashmap.remove(16750);
    cout << "\n16750 を削除した後のハッシュ表\nKey -> Value" << endl;
    hashmap.print();

    return 0;
}
