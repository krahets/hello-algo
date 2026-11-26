/**
 * File: hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* 主程式 */
int main() {
    /* 初始化雜湊表 */
    unordered_map<int, string> map;

    /* 新增操作 */
    // 在雜湊表中新增鍵值對 (key, value)
    map[12836] = "小哈";
    map[15937] = "小囉";
    map[16750] = "小算";
    map[13276] = "小法";
    map[10583] = "小鴨";
    cout << "\n新增後的雜湊表\nKey -> Value" << endl;
    printHashMap(map);

    /* 查詢操作 */
    // 輸入鍵 key，從雜湊表取得對應的值 value
    string name = map[15937];
    cout << "\n輸入學號 15937，查得姓名 " << name << endl;

    /* 刪除操作 */
    // 從雜湊表刪除鍵值對 (key, value)
    map.erase(10583);
    cout << "\n刪除 10583 後的雜湊表\nKey -> Value" << endl;
    printHashMap(map);

    /* 走訪雜湊表 */
    cout << "\n走訪鍵值對 Key->Value" << endl;
    for (auto kv : map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    cout << "\n使用迭代器走訪 Key->Value" << endl;
    for (auto iter = map.begin(); iter != map.end(); iter++) {
        cout << iter->first << "->" << iter->second << endl;
    }

    return 0;
}
