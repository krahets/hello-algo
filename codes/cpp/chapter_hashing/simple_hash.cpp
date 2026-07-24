/**
 * File: simple_hash.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、const正确性、类型安全、代码规范
 */

#include "../utils/common.hpp"
#include <string>
#include <iostream>

/* 加法哈希 */
int addHash(const std::string& key) {
    long long hash = 0;
    const int MOD = 1000000007;
    for (unsigned char c : key) {
        hash = (hash + c) % MOD;
    }
    return static_cast<int>(hash);
}

/* 乘法哈希 */
int mulHash(const std::string& key) {
    long long hash = 0;
    const int MOD = 1000000007;
    for (unsigned char c : key) {
        hash = (31 * hash + c) % MOD;
    }
    return static_cast<int>(hash);
}

/* 异或哈希 */
int xorHash(const std::string& key) {
    int hash = 0;
    const int MOD = 1000000007;
    for (unsigned char c : key) {
        hash ^= c;
    }
    return hash & MOD;
}

/* 旋转哈希 */
int rotHash(const std::string& key) {
    long long hash = 0;
    const int MOD = 1000000007;
    for (unsigned char c : key) {
        hash = ((hash << 4) ^ (hash >> 28) ^ c) % MOD;
    }
    return static_cast<int>(hash);
}

/* Driver Code */
int main() {
    std::string key = "Hello 算法";

    int hash = addHash(key);
    std::cout << "加法哈希值为 " << hash << '\n';

    hash = mulHash(key);
    std::cout << "乘法哈希值为 " << hash << '\n';

    hash = xorHash(key);
    std::cout << "异或哈希值为 " << hash << '\n';

    hash = rotHash(key);
    std::cout << "旋转哈希值为 " << hash << '\n';

    return 0;
}
