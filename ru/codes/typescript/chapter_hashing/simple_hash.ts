/**
 * File: simple_hash.ts
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Аддитивное хеширование */
function addHash(key: string): number {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash = (hash + c.charCodeAt(0)) % MODULUS;
    }
    return hash;
}

/* Мультипликативное хеширование */
function mulHash(key: string): number {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash = (31 * hash + c.charCodeAt(0)) % MODULUS;
    }
    return hash;
}

/* Хеширование с помощью XOR */
function xorHash(key: string): number {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash ^= c.charCodeAt(0);
    }
    return hash % MODULUS;
}

/* Хеширование с циклическим сдвигом */
function rotHash(key: string): number {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash = ((hash << 4) ^ (hash >> 28) ^ c.charCodeAt(0)) % MODULUS;
    }
    return hash;
}

/* Демонстрационный код */
const key = 'Hello 算法';

let hash = addHash(key);
console.log('Аддитивный хеш: ' + hash);

hash = mulHash(key);
console.log('Мультипликативный хеш: ' + hash);

hash = xorHash(key);
console.log('Хеш на основе XOR: ' + hash);

hash = rotHash(key);
console.log('Хеш с циклическим сдвигом: ' + hash);
