/**
 * File: array_hash_map_test.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "./array_hash_map.cpp"

/* 実行用コード */
int main() {
    /* ハッシュテーブルを初期化する */
    ArrayHashMap map = ArrayHashMap();

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加する
    map.put(12836, "小哈");
    map.put(15937, "小啰");
    map.put(16750, "小算");
    map.put(13276, "小法");
    map.put(10583, "小鸭");
    cout << "\n追加後のハッシュテーブル\nKey -> Value" << endl;
    map.print();

    /* 取得操作 */
    // ハッシュテーブルにキー key を渡し、値 value を取得する
    string name = map.get(15937);
    cout << "\n学生番号 15937 に対応する氏名は " << name << endl;

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除する
    map.remove(10583);
    cout << "\n10583 を削除した後のハッシュテーブル\nKey -> Value" << endl;
    map.print();

    /* ハッシュテーブルを走査する */
    cout << "\nキーと値のペア Key->Value を走査する" << endl;
    for (auto kv : map.pairSet()) {
        cout << kv->key << " -> " << kv->val << endl;
    }

    cout << "\nキー Key だけを走査する" << endl;
    for (auto key : map.keySet()) {
        cout << key << endl;
    }

    cout << "\n値 Value だけを走査する" << endl;
    for (auto val : map.valueSet()) {
        cout << val << endl;
    }

    return 0;
}
