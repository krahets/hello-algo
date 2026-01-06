/**
 * File: simple_hash.js
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Additive hash */
function addHash(key) {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash = (hash + c.charCodeAt(0)) % MODULUS;
    }
    return hash;
}

/* Multiplicative hash */
function mulHash(key) {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash = (31 * hash + c.charCodeAt(0)) % MODULUS;
    }
    return hash;
}

/* XOR hash */
function xorHash(key) {
    let hash = 0;
    const MODULUS = 1000000007;
    for (const c of key) {
        hash ^= c.charCodeAt(0);
    }
    return hash % MODULUS;
}

/* Rotational hash */
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
console.log('Additive hash value is ' + hash);

hash = mulHash(key);
console.log('Multiplicative hash value is ' + hash);

hash = xorHash(key);
console.log('XOR hash value is ' + hash);

hash = rotHash(key);
console.log('Rotational hash value is ' + hash);
