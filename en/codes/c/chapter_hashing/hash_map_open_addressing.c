/**
 * File: hash_map_open_addressing.c
 * Created Time: 2023-10-6
 * Author: lclc6 (w1929522410@163.com)
 */

#include "../utils/common.h"

/* Open addressing hash table */
typedef struct {
    int key;
    char *val;
} Pair;

/* Open addressing hash table */
typedef struct {
    int size;         // Number of key-value pairs
    int capacity;     // Hash table capacity
    double loadThres; // Load factor threshold for triggering expansion
    int extendRatio;  // Expansion multiplier
    Pair **buckets;   // Bucket array
    Pair *TOMBSTONE;  // Removal mark
} HashMapOpenAddressing;

// Function declaration
void extend(HashMapOpenAddressing *hashMap);

/* Constructor */
HashMapOpenAddressing *newHashMapOpenAddressing() {
    HashMapOpenAddressing *hashMap = (HashMapOpenAddressing *)malloc(sizeof(HashMapOpenAddressing));
    hashMap->size = 0;
    hashMap->capacity = 4;
    hashMap->loadThres = 2.0 / 3.0;
    hashMap->extendRatio = 2;
    hashMap->buckets = (Pair **)malloc(sizeof(Pair *) * hashMap->capacity);
    hashMap->TOMBSTONE = (Pair *)malloc(sizeof(Pair));
    hashMap->TOMBSTONE->key = -1;
    hashMap->TOMBSTONE->val = "-1";

    return hashMap;
}

/* Destructor */
void delHashMapOpenAddressing(HashMapOpenAddressing *hashMap) {
    for (int i = 0; i < hashMap->capacity; i++) {
        Pair *pair = hashMap->buckets[i];
        if (pair != NULL && pair != hashMap->TOMBSTONE) {
            free(pair->val);
            free(pair);
        }
    }
    free(hashMap->buckets);
    free(hashMap->TOMBSTONE);
    free(hashMap);
}

/* Hash function */
int hashFunc(HashMapOpenAddressing *hashMap, int key) {
    return key % hashMap->capacity;
}

/* Load factor */
double loadFactor(HashMapOpenAddressing *hashMap) {
    return (double)hashMap->size / (double)hashMap->capacity;
}

/* Search for the bucket index corresponding to key */
int findBucket(HashMapOpenAddressing *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    int firstTombstone = -1;
    // Linear probing, break when encountering an empty bucket
    while (hashMap->buckets[index] != NULL) {
        // If the key is encountered, return the corresponding bucket index
        if (hashMap->buckets[index]->key == key) {
            // If a removal mark was encountered earlier, move the key-value pair to that index
            if (firstTombstone != -1) {
                hashMap->buckets[firstTombstone] = hashMap->buckets[index];
                hashMap->buckets[index] = hashMap->TOMBSTONE;
                return firstTombstone; // Return the moved bucket index
            }
            return index; // Return bucket index
        }
        // Record the first encountered removal mark
        if (firstTombstone == -1 && hashMap->buckets[index] == hashMap->TOMBSTONE) {
            firstTombstone = index;
        }
        // Calculate the bucket index, return to the head if exceeding the tail
        index = (index + 1) % hashMap->capacity;
    }
    // If the key does not exist, return the index of the insertion point
    return firstTombstone == -1 ? index : firstTombstone;
}

/* Query operation */
char *get(HashMapOpenAddressing *hashMap, int key) {
    // Search for the bucket index corresponding to key
    int index = findBucket(hashMap, key);
    // If the key-value pair is found, return the corresponding val
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        return hashMap->buckets[index]->val;
    }
    // If key-value pair does not exist, return an empty string
    return "";
}

/* Add operation */
void put(HashMapOpenAddressing *hashMap, int key, char *val) {
    // When the load factor exceeds the threshold, perform expansion
    if (loadFactor(hashMap) > hashMap->loadThres) {
        extend(hashMap);
    }
    // Search for the bucket index corresponding to key
    int index = findBucket(hashMap, key);
    // If the key-value pair is found, overwrite val and return
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        free(hashMap->buckets[index]->val);
        hashMap->buckets[index]->val = (char *)malloc(sizeof(strlen(val) + 1));
        strcpy(hashMap->buckets[index]->val, val);
        hashMap->buckets[index]->val[strlen(val)] = '\0';
        return;
    }
    // If the key-value pair does not exist, add the key-value pair
    Pair *pair = (Pair *)malloc(sizeof(Pair));
    pair->key = key;
    pair->val = (char *)malloc(sizeof(strlen(val) + 1));
    strcpy(pair->val, val);
    pair->val[strlen(val)] = '\0';

    hashMap->buckets[index] = pair;
    hashMap->size++;
}

/* Remove operation */
void removeItem(HashMapOpenAddressing *hashMap, int key) {
    // Search for the bucket index corresponding to key
    int index = findBucket(hashMap, key);
    // If the key-value pair is found, cover it with a removal mark
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        Pair *pair = hashMap->buckets[index];
        free(pair->val);
        free(pair);
        hashMap->buckets[index] = hashMap->TOMBSTONE;
        hashMap->size--;
    }
}

/* Extend hash table */
void extend(HashMapOpenAddressing *hashMap) {
    // Temporarily store the original hash table
    Pair **bucketsTmp = hashMap->buckets;
    int oldCapacity = hashMap->capacity;
    // Initialize the extended new hash table
    hashMap->capacity *= hashMap->extendRatio;
    hashMap->buckets = (Pair **)malloc(sizeof(Pair *) * hashMap->capacity);
    hashMap->size = 0;
    // Move key-value pairs from the original hash table to the new hash table
    for (int i = 0; i < oldCapacity; i++) {
        Pair *pair = bucketsTmp[i];
        if (pair != NULL && pair != hashMap->TOMBSTONE) {
            put(hashMap, pair->key, pair->val);
            free(pair->val);
            free(pair);
        }
    }
    free(bucketsTmp);
}

/* Print hash table */
void print(HashMapOpenAddressing *hashMap) {
    for (int i = 0; i < hashMap->capacity; i++) {
        Pair *pair = hashMap->buckets[i];
        if (pair == NULL) {
            printf("NULL\n");
        } else if (pair == hashMap->TOMBSTONE) {
            printf("TOMBSTONE\n");
        } else {
            printf("%d -> %s\n", pair->key, pair->val);
        }
    }
}

/* Driver Code */
int main() {
    // Initialize hash table
    HashMapOpenAddressing *hashmap = newHashMapOpenAddressing();

    // Add operation
    // Add key-value pair (key, val) to the hash table
    put(hashmap, 12836, "Ha");
    put(hashmap, 15937, "Luo");
    put(hashmap, 16750, "Suan");
    put(hashmap, 13276, "Fa");
    put(hashmap, 10583, "Ya");
    printf("\nAfter adding, the hashtable is\nKey -> Value\n");
    print(hashmap);

    // Query operation
    // Enter key to the hash table, get value val
    char *name = get(hashmap, 13276);
    printf("\nInput student ID 13276, found name %s\n", name);

    // Remove operation
    // Remove key-value pair (key, val) from the hash table
    removeItem(hashmap, 16750);
    printf("\nAfter removing 16750, the hashtable is\nKey -> Value\n");
    print(hashmap);

    // Destroy hashtable
    delHashMapOpenAddressing(hashmap);
    return 0;
}
