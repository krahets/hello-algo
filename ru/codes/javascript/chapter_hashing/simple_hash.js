/**
 * File: simple_hash.js
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Аддитивное хеширование */
function addHash(key) {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash = (hash + c.charCodeAt(0)) % MODULUS;
    }
    return hash;
}

/* Мультипликативное хеширование */
function mulHash(key) {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash = (31 * hash + c.charCodeAt(0)) % MODULUS;
    }
    return hash;
}

/* XOR-хеширование */
function xorHash(key) {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash ^= c.charCodeAt(0);
    }
    return hash % MODULUS;
}

/* Вращательное хеширование */
function rotHash(key) {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash = ((hash << 4) ^ (hash >> 28) ^ c.charCodeAt(0)) % MODULUS;
    }
    return hash;
}

/* Driver Code */
const key = 'Hello Algo';

let hash = addHash(key);
console.log('Аддитивное хешированиезначение равно' + hash);

hash = mulHash(key);
console.log('Мультипликативное хешированиезначение равно' + hash);

hash = xorHash(key);
console.log('XOR-хешированиезначение равно' + hash);

hash = rotHash(key);
console.log('Вращательное хешированиезначение равно' + hash);
