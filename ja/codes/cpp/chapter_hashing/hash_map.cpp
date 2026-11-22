/**
 * File: hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* 実行用コード */
int main() {
    /* ハッシュテーブルを初期化する */
    unordered_map<int, string> map;

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加する
    map[12836] = "小哈";
    map[15937] = "小啰";
    map[16750] = "小算";
    map[13276] = "小法";
    map[10583] = "小鸭";
    cout << "\n追加後のハッシュテーブル\nKey -> Value" << endl;
    printHashMap(map);

    /* 取得操作 */
    // ハッシュテーブルにキー key を渡し、値 value を取得する
    string name = map[15937];
    cout << "\n学生番号 15937 に対応する氏名は " << name << endl;

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除する
    map.erase(10583);
    cout << "\n10583 を削除した後のハッシュテーブル\nKey -> Value" << endl;
    printHashMap(map);

    /* ハッシュテーブルを走査する */
    cout << "\nキーと値のペア Key->Value を走査する" << endl;
    for (auto kv : map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    cout << "\nイテレータで Key->Value を走査する" << endl;
    for (auto iter = map.begin(); iter != map.end(); iter++) {
        cout << iter->first << "->" << iter->second << endl;
    }

    return 0;
}
