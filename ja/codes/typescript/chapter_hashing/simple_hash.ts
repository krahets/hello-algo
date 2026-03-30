/**
 * File: simple_hash.ts
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 加算ハッシュ */
function addHash(key: string): number {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash = (hash + c.charCodeAt(0)) % MODULUS;
    }
    return hash;
}

/* 乗算ハッシュ */
function mulHash(key: string): number {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash = (31 * hash + c.charCodeAt(0)) % MODULUS;
    }
    return hash;
}

/* XOR ハッシュ */
function xorHash(key: string): number {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash ^= c.charCodeAt(0);
    }
    return hash % MODULUS;
}

/* 回転ハッシュ */
function rotHash(key: string): number {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash = ((hash << 4) ^ (hash >> 28) ^ c.charCodeAt(0)) % MODULUS;
    }
    return hash;
}

/* Driver Code */
const key = 'Hello アルゴリズム';

let hash = addHash(key);
console.log('加算ハッシュ値は ' + hash);

hash = mulHash(key);
console.log('乗算ハッシュ値は ' + hash);

hash = xorHash(key);
console.log('XOR ハッシュ値は ' + hash);

hash = rotHash(key);
console.log('回転ハッシュ値は ' + hash);
