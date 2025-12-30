/**
 * File: hashMapOpenAddressing.js
 * Created Time: 2023-06-13
 * Author: yuan0221 (yl1452491917@gmail.com), krahets (krahets@163.com)
 */

/* Key-value pair Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* Hash table with open addressing */
class HashMapOpenAddressing {
    #size; // Number of key-value pairs
    #capacity; // Hash table capacity
    #loadThres; // Load factor threshold for triggering expansion
    #extendRatio; // Expansion multiplier
    #buckets; // Bucket array
    #TOMBSTONE; // Removal marker

    /* Constructor */
    constructor() {
        this.#size = 0; // Number of key-value pairs
        this.#capacity = 4; // Hash table capacity
        this.#loadThres = 2.0 / 3.0; // Load factor threshold for triggering expansion
        this.#extendRatio = 2; // Expansion multiplier
        this.#buckets = Array(this.#capacity).fill(null); // Bucket array
        this.#TOMBSTONE = new Pair(-1, '-1'); // Removal marker
    }

    /* Hash function */
    #hashFunc(key) {
        return key % this.#capacity;
    }

    /* Load factor */
    #loadFactor() {
        return this.#size / this.#capacity;
    }

    /* Search for bucket index corresponding to key */
    #findBucket(key) {
        let index = this.#hashFunc(key);
        let firstTombstone = -1;
        // Linear probing, break when encountering an empty bucket
        while (this.#buckets[index] !== null) {
            // If key is encountered, return the corresponding bucket index
            if (this.#buckets[index].key === key) {
                // If a removal marker was encountered before, move the key-value pair to that index
                if (firstTombstone !== -1) {
                    this.#buckets[firstTombstone] = this.#buckets[index];
                    this.#buckets[index] = this.#TOMBSTONE;
                    return firstTombstone; // Return the moved bucket index
                }
                return index; // Return bucket index
            }
            // Record the first removal marker encountered
            if (
                firstTombstone === -1 &&
                this.#buckets[index] === this.#TOMBSTONE
            ) {
                firstTombstone = index;
            }
            // Calculate bucket index, wrap around to the head if past the tail
            index = (index + 1) % this.#capacity;
        }
        // If key does not exist, return the index for insertion
        return firstTombstone === -1 ? index : firstTombstone;
    }

    /* Query operation */
    get(key) {
        // Search for bucket index corresponding to key
        const index = this.#findBucket(key);
        // If key-value pair is found, return corresponding val
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            return this.#buckets[index].val;
        }
        // If key-value pair does not exist, return null
        return null;
    }

    /* Add operation */
    put(key, val) {
        // When load factor exceeds threshold, perform expansion
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        // Search for bucket index corresponding to key
        const index = this.#findBucket(key);
        // If key-value pair is found, overwrite val and return
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            this.#buckets[index].val = val;
            return;
        }
        // If key-value pair does not exist, add the key-value pair
        this.#buckets[index] = new Pair(key, val);
        this.#size++;
    }

    /* Remove operation */
    remove(key) {
        // Search for bucket index corresponding to key
        const index = this.#findBucket(key);
        // If key-value pair is found, overwrite it with removal marker
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            this.#buckets[index] = this.#TOMBSTONE;
            this.#size--;
        }
    }

    /* Expand hash table */
    #extend() {
        // Temporarily store the original hash table
        const bucketsTmp = this.#buckets;
        // Initialize expanded new hash table
        this.#capacity *= this.#extendRatio;
        this.#buckets = Array(this.#capacity).fill(null);
        this.#size = 0;
        // Move key-value pairs from original hash table to new hash table
        for (const pair of bucketsTmp) {
            if (pair !== null && pair !== this.#TOMBSTONE) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* Print hash table */
    print() {
        for (const pair of this.#buckets) {
            if (pair === null) {
                console.log('null');
            } else if (pair === this.#TOMBSTONE) {
                console.log('TOMBSTONE');
            } else {
                console.log(pair.key + ' -> ' + pair.val);
            }
        }
    }
}

/* Driver Code */
// Initialize hash table
const hashmap = new HashMapOpenAddressing();

// Add operation
// Add key-value pair (key, val) to the hash table
hashmap.put(12836, 'Xiao Ha');
hashmap.put(15937, 'Xiao Luo');
hashmap.put(16750, 'Xiao Suan');
hashmap.put(13276, 'Xiao Fa');
hashmap.put(10583, 'Xiao Ya');
console.log('\nAfter adding is complete, hash table is\nKey -> Value');
hashmap.print();

// Query operation
// Input key into hash table to get value val
const name = hashmap.get(13276);
console.log('\nInput student ID 13276, query name ' + name);

// Remove operation
// Remove key-value pair (key, val) from hash table
hashmap.remove(16750);
console.log('\nAfter removing 16750, hash table is\nKey -> Value');
hashmap.print();
