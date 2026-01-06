/**
 * File: hash_map_open_addressing.c
 * Created Time: 2023-10-6
 * Author: lclc6 (w1929522410@163.com)
 */

#include "../utils/common.h"

/* Hash table with open addressing */
typedef struct {
    int key;
    char *val;
} Pair;

/* Hash table with open addressing */
typedef struct {
    int size;         // Number of key-value pairs
    int capacity;     // Hash table capacity
    double loadThres; // Load factor threshold for triggering expansion
    int extendRatio;  // Expansion multiplier
    Pair **buckets;   // Bucket array
    Pair *TOMBSTONE;  // Removal marker
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
    hashMap->buckets = (Pair **)calloc(hashMap->capacity, sizeof(Pair *));
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

/* Search for bucket index corresponding to key */
int findBucket(HashMapOpenAddressing *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    int firstTombstone = -1;
    // Linear probing, break when encountering an empty bucket
    while (hashMap->buckets[index] != NULL) {
        // If key is encountered, return the corresponding bucket index
        if (hashMap->buckets[index]->key == key) {
            // If a removal marker was encountered before, move the key-value pair to that index
            if (firstTombstone != -1) {
                hashMap->buckets[firstTombstone] = hashMap->buckets[index];
                hashMap->buckets[index] = hashMap->TOMBSTONE;
                return firstTombstone; // Return the moved bucket index
            }
            return index; // Return bucket index
        }
        // Record the first removal marker encountered
        if (firstTombstone == -1 && hashMap->buckets[index] == hashMap->TOMBSTONE) {
            firstTombstone = index;
        }
        // Calculate bucket index, wrap around to the head if past the tail
        index = (index + 1) % hashMap->capacity;
    }
    // If key does not exist, return the index for insertion
    return firstTombstone == -1 ? index : firstTombstone;
}

/* Query operation */
char *get(HashMapOpenAddressing *hashMap, int key) {
    // Search for bucket index corresponding to key
    int index = findBucket(hashMap, key);
    // If key-value pair is found, return corresponding val
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        return hashMap->buckets[index]->val;
    }
    // Return empty string if key-value pair does not exist
    return "";
}

/* Add operation */
void put(HashMapOpenAddressing *hashMap, int key, char *val) {
    // When load factor exceeds threshold, perform expansion
    if (loadFactor(hashMap) > hashMap->loadThres) {
        extend(hashMap);
    }
    // Search for bucket index corresponding to key
    int index = findBucket(hashMap, key);
    // If key-value pair is found, overwrite val and return
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        free(hashMap->buckets[index]->val);
        hashMap->buckets[index]->val = (char *)malloc(sizeof(strlen(val) + 1));
        strcpy(hashMap->buckets[index]->val, val);
        hashMap->buckets[index]->val[strlen(val)] = '\0';
        return;
    }
    // If key-value pair does not exist, add the key-value pair
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
    // Search for bucket index corresponding to key
    int index = findBucket(hashMap, key);
    // If key-value pair is found, overwrite it with removal marker
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        Pair *pair = hashMap->buckets[index];
        free(pair->val);
        free(pair);
        hashMap->buckets[index] = hashMap->TOMBSTONE;
        hashMap->size--;
    }
}

/* Expand hash table */
void extend(HashMapOpenAddressing *hashMap) {
    // Temporarily store the original hash table
    Pair **bucketsTmp = hashMap->buckets;
    int oldCapacity = hashMap->capacity;
    // Initialize expanded new hash table
    hashMap->capacity *= hashMap->extendRatio;
    hashMap->buckets = (Pair **)calloc(hashMap->capacity, sizeof(Pair *));
    hashMap->size = 0;
    // Move key-value pairs from original hash table to new hash table
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
    put(hashmap, 12836, "Xiao Ha");
    put(hashmap, 15937, "Xiao Luo");
    put(hashmap, 16750, "Xiao Suan");
    put(hashmap, 13276, "Xiao Fa");
    put(hashmap, 10583, "Xiao Ya");
    printf("\nAfter addition, hash table is\nKey -> Value\n");
    print(hashmap);

    // Query operation
    // Input key into hash table to get value val
    char *name = get(hashmap, 13276);
    printf("\nInput student ID 13276, found name %s\n", name);

    // Remove operation
    // Remove key-value pair (key, val) from hash table
    removeItem(hashmap, 16750);
    printf("\nAfter deleting 16750, hash table is\nKey -> Value\n");
    print(hashmap);

    // Destroy hash table
    delHashMapOpenAddressing(hashmap);
    return 0;
}
