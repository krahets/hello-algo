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

/* XOR-хеширование */
int xorHash(string key) {
    int hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash ^= (int)c;
    }
    return hash & MODULUS;
}

/* Вращательное хеширование */
int rotHash(string key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash = ((hash << 4) ^ (hash >> 28) ^ (int)c) % MODULUS;
    }
    return (int)hash;
}

/* Driver Code */
int main() {
    string key = "Hello Algo";

    int hash = addHash(key);
    cout << "Аддитивное хешированиезначениеравно" << hash << endl;

    hash = mulHash(key);
    cout << "Мультипликативное хешированиезначениеравно" << hash << endl;

    hash = xorHash(key);
    cout << "XOR-хешированиезначениеравно" << hash << endl;

    hash = rotHash(key);
    cout << "Вращательное хешированиезначениеравно" << hash << endl;

    return 0;
}
