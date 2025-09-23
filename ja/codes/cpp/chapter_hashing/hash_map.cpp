/**
 * File: hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* ドライバーコード */
int main() {
    /* ハッシュテーブルを初期化 */
    unordered_map<int, string> map;

    /* 追加操作 */
    // キー値ペア(key, value)をハッシュテーブルに追加
    map[12836] = "Ha";
    map[15937] = "Luo";
    map[16750] = "Suan";
    map[13276] = "Fa";
    map[10583] = "Ya";
    cout << "\nAfter adding, the hash table is\nKey -> Value" << endl;
    printHashMap(map);

    /* クエリ操作 */
    // ハッシュテーブルにキーを入力、値を取得
    string name = map[15937];
    cout << "\nEnter student ID 15937, found name " << name << endl;

    /* 削除操作 */
    // ハッシュテーブルからキー値ペア(key, value)を削除
    map.erase(10583);
    cout << "\nAfter removing 10583, the hash table is\nKey -> Value" << endl;
    printHashMap(map);

    /* ハッシュテーブルを走査 */
    cout << "\nTraverse key-value pairs Key->Value" << endl;
    for (auto kv : map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    cout << "\nIterate through Key->Value using an iterator" << endl;
    for (auto iter = map.begin(); iter != map.end(); iter++) {
        cout << iter->first << "->" << iter->second << endl;
    }

    return 0;
}