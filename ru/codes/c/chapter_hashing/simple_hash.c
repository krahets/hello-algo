/**
 * File: simple_hash.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Аддитивное хеширование */
int addHash(char *key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (int i = 0; i < strlen(key); i++) {
        hash = (hash + (unsigned char)key[i]) % MODULUS;
    }
    return (int)hash;
}

/* Мультипликативное хеширование */
int mulHash(char *key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (int i = 0; i < strlen(key); i++) {
        hash = (31 * hash + (unsigned char)key[i]) % MODULUS;
    }
    return (int)hash;
}

/* Хеширование с помощью XOR */
int xorHash(char *key) {
    int hash = 0;
    const int MODULUS = 1000000007;

    for (int i = 0; i < strlen(key); i++) {
        hash ^= (unsigned char)key[i];
    }
    return hash & MODULUS;
}

/* Хеширование с циклическим сдвигом */
int rotHash(char *key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (int i = 0; i < strlen(key); i++) {
        hash = ((hash << 4) ^ (hash >> 28) ^ (unsigned char)key[i]) % MODULUS;
    }

    return (int)hash;
}

/* Демонстрационный код */
int main() {
    char *key = "Hello 算法";

    int hash = addHash(key);
    printf("Аддитивный хеш: %d\n", hash);

    hash = mulHash(key);
    printf("Мультипликативный хеш: %d\n", hash);

    hash = xorHash(key);
    printf("Хеш на основе XOR: %d\n", hash);

    hash = rotHash(key);
    printf("Хеш с циклическим сдвигом: %d\n", hash);

    return 0;
}
