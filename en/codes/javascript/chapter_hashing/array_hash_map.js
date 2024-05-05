/**
 * File: array_hash_map.js
 * Created Time: 2022-12-26
 * Author: Justin (xiefahit@gmail.com)
 */

/* Key-value pair Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* Hash table based on array implementation */
class ArrayHashMap {
    #buckets;
    constructor() {
        // Initialize an array, containing 100 buckets
        this.#buckets = new Array(100).fill(null);
    }

    /* Hash function */
    #hashFunc(key) {
        return key % 100;
    }

    /* Query operation */
    get(key) {
        let index = this.#hashFunc(key);
        let pair = this.#buckets[index];
        if (pair === null) return null;
        return pair.val;
    }

    /* Add operation */
    set(key, val) {
        let index = this.#hashFunc(key);
        this.#buckets[index] = new Pair(key, val);
    }

    /* Remove operation */
    delete(key) {
        let index = this.#hashFunc(key);
        // Set to null, indicating removal
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

    /* Print hash table */
    print() {
        let pairSet = this.entries();
        for (const pair of pairSet) {
            console.info(`${pair.key} -> ${pair.val}`);
        }
    }
}

/* Driver Code */
/* Initialize hash table */
const map = new ArrayHashMap();
/* Add operation */
// Add key-value pair (key, value) to the hash table
map.set(12836, 'Ha');
map.set(15937, 'Luo');
map.set(16750, 'Suan');
map.set(13276, 'Fa');
map.set(10583, 'Ya');
console.info('\nAfter adding, the hash table is\nKey -> Value');
map.print();

/* Query operation */
// Enter key to the hash table, get value
let name = map.get(15937);
console.info('\nEnter student ID 15937, found name ' + name);

/* Remove operation */
// Remove key-value pair (key, value) from the hash table
map.delete(10583);
console.info('\nAfter removing 10583, the hash table is\nKey -> Value');
map.print();

/* Traverse hash table */
console.info('\nTraverse key-value pairs Key->Value');
for (const pair of map.entries()) {
    if (!pair) continue;
    console.info(pair.key + ' -> ' + pair.val);
}
console.info('\nIndividually traverse keys Key');
for (const key of map.keys()) {
    console.info(key);
}
console.info('\nIndividually traverse values Value');
for (const val of map.values()) {
    console.info(val);
}
