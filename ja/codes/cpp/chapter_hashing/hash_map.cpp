/**
 * File: hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* 実行例 */
int main() {
    /* ハッシュ表を初期化する */
    unordered_map<int, string> map;

    /* 追加 */
    // ハッシュ表にペア (key, value) を追加する
    map[12836] = "小哈";
    map[15937] = "小啰";
    map[16750] = "小算";
    map[13276] = "小法";
    map[10583] = "小鸭";
    cout << "\n追加後のハッシュ表\nKey -> Value" << endl;
    printHashMap(map);

    /* 検索 */
    // ハッシュ表でキー key に対応する値 value を取得する
    string name = map[15937];
    cout << "\n学籍番号 15937 に対応する名前は " << name << endl;

    /* 削除 */
    // ハッシュ表からペア (key, value) を削除する
    map.erase(10583);
    cout << "\n10583 を削除した後のハッシュ表\nKey -> Value" << endl;
    printHashMap(map);

    /* ハッシュ表を走査する */
    cout << "\nキーと値のペアを順に表示 Key->Value" << endl;
    for (auto kv : map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    cout << "\nイテレータでペアを順に表示 Key->Value" << endl;
    for (auto iter = map.begin(); iter != map.end(); iter++) {
        cout << iter->first << "->" << iter->second << endl;
    }

    return 0;
}
