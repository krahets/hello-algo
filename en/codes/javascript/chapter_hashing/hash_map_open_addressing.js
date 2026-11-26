/**
 * File: hashMapOpenAddressing.js
 * Created Time: 2023-06-13
 * Author: yuan0221 (yl1452491917@gmail.com), krahets (krahets@163.com)
 */

/* Key-value pair: Number -> String */
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
    #loadThres; // Load factor threshold for resizing
    #extendRatio; // Growth factor
    #buckets; // Bucket array
    #TOMBSTONE; // Deletion marker

    /* Constructor */
    constructor() {
        this.#size = 0; // Number of key-value pairs
        this.#capacity = 4; // Hash table capacity
        this.#loadThres = 2.0 / 3.0; // Load factor threshold for resizing
        this.#extendRatio = 2; // Growth factor
        this.#buckets = Array(this.#capacity).fill(null); // Bucket array
        this.#TOMBSTONE = new Pair(-1, '-1'); // Deletion marker
    }

    /* Hash function */
    #hashFunc(key) {
        return key % this.#capacity;
    }

    /* Load factor */
    #loadFactor() {
        return this.#size / this.#capacity;
    }

    /* Find the bucket index for key */
    #findBucket(key) {
        let index = this.#hashFunc(key);
        let firstTombstone = -1;
        // Probe linearly until an empty bucket is reached
        while (this.#buckets[index] !== null) {
            // If key is found, return its bucket index
            if (this.#buckets[index].key === key) {
                // If a deletion marker was found earlier, move the pair to that index
                if (firstTombstone !== -1) {
                    this.#buckets[firstTombstone] = this.#buckets[index];
                    this.#buckets[index] = this.#TOMBSTONE;
                    return firstTombstone; // Return the new bucket index
                }
                return index; // Return the bucket index
            }
            // Record the first deletion marker encountered
            if (
                firstTombstone === -1 &&
                this.#buckets[index] === this.#TOMBSTONE
            ) {
                firstTombstone = index;
            }
            // Compute the next bucket index, wrapping to the start at the end
            index = (index + 1) % this.#capacity;
        }
        // If key is absent, return the index for insertion
        return firstTombstone === -1 ? index : firstTombstone;
    }

    /* Look up a value */
    get(key) {
        // Find the bucket index for key
        const index = this.#findBucket(key);
        // If the pair is found, return its val
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            return this.#buckets[index].val;
        }
        // Return null if the pair is absent
        return null;
    }

    /* Insert a key-value pair */
    put(key, val) {
        // Expand the table when the load factor exceeds the threshold
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        // Find the bucket index for key
        const index = this.#findBucket(key);
        // If the pair is found, overwrite val and return
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            this.#buckets[index].val = val;
            return;
        }
        // If the pair is absent, insert it
        this.#buckets[index] = new Pair(key, val);
        this.#size++;
    }

    /* Remove a key-value pair */
    remove(key) {
        // Find the bucket index for key
        const index = this.#findBucket(key);
        // If the pair is found, replace it with a deletion marker
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            this.#buckets[index] = this.#TOMBSTONE;
            this.#size--;
        }
    }

    /* Expand the hash table */
    #extend() {
        // Save the original hash table
        const bucketsTmp = this.#buckets;
        // Initialize the larger hash table
        this.#capacity *= this.#extendRatio;
        this.#buckets = Array(this.#capacity).fill(null);
        this.#size = 0;
        // Move the key-value pairs from the old table into the new one
        for (const pair of bucketsTmp) {
            if (pair !== null && pair !== this.#TOMBSTONE) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* Print the hash table */
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

/* Driver code */
// Initialize the hash table
const hashmap = new HashMapOpenAddressing();

// Insert a key-value pair
// Insert the pair (key, val) into the hash table
hashmap.put(12836, 'Xiao Ha');
hashmap.put(15937, 'Xiao Luo');
hashmap.put(16750, 'Xiao Suan');
hashmap.put(13276, 'Xiao Fa');
hashmap.put(10583, 'Xiao Ya');
console.log('\nHash table after insertion:\nKey -> Value');
hashmap.print();

// Look up a value
// Look up key in the hash table to get val
const name = hashmap.get(13276);
console.log('\nName for student ID 13276: ' + name);

// Remove a key-value pair
// Remove the pair (key, val) from the hash table
hashmap.remove(16750);
console.log('\nHash table after removing 16750:\nKey -> Value');
hashmap.print();
