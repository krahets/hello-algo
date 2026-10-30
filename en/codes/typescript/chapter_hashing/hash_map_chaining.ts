/**
 * File: hash_map_chaining.ts
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Key-value pair: Number -> String */
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
    #loadThres: number; // Load factor threshold that triggers capacity growth
    #extendRatio: number; // Capacity growth factor
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

    /* Lookup operation */
    get(key: number): string | null {
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // Traverse the bucket; if key is found, return its corresponding val
        for (const pair of bucket) {
            if (pair.key === key) {
                return pair.val;
            }
        }
        // Return null if key was not found
        return null;
    }

    /* Insert operation */
    put(key: number, val: string): void {
        // Grow the capacity when the load factor exceeds the threshold
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // Traverse the bucket; if the specified key is found, update its val and return
        for (const pair of bucket) {
            if (pair.key === key) {
                pair.val = val;
                return;
            }
        }
        // If key is absent, append the key-value pair at the end
        const pair = new Pair(key, val);
        bucket.push(pair);
        this.#size++;
    }

    /* Remove operation */
    remove(key: number): void {
        const index = this.#hashFunc(key);
        let bucket = this.#buckets[index];
        // Traverse the bucket and remove the key-value pair
        for (let i = 0; i < bucket.length; i++) {
            if (bucket[i].key === key) {
                bucket.splice(i, 1);
                this.#size--;
                break;
            }
        }
    }

    /* Grow the hash table capacity */
    #extend(): void {
        // Keep a reference to the original hash table
        const bucketsTmp = this.#buckets;
        // Initialize a new hash table with the expanded capacity
        this.#capacity *= this.#extendRatio;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        this.#size = 0;
        // Move the key-value pairs from the original hash table to the new one
        for (const bucket of bucketsTmp) {
            for (const pair of bucket) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* Print the hash table */
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

/* Driver code */
/* Initialize the hash table */
const map = new HashMapChaining();

/* Insert operation */
// Insert the key-value pair (key, value) into the hash table
map.put(12836, '小哈');
map.put(15937, '小啰');
map.put(16750, '小算');
map.put(13276, '小法');
map.put(10583, '小鸭');
console.log('\nHash table after insertion:\nKey -> Value');
map.print();

/* Lookup operation */
// Look up key in the hash table to obtain value
const name = map.get(13276);
console.log('\nLook up student ID 13276 to obtain the name ' + name);

/* Remove operation */
// Remove the key-value pair (key, value) from the hash table
map.remove(12836);
console.log('\nHash table after removing 12836:\nKey -> Value');
map.print();

export {};
