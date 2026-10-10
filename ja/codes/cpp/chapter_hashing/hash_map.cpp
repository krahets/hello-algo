/**
 * File: hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* ハッシュテーブルを初期化 */
    unordered_map<int, string> map;

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加
    map[12836] = "シャオハー";
    map[15937] = "シャオルオ";
    map[16750] = "シャオスワン";
    map[13276] = "シャオファー";
    map[10583] = "シャオヤー";
    cout << "\n追加完了後、ハッシュテーブルは\nKey -> Value" << endl;
    printHashMap(map);

    /* 検索操作 */
    // キー key をハッシュテーブルに渡し、値 value を取得
    string name = map[15937];
    cout << "\n学籍番号 15937 を入力すると、氏名 " << name << endl;

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    map.erase(10583);
    cout << "\n10583 を削除した後、ハッシュテーブルは\nKey -> Value" << endl;
    printHashMap(map);

    /* ハッシュテーブルを走査 */
    cout << "\nキーと値のペア Key->Value を走査" << endl;
    for (auto kv : map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    cout << "\nイテレータで Key->Value を走査" << endl;
    for (auto iter = map.begin(); iter != map.end(); iter++) {
        cout << iter->first << "->" << iter->second << endl;
    }

    return 0;
}
