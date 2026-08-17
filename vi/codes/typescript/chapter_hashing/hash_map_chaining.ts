/**
 * File: hash_map_chaining.ts
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Key-value pair Number -> String */
class Pair {
    key: number;
    val: string;
    constructor(key: number, val: string) {
        this.key = key;
        this.val = val;
    }
}

/* Hash table with separate chaining */
class HashMapChaining {
    #size: number; // Number of key-value pairs
    #capacity: number; // Hash table capacity
    #loadThres: number; // Load factor threshold for triggering expansion
    #extendRatio: number; // Expansion multiplier
    #buckets: Pair[][]; // Bucket array

    /* Constructor */
    constructor() {
        this.#size = 0;
        this.#capacity = 4;
        this.#loadThres = 2.0 / 3.0;
        this.#extendRatio = 2;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
    }

    /* Hash function */
    #hashFunc(key: number): number {
        return key % this.#capacity;
    }

    /* Load factor */
    #loadFactor(): number {
        return this.#size / this.#capacity;
    }

    /* Query operation */
    get(key: number): string | null {
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // Traverse bucket, if key is found, return corresponding val
        for (const pair of bucket) {
            if (pair.key === key) {
                return pair.val;
            }
        }
        // If key is not found, return null
        return null;
    }

    /* Add operation */
    put(key: number, val: string): void {
        // When load factor exceeds threshold, perform expansion
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // Traverse bucket, if specified key is encountered, update corresponding val and return
        for (const pair of bucket) {
            if (pair.key === key) {
                pair.val = val;
                return;
            }
        }
        // If key does not exist, append key-value pair to the end
        const pair = new Pair(key, val);
        bucket.push(pair);
        this.#size++;
    }

    /* Remove operation */
    remove(key: number): void {
        const index = this.#hashFunc(key);
        let bucket = this.#buckets[index];
        // Traverse bucket and remove key-value pair from it
        for (let i = 0; i < bucket.length; i++) {
            if (bucket[i].key === key) {
                bucket.splice(i, 1);
                this.#size--;
                break;
            }
        }
    }

    /* Expand hash table */
    #extend(): void {
        // Temporarily store the original hash table
        const bucketsTmp = this.#buckets;
        // Initialize expanded new hash table
        this.#capacity *= this.#extendRatio;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        this.#size = 0;
        // Move key-value pairs from original hash table to new hash table
        for (const bucket of bucketsTmp) {
            for (const pair of bucket) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* Print hash table */
    print(): void {
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
map.put(12836, 'Xiao Ha');
map.put(15937, 'Xiao Luo');
map.put(16750, 'Xiao Suan');
map.put(13276, 'Xiao Fa');
map.put(10583, 'Xiao Ya');
console.log('\nAfter adding is complete, hash table is\nKey -> Value');
map.print();

/* Query operation */
// Input key into hash table to get value
const name = map.get(13276);
console.log('\nInput student ID 13276, query name ' + name);

/* Remove operation */
// Remove key-value pair (key, value) from hash table
map.remove(12836);
console.log('\nAfter removing 12836, hash table is\nKey -> Value');
map.print();

export {};
