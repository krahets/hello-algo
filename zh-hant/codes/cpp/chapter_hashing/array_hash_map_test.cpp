/**
 * File: array_hash_map_test.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "./array_hash_map.cpp"

/* 主程式 */
int main() {
    /* 初始化雜湊表 */
    ArrayHashMap map = ArrayHashMap();

    /* 新增操作 */
    // 在雜湊表中新增鍵值對 (key, value)
    map.put(12836, "小哈");
    map.put(15937, "小囉");
    map.put(16750, "小算");
    map.put(13276, "小法");
    map.put(10583, "小鴨");
    cout << "\n新增後的雜湊表\nKey -> Value" << endl;
    map.print();

    /* 查詢操作 */
    // 輸入鍵 key，從雜湊表取得對應的值 value
    string name = map.get(15937);
    cout << "\n輸入學號 15937，查得姓名 " << name << endl;

    /* 刪除操作 */
    // 從雜湊表刪除鍵值對 (key, value)
    map.remove(10583);
    cout << "\n刪除 10583 後的雜湊表\nKey -> Value" << endl;
    map.print();

    /* 走訪雜湊表 */
    cout << "\n走訪鍵值對 Key->Value" << endl;
    for (auto kv : map.pairSet()) {
        cout << kv->key << " -> " << kv->val << endl;
    }

    cout << "\n只走訪鍵 Key" << endl;
    for (auto key : map.keySet()) {
        cout << key << endl;
    }

    cout << "\n只走訪值 Value" << endl;
    for (auto val : map.valueSet()) {
        cout << val << endl;
    }

    return 0;
}
