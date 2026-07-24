/**
 * File: built_in_hash.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、规范命名空间、代码整洁、无警告
 */

#include "../utils/common.hpp"
#include <iostream>
#include <string>
#include <functional> // for std::hash

/* Driver Code */
int main() {
    // 整数哈希
    int num = 3;
    size_t hashNum = std::hash<int>{}(num);
    std::cout << "整数 " << num << " 的哈希值为 " << hashNum << "\n";

    // 布尔量哈希
    bool bol = true;
    size_t hashBol = std::hash<bool>{}(bol);
    std::cout << "布尔量 " << std::boolalpha << bol << " 的哈希值为 " << hashBol << "\n";

    // 小数哈希
    double dec = 3.14159;
    size_t hashDec = std::hash<double>{}(dec);
    std::cout << "小数 " << dec << " 的哈希值为 " << hashDec << "\n";

    // 字符串哈希
    std::string str = "Hello 算法";
    size_t hashStr = std::hash<std::string>{}(str);
    std::cout << "字符串 \"" << str << "\" 的哈希值为 " << hashStr << "\n";

    // C++ 标准库仅支持基本类型哈希
    // 数组、对象等需自行实现哈希函数

    return 0;
}
