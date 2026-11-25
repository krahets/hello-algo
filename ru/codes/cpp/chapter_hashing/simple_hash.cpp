/**
 * File: simple_hash.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Аддитивное хеширование */
int addHash(string key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash = (hash + (int)c) % MODULUS;
    }
    return (int)hash;
}

/* Мультипликативное хеширование */
int mulHash(string key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash = (31 * hash + (int)c) % MODULUS;
    }
    return (int)hash;
}

/* Хеширование с помощью XOR */
int xorHash(string key) {
    int hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash ^= (int)c;
    }
    return hash & MODULUS;
}

/* Хеширование с циклическим сдвигом */
int rotHash(string key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash = ((hash << 4) ^ (hash >> 28) ^ (int)c) % MODULUS;
    }
    return (int)hash;
}

/* Демонстрационный код */
int main() {
    string key = "Hello 算法";

    int hash = addHash(key);
    cout << "Аддитивный хеш: " << hash << endl;

    hash = mulHash(key);
    cout << "Мультипликативный хеш: " << hash << endl;

    hash = xorHash(key);
    cout << "Хеш на основе XOR: " << hash << endl;

    hash = rotHash(key);
    cout << "Хеш с циклическим сдвигом: " << hash << endl;

    return 0;
}
