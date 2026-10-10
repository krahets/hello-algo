/**
 * File: array_hash_map_test.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "./array_hash_map.cpp"

/* Driver Code */
int main() {
    /* ハッシュテーブルを初期化 */
    ArrayHashMap map = ArrayHashMap();

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加
    map.put(12836, "シャオハー");
    map.put(15937, "シャオルオ");
    map.put(16750, "シャオスワン");
    map.put(13276, "シャオファー");
    map.put(10583, "シャオヤー");
    cout << "\n追加完了後、ハッシュテーブルは\nKey -> Value" << endl;
    map.print();

    /* 検索操作 */
    // キー key をハッシュテーブルに渡し、値 value を取得
    string name = map.get(15937);
    cout << "\n学籍番号 15937 を入力すると、氏名 " << name << endl;

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    map.remove(10583);
    cout << "\n10583 を削除した後、ハッシュテーブルは\nKey -> Value" << endl;
    map.print();

    /* ハッシュテーブルを走査 */
    cout << "\nキーと値のペア Key->Value を走査" << endl;
    for (auto kv : map.pairSet()) {
        cout << kv->key << " -> " << kv->val << endl;
    }

    cout << "\nキー Key のみを走査" << endl;
    for (auto key : map.keySet()) {
        cout << key << endl;
    }

    cout << "\n値 Value のみを走査" << endl;
    for (auto val : map.valueSet()) {
        cout << val << endl;
    }

    return 0;
}
