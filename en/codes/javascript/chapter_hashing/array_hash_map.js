/**
 * File: array_hash_map.js
 * Created Time: 2022-12-26
 * Author: Justin (xiefahit@gmail.com)
 */

/* Key-value pair: Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* Hash table implemented with an array */
class ArrayHashMap {
    #buckets;
    constructor() {
        // Initialize an array containing 100 buckets
        this.#buckets = new Array(100).fill(null);
    }

    /* Hash function */
    #hashFunc(key) {
        return key % 100;
    }

    /* Lookup operation */
    get(key) {
        let index = this.#hashFunc(key);
        let pair = this.#buckets[index];
        if (pair === null) return null;
        return pair.val;
    }

    /* Insert operation */
    set(key, val) {
        let index = this.#hashFunc(key);
        this.#buckets[index] = new Pair(key, val);
    }

    /* Remove operation */
    delete(key) {
        let index = this.#hashFunc(key);
        // Set the bucket to null to mark it as deleted
        this.#buckets[index] = null;
    }

    /* Get all key-value pairs */
    entries() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i]);
            }
        }
        return arr;
    }

    /* Get all keys */
    keys() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i].key);
            }
        }
        return arr;
    }

    /* Get all values */
    values() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i].val);
            }
        }
        return arr;
    }

    /* Print the hash table */
    print() {
        let pairSet = this.entries();
        for (const pair of pairSet) {
            console.info(`${pair.key} -> ${pair.val}`);
        }
    }
}

/* Driver code */
/* Initialize the hash table */
const map = new ArrayHashMap();
/* Insert operation */
// Insert the key-value pair (key, value) into the hash table
map.set(12836, '小哈');
map.set(15937, '小啰');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鸭');
console.info('\nHash table after insertion:\nKey -> Value');
map.print();

/* Lookup operation */
// Look up key in the hash table to obtain value
let name = map.get(15937);
console.info('\nLook up student ID 15937 to obtain the name ' + name);

/* Remove operation */
// Remove the key-value pair (key, value) from the hash table
map.delete(10583);
console.info('\nHash table after removing 10583:\nKey -> Value');
map.print();

/* Traverse the hash table */
console.info('\nTraverse key-value pairs: Key->Value');
for (const pair of map.entries()) {
    if (!pair) continue;
    console.info(pair.key + ' -> ' + pair.val);
}
console.info('\nTraverse keys only: Key');
for (const key of map.keys()) {
    console.info(key);
}
console.info('\nTraverse values only: Value');
for (const val of map.values()) {
    console.info(val);
}
