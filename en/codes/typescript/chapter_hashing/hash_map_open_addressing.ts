/**
 * File: hash_map_open_addressing.ts
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com), krahets (krahets@163.com)
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

/* Hash table with open addressing */
class HashMapOpenAddressing {
    private size: number; // Number of key-value pairs
    private capacity: number; // Hash table capacity
    private loadThres: number; // Load factor threshold that triggers capacity growth
    private extendRatio: number; // Capacity growth factor
    private buckets: Array<Pair | null>; // Bucket array
    private TOMBSTONE: Pair; // Tombstone marker

    /* Constructor */
    constructor() {
        this.size = 0; // Number of key-value pairs
        this.capacity = 4; // Hash table capacity
        this.loadThres = 2.0 / 3.0; // Load factor threshold that triggers capacity growth
        this.extendRatio = 2; // Capacity growth factor
        this.buckets = Array(this.capacity).fill(null); // Bucket array
        this.TOMBSTONE = new Pair(-1, '-1'); // Tombstone marker
    }

    /* Hash function */
    private hashFunc(key: number): number {
        return key % this.capacity;
    }

    /* Load factor */
    private loadFactor(): number {
        return this.size / this.capacity;
    }

    /* Find the bucket index for key */
    private findBucket(key: number): number {
        let index = this.hashFunc(key);
        let firstTombstone = -1;
        // Probe linearly until an empty bucket is reached
        while (this.buckets[index] !== null) {
            // If key is found, return its bucket index
            if (this.buckets[index]!.key === key) {
                // If a tombstone was encountered earlier, move the key-value pair to that index
                if (firstTombstone !== -1) {
                    this.buckets[firstTombstone] = this.buckets[index];
                    this.buckets[index] = this.TOMBSTONE;
                    return firstTombstone; // Return the bucket index after the move
                }
                return index; // Return the bucket index
            }
            // Record the first tombstone encountered
            if (
                firstTombstone === -1 &&
                this.buckets[index] === this.TOMBSTONE
            ) {
                firstTombstone = index;
            }
            // Calculate the bucket index, wrapping to the beginning after the end
            index = (index + 1) % this.capacity;
        }
        // If key is absent, return the index for insertion
        return firstTombstone === -1 ? index : firstTombstone;
    }

    /* Lookup operation */
    get(key: number): string | null {
        // Find the bucket index for key
        const index = this.findBucket(key);
        // If the key-value pair is found, return its val
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            return this.buckets[index]!.val;
        }
        // Return null if the key-value pair does not exist
        return null;
    }

    /* Insert operation */
    put(key: number, val: string): void {
        // Grow the capacity when the load factor exceeds the threshold
        if (this.loadFactor() > this.loadThres) {
            this.extend();
        }
        // Find the bucket index for key
        const index = this.findBucket(key);
        // If the key-value pair is found, overwrite val and return
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            this.buckets[index]!.val = val;
            return;
        }
        // If the key-value pair is absent, insert it
        this.buckets[index] = new Pair(key, val);
        this.size++;
    }

    /* Remove operation */
    remove(key: number): void {
        // Find the bucket index for key
        const index = this.findBucket(key);
        // If the key-value pair is found, replace it with a tombstone
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            this.buckets[index] = this.TOMBSTONE;
            this.size--;
        }
    }

    /* Grow the hash table capacity */
    private extend(): void {
        // Keep a reference to the original hash table
        const bucketsTmp = this.buckets;
        // Initialize a new hash table with the expanded capacity
        this.capacity *= this.extendRatio;
        this.buckets = Array(this.capacity).fill(null);
        this.size = 0;
        // Move the key-value pairs from the original hash table to the new one
        for (const pair of bucketsTmp) {
            if (pair !== null && pair !== this.TOMBSTONE) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* Print the hash table */
    print(): void {
        for (const pair of this.buckets) {
            if (pair === null) {
                console.log('null');
            } else if (pair === this.TOMBSTONE) {
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

// Insert operation
// Insert the key-value pair (key, val) into the hash table
hashmap.put(12836, '小哈');
hashmap.put(15937, '小啰');
hashmap.put(16750, '小算');
hashmap.put(13276, '小法');
hashmap.put(10583, '小鸭');
console.log('\nHash table after insertion:\nKey -> Value');
hashmap.print();

// Lookup operation
// Look up key in the hash table to obtain val
const name = hashmap.get(13276);
console.log('\nLook up student ID 13276 to obtain the name ' + name);

// Remove operation
// Remove the key-value pair (key, val) from the hash table
hashmap.remove(16750);
console.log('\nHash table after removing 16750:\nKey -> Value');
hashmap.print();

export {};
