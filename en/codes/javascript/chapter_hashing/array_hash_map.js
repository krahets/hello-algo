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

/* Array-based hash table */
class ArrayHashMap {
    #buckets;
    constructor() {
        // Initialize an array with 100 buckets
        this.#buckets = new Array(100).fill(null);
    }

    /* Hash function */
    #hashFunc(key) {
        return key % 100;
    }

    /* Look up a value */
    get(key) {
        let index = this.#hashFunc(key);
        let pair = this.#buckets[index];
        if (pair === null) return null;
        return pair.val;
    }

    /* Insert a key-value pair */
    set(key, val) {
        let index = this.#hashFunc(key);
        this.#buckets[index] = new Pair(key, val);
    }

    /* Remove a key-value pair */
    delete(key) {
        let index = this.#hashFunc(key);
        // Set the slot to null to remove the entry
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
/* Insert a key-value pair */
// Insert the pair (key, value) into the hash table
map.set(12836, 'Xiao Ha');
map.set(15937, 'Xiao Luo');
map.set(16750, 'Xiao Suan');
map.set(13276, 'Xiao Fa');
map.set(10583, 'Xiao Ya');
console.info('\nHash table after insertion:\nKey -> Value');
map.print();

/* Look up a value */
// Look up key in the hash table to get value
let name = map.get(15937);
console.info('\nName for student ID 15937: ' + name);

/* Remove a key-value pair */
// Remove the pair (key, value) from the hash table
map.delete(10583);
console.info('\nHash table after removing 10583:\nKey -> Value');
map.print();

/* Iterate over the hash table */
console.info('\nIterate over key-value pairs (Key->Value)');
for (const pair of map.entries()) {
    if (!pair) continue;
    console.info(pair.key + ' -> ' + pair.val);
}
console.info('\nIterate over keys only');
for (const key of map.keys()) {
    console.info(key);
}
console.info('\nIterate over values only');
for (const val of map.values()) {
    console.info(val);
}
