/**
 * File: simple_hash.ts
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Additive hashing */
function addHash(key: string): number {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash = (hash + c.charCodeAt(0)) % MODULUS;
    }
    return hash;
}

/* Multiplicative hashing */
function mulHash(key: string): number {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash = (31 * hash + c.charCodeAt(0)) % MODULUS;
    }
    return hash;
}

/* XOR hashing */
function xorHash(key: string): number {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash ^= c.charCodeAt(0);
    }
    return hash % MODULUS;
}

/* Rotation hashing */
function rotHash(key: string): number {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash = ((hash << 4) ^ (hash >> 28) ^ c.charCodeAt(0)) % MODULUS;
    }
    return hash;
}

/* Driver code */
const key = 'Hello 算法';

let hash = addHash(key);
console.log('Additive hash value: ' + hash);

hash = mulHash(key);
console.log('Multiplicative hash value: ' + hash);

hash = xorHash(key);
console.log('XOR hash value: ' + hash);

hash = rotHash(key);
console.log('Rotation hash value: ' + hash);
