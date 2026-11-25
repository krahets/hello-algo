/**
 * File: array_hash_map_test.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "./array_hash_map.cpp"

/* 実行例 */
int main() {
    /* ハッシュ表を初期化する */
    ArrayHashMap map = ArrayHashMap();

    /* 追加 */
    // ハッシュ表にペア (key, value) を追加する
    map.put(12836, "小哈");
    map.put(15937, "小啰");
    map.put(16750, "小算");
    map.put(13276, "小法");
    map.put(10583, "小鸭");
    cout << "\n追加後のハッシュ表\nKey -> Value" << endl;
    map.print();

    /* 検索 */
    // ハッシュ表でキー key に対応する値 value を取得する
    string name = map.get(15937);
    cout << "\n学籍番号 15937 に対応する名前は " << name << endl;

    /* 削除 */
    // ハッシュ表からペア (key, value) を削除する
    map.remove(10583);
    cout << "\n10583 を削除した後のハッシュ表\nKey -> Value" << endl;
    map.print();

    /* ハッシュ表を走査する */
    cout << "\nキーと値のペアを順に表示 Key->Value" << endl;
    for (auto kv : map.pairSet()) {
        cout << kv->key << " -> " << kv->val << endl;
    }

    cout << "\nキーだけを順に表示 Key" << endl;
    for (auto key : map.keySet()) {
        cout << key << endl;
    }

    cout << "\n値だけを順に表示 Value" << endl;
    for (auto val : map.valueSet()) {
        cout << val << endl;
    }

    return 0;
}
