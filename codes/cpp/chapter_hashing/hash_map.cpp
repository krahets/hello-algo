/**
 * File: hash_map.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、规范命名空间、高效遍历、无警告
 */

#include "../utils/common.hpp"
#include <unordered_map>
#include <iostream>
#include <string>

/* Driver Code */
int main() {
    // 初始化哈希表
    std::unordered_map<int, std::string> map;

    // 添加操作
    map[12836] = "小哈";
    map[15937] = "小啰";
    map[16750] = "小算";
    map[13276] = "小法";
    map[10583] = "小鸭";
    std::cout << "\n添加完成后，哈希表为\nKey -> Value\n";
    printHashMap(map);

    // 查询操作
    std::string name = map[15937];
    std::cout << "\n输入学号 15937 ，查询到姓名 " << name << '\n';

    // 删除操作
    map.erase(10583);
    std::cout << "\n删除 10583 后，哈希表为\nKey -> Value\n";
    printHashMap(map);

    // 遍历哈希表（推荐：范围 for + 常量引用，最高效）
    std::cout << "\n遍历键值对 Key->Value\n";
    for (const auto& kv : map) {
        std::cout << kv.first << " -> " << kv.second << '\n';
    }

    // 迭代器遍历
    std::cout << "\n使用迭代器遍历 Key->Value\n";
    for (auto iter = map.cbegin(); iter != map.cend(); ++iter) {
        std::cout << iter->first << " -> " << iter->second << '\n';
    }

    return 0;
}
