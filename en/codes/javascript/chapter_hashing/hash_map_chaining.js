/**
 * File: hash_map_chaining.js
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Key-value pair Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* Chained address hash table */
class HashMapChaining {
    #size; // Number of key-value pairs
    #capacity; // Hash table capacity
    #loadThres; // Load factor threshold for triggering expansion
    #extendRatio; // Expansion multiplier
    #buckets; // Bucket array

    /* Constructor */
    constructor() {
        this.#size = 0;
        this.#capacity = 4;
        this.#loadThres = 2.0 / 3.0;
        this.#extendRatio = 2;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
    }

    /* Hash function */
    #hashFunc(key) {
        return key % this.#capacity;
    }

    /* Load factor */
    #loadFactor() {
        return this.#size / this.#capacity;
    }

    /* Query operation */
    get(key) {
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // Traverse the bucket, if the key is found, return the corresponding val
        for (const pair of bucket) {
            if (pair.key === key) {
                return pair.val;
            }
        }
        // If key is not found, return null
        return null;
    }

    /* Add operation */
    put(key, val) {
        // When the load factor exceeds the threshold, perform expansion
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // Traverse the bucket, if the specified key is encountered, update the corresponding val and return
        for (const pair of bucket) {
            if (pair.key === key) {
                pair.val = val;
                return;
            }
        }
        // If the key is not found, add the key-value pair to the end
        const pair = new Pair(key, val);
        bucket.push(pair);
        this.#size++;
    }

    /* Remove operation */
    remove(key) {
        const index = this.#hashFunc(key);
        let bucket = this.#buckets[index];
        // Traverse the bucket, remove the key-value pair from it
        for (let i = 0; i < bucket.length; i++) {
            if (bucket[i].key === key) {
                bucket.splice(i, 1);
                this.#size--;
                break;
            }
        }
    }

    /* Extend hash table */
    #extend() {
        // Temporarily store the original hash table
        const bucketsTmp = this.#buckets;
        // Initialize the extended new hash table
        this.#capacity *= this.#extendRatio;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        this.#size = 0;
        // Move key-value pairs from the original hash table to the new hash table
        for (const bucket of bucketsTmp) {
            for (const pair of bucket) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* Print hash table */
    print() {
        for (const bucket of this.#buckets) {
            let res = [];
            for (const pair of bucket) {
                res.push(pair.key + ' -> ' + pair.val);
            }
            console.log(res);
        }
    }
}

/* Driver Code */
/* Initialize hash table */
const map = new HashMapChaining();

/* Add operation */
// Add key-value pair (key, value) to the hash table
map.put(12836, 'Ha');
map.put(15937, 'Luo');
map.put(16750, 'Suan');
map.put(13276, 'Fa');
map.put(10583, 'Ya');
console.log('\nAfter adding, the hash table is\nKey -> Value');
map.print();

/* Query operation */
// Enter key to the hash table, get value
const name = map.get(13276);
console.log('\nEnter student ID 13276, found name ' + name);

/* Remove operation */
// Remove key-value pair (key, value) from the hash table
map.remove(12836);
console.log('\nAfter removing 12836, the hash table is\nKey -> Value');
map.print();
