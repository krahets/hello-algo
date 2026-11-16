/**
 * File: hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    // [region]{init_hash_map}
    /* 初始化哈希表 */
    unordered_map<int, string> map;
    // [endregion]{init_hash_map}

    // [region]{add_pairs}
    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map[12836] = "小哈";
    map[15937] = "小啰";
    map[16750] = "小算";
    map[13276] = "小法";
    map[10583] = "小鸭";
    // [endregion]{add_pairs}
    cout << "\n添加完成后，哈希表为\nKey -> Value" << endl;
    printHashMap(map);

    // [region]{get_value}
    /* 查询操作 */
    // 向哈希表中输入键 key ，得到值 value
    string name = map[15937];
    // [endregion]{get_value}
    cout << "\n输入学号 15937 ，查询到姓名 " << name << endl;

    // [region]{remove_pair}
    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.erase(10583);
    // [endregion]{remove_pair}
    cout << "\n删除 10583 后，哈希表为\nKey -> Value" << endl;
    printHashMap(map);

    cout << "\n遍历键值对 Key->Value" << endl;
    // [region]{iterate_pairs}
    /* 遍历哈希表 */
    // 遍历键值对 key->value
    for (auto kv : map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    // [endregion]{iterate_pairs}

    cout << "\n使用迭代器遍历 Key->Value" << endl;
    // [region]{iterate_pairs_iterator}
    // 使用迭代器遍历 key->value
    for (auto iter = map.begin(); iter != map.end(); iter++) {
        cout << iter->first << " -> " << iter->second << endl;
    }
    // [endregion]{iterate_pairs_iterator}

    return 0;
}
