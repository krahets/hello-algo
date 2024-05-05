/**
 * File: hash_map_open_addressing.ts
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com), krahets (krahets@163.com)
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

/* Open addressing hash table */
class HashMapOpenAddressing {
    private size: number; // Number of key-value pairs
    private capacity: number; // Hash table capacity
    private loadThres: number; // Load factor threshold for triggering expansion
    private extendRatio: number; // Expansion multiplier
    private buckets: Array<Pair | null>; // Bucket array
    private TOMBSTONE: Pair; // Removal mark

    /* Constructor */
    constructor() {
        this.size = 0; // Number of key-value pairs
        this.capacity = 4; // Hash table capacity
        this.loadThres = 2.0 / 3.0; // Load factor threshold for triggering expansion
        this.extendRatio = 2; // Expansion multiplier
        this.buckets = Array(this.capacity).fill(null); // Bucket array
        this.TOMBSTONE = new Pair(-1, '-1'); // Removal mark
    }

    /* Hash function */
    private hashFunc(key: number): number {
        return key % this.capacity;
    }

    /* Load factor */
    private loadFactor(): number {
        return this.size / this.capacity;
    }

    /* Search for the bucket index corresponding to key */
    private findBucket(key: number): number {
        let index = this.hashFunc(key);
        let firstTombstone = -1;
        // Linear probing, break when encountering an empty bucket
        while (this.buckets[index] !== null) {
            // If the key is encountered, return the corresponding bucket index
            if (this.buckets[index]!.key === key) {
                // If a removal mark was encountered earlier, move the key-value pair to that index
                if (firstTombstone !== -1) {
                    this.buckets[firstTombstone] = this.buckets[index];
                    this.buckets[index] = this.TOMBSTONE;
                    return firstTombstone; // Return the moved bucket index
                }
                return index; // Return bucket index
            }
            // Record the first encountered removal mark
            if (
                firstTombstone === -1 &&
                this.buckets[index] === this.TOMBSTONE
            ) {
                firstTombstone = index;
            }
            // Calculate the bucket index, return to the head if exceeding the tail
            index = (index + 1) % this.capacity;
        }
        // If the key does not exist, return the index of the insertion point
        return firstTombstone === -1 ? index : firstTombstone;
    }

    /* Query operation */
    get(key: number): string | null {
        // Search for the bucket index corresponding to key
        const index = this.findBucket(key);
        // If the key-value pair is found, return the corresponding val
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            return this.buckets[index]!.val;
        }
        // If the key-value pair does not exist, return null
        return null;
    }

    /* Add operation */
    put(key: number, val: string): void {
        // When the load factor exceeds the threshold, perform expansion
        if (this.loadFactor() > this.loadThres) {
            this.extend();
        }
        // Search for the bucket index corresponding to key
        const index = this.findBucket(key);
        // If the key-value pair is found, overwrite val and return
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            this.buckets[index]!.val = val;
            return;
        }
        // If the key-value pair does not exist, add the key-value pair
        this.buckets[index] = new Pair(key, val);
        this.size++;
    }

    /* Remove operation */
    remove(key: number): void {
        // Search for the bucket index corresponding to key
        const index = this.findBucket(key);
        // If the key-value pair is found, cover it with a removal mark
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            this.buckets[index] = this.TOMBSTONE;
            this.size--;
        }
    }

    /* Extend hash table */
    private extend(): void {
        // Temporarily store the original hash table
        const bucketsTmp = this.buckets;
        // Initialize the extended new hash table
        this.capacity *= this.extendRatio;
        this.buckets = Array(this.capacity).fill(null);
        this.size = 0;
        // Move key-value pairs from the original hash table to the new hash table
        for (const pair of bucketsTmp) {
            if (pair !== null && pair !== this.TOMBSTONE) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* Print hash table */
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

/* Driver Code */
// Initialize hash table
const hashmap = new HashMapOpenAddressing();

// Add operation
// Add key-value pair (key, val) to the hash table
hashmap.put(12836, 'Ha');
hashmap.put(15937, 'Luo');
hashmap.put(16750, 'Suan');
hashmap.put(13276, 'Fa');
hashmap.put(10583, 'Ya');
console.log('\nAfter adding, the hash table is\nKey -> Value');
hashmap.print();

// Query operation
// Enter key to the hash table, get value val
const name = hashmap.get(13276);
console.log('\nEnter student ID 13276, found name ' + name);

// Remove operation
// Remove key-value pair (key, val) from the hash table
hashmap.remove(16750);
console.log('\nAfter removing 16750, the hash table is\nKey -> Value');
hashmap.print();

export {};
