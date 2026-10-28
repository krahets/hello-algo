/**
 * File: simple_hash.js
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 덧셈 해시 */
function addHash(key) {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash = (hash + c.charCodeAt(0)) % MODULUS;
    }
    return hash;
}

/* 곱셈 해시 */
function mulHash(key) {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash = (31 * hash + c.charCodeAt(0)) % MODULUS;
    }
    return hash;
}

/* XOR 해시 */
function xorHash(key) {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash ^= c.charCodeAt(0);
    }
    return hash % MODULUS;
}

/* 회전 해시 */
function rotHash(key) {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash = ((hash << 4) ^ (hash >> 28) ^ c.charCodeAt(0)) % MODULUS;
    }
    return hash;
}

/* 실행 코드 */
const key = 'Hello 算法';

let hash = addHash(key);
console.log('덧셈 해시값: ' + hash);

hash = mulHash(key);
console.log('곱셈 해시값: ' + hash);

hash = xorHash(key);
console.log('XOR 해시값: ' + hash);

hash = rotHash(key);
console.log('회전 해시값: ' + hash);
