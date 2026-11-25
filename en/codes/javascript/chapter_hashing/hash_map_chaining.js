/**
 * File: hash_map_chaining.js
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Key-value pair: Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* Hash table with chaining */
class HashMapChaining {
    #size; // Number of key-value pairs
    #capacity; // Hash table capacity
    #loadThres; // Load factor threshold for resizing
    #extendRatio; // Growth factor
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

    /* Look up a value */
    get(key) {
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // Scan the bucket and return the corresponding val if key is found
        for (const pair of bucket) {
            if (pair.key === key) {
                return pair.val;
            }
        }
        // Return null if key is absent
        return null;
    }

    /* Insert a key-value pair */
    put(key, val) {
        // Expand the table when the load factor exceeds the threshold
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // Scan the bucket. If the specified key is found, update its val and return
        for (const pair of bucket) {
            if (pair.key === key) {
                pair.val = val;
                return;
            }
        }
        // If key is absent, append the pair to the end of the list
        const pair = new Pair(key, val);
        bucket.push(pair);
        this.#size++;
    }

    /* Remove a key-value pair */
    remove(key) {
        const index = this.#hashFunc(key);
        let bucket = this.#buckets[index];
        // Scan the bucket and remove the pair
        for (let i = 0; i < bucket.length; i++) {
            if (bucket[i].key === key) {
                bucket.splice(i, 1);
                this.#size--;
                break;
            }
        }
    }

    /* Expand the hash table */
    #extend() {
        // Save the original hash table
        const bucketsTmp = this.#buckets;
        // Initialize the larger hash table
        this.#capacity *= this.#extendRatio;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        this.#size = 0;
        // Move the key-value pairs from the old table into the new one
        for (const bucket of bucketsTmp) {
            for (const pair of bucket) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* Print the hash table */
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

/* Driver code */
/* Initialize the hash table */
const map = new HashMapChaining();

/* Insert a key-value pair */
// Insert the pair (key, value) into the hash table
map.put(12836, 'Xiao Ha');
map.put(15937, 'Xiao Luo');
map.put(16750, 'Xiao Suan');
map.put(13276, 'Xiao Fa');
map.put(10583, 'Xiao Ya');
console.log('\nHash table after insertion:\nKey -> Value');
map.print();

/* Look up a value */
// Look up key in the hash table to get value
const name = map.get(13276);
console.log('\nName for student ID 13276: ' + name);

/* Remove a key-value pair */
// Remove the pair (key, value) from the hash table
map.remove(12836);
console.log('\nHash table after removing 12836:\nKey -> Value');
map.print();
