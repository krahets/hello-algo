/**
 * File: array_hash_map_test.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "./array_hash_map.cpp"

/* ドライバーコード */
int main() {
    /* ハッシュテーブルを初期化 */
    ArrayHashMap map = ArrayHashMap();

    /* 追加操作 */
    // キー値ペア(key, value)をハッシュテーブルに追加
    map.put(12836, "Ha");
    map.put(15937, "Luo");
    map.put(16750, "Suan");
    map.put(13276, "Fa");
    map.put(10583, "Ya");
    cout << "\nAfter adding, the hash table is\nKey -> Value" << endl;
    map.print();

    /* クエリ操作 */
    // ハッシュテーブルにキーを入力、値を取得
    string name = map.get(15937);
    cout << "\nEnter student ID 15937, found name " << name << endl;

    /* 削除操作 */
    // ハッシュテーブルからキー値ペア(key, value)を削除
    map.remove(10583);
    cout << "\nAfter removing 10583, the hash table is\nKey -> Value" << endl;
    map.print();

    /* ハッシュテーブルを走査 */
    cout << "\nTraverse key-value pairs Key->Value" << endl;
    for (auto kv : map.pairSet()) {
        cout << kv->key << " -> " << kv->val << endl;
    }

    cout << "\nIndividually traverse keys Key" << endl;
    for (auto key : map.keySet()) {
        cout << key << endl;
    }

    cout << "\nIndividually traverse values Value" << endl;
    for (auto val : map.valueSet()) {
        cout << val << endl;
    }

    return 0;
}