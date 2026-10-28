/**
 * File: simple_hash.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 덧셈 해시 */
int addHash(string key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash = (hash + (int)c) % MODULUS;
    }
    return (int)hash;
}

/* 곱셈 해시 */
int mulHash(string key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash = (31 * hash + (int)c) % MODULUS;
    }
    return (int)hash;
}

/* XOR 해시 */
int xorHash(string key) {
    int hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash ^= (int)c;
    }
    return hash & MODULUS;
}

/* 회전 해시 */
int rotHash(string key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash = ((hash << 4) ^ (hash >> 28) ^ (int)c) % MODULUS;
    }
    return (int)hash;
}

/* 실행 코드 */
int main() {
    string key = "Hello 算法";

    int hash = addHash(key);
    cout << "덧셈 해시값: " << hash << endl;

    hash = mulHash(key);
    cout << "곱셈 해시값: " << hash << endl;

    hash = xorHash(key);
    cout << "XOR 해시값: " << hash << endl;

    hash = rotHash(key);
    cout << "회전 해시값: " << hash << endl;

    return 0;
}
