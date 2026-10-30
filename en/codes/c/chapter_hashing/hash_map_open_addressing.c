/**
 * File: hash_map_open_addressing.c
 * Created Time: 2023-10-6
 * Author: lclc6 (w1929522410@163.com)
 */

#include "../utils/common.h"

/* Key-value pair */
typedef struct {
    int key;
    char *val;
} Pair;

/* Hash table with open addressing */
typedef struct {
    int size;         // Number of key-value pairs
    int capacity;     // Hash table capacity
    double loadThres; // Load factor threshold that triggers capacity growth
    int extendRatio;  // Capacity growth factor
    Pair **buckets;   // Bucket array
    Pair *TOMBSTONE;  // Tombstone marker
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

/* Find the bucket index for key */
int findBucket(HashMapOpenAddressing *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    int firstTombstone = -1;
    // Probe linearly until an empty bucket is reached
    while (hashMap->buckets[index] != NULL) {
        // If key is found, return its bucket index
        if (hashMap->buckets[index]->key == key) {
            // If a tombstone was encountered earlier, move the key-value pair to that index
            if (firstTombstone != -1) {
                hashMap->buckets[firstTombstone] = hashMap->buckets[index];
                hashMap->buckets[index] = hashMap->TOMBSTONE;
                return firstTombstone; // Return the bucket index after the move
            }
            return index; // Return the bucket index
        }
        // Record the first tombstone encountered
        if (firstTombstone == -1 && hashMap->buckets[index] == hashMap->TOMBSTONE) {
            firstTombstone = index;
        }
        // Calculate the bucket index, wrapping to the beginning after the end
        index = (index + 1) % hashMap->capacity;
    }
    // If key is absent, return the index for insertion
    return firstTombstone == -1 ? index : firstTombstone;
}

/* Lookup operation */
char *get(HashMapOpenAddressing *hashMap, int key) {
    // Find the bucket index for key
    int index = findBucket(hashMap, key);
    // If the key-value pair is found, return its val
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        return hashMap->buckets[index]->val;
    }
    // Return an empty string if the key-value pair does not exist
    return "";
}

/* Insert operation */
void put(HashMapOpenAddressing *hashMap, int key, char *val) {
    // Grow the capacity when the load factor exceeds the threshold
    if (loadFactor(hashMap) > hashMap->loadThres) {
        extend(hashMap);
    }
    // Find the bucket index for key
    int index = findBucket(hashMap, key);
    // If the key-value pair is found, overwrite val and return
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        free(hashMap->buckets[index]->val);
        hashMap->buckets[index]->val = (char *)malloc(sizeof(strlen(val) + 1));
        strcpy(hashMap->buckets[index]->val, val);
        hashMap->buckets[index]->val[strlen(val)] = '\0';
        return;
    }
    // If the key-value pair is absent, insert it
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
    // Find the bucket index for key
    int index = findBucket(hashMap, key);
    // If the key-value pair is found, replace it with a tombstone
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        Pair *pair = hashMap->buckets[index];
        free(pair->val);
        free(pair);
        hashMap->buckets[index] = hashMap->TOMBSTONE;
        hashMap->size--;
    }
}

/* Grow the hash table capacity */
void extend(HashMapOpenAddressing *hashMap) {
    // Keep a reference to the original hash table
    Pair **bucketsTmp = hashMap->buckets;
    int oldCapacity = hashMap->capacity;
    // Initialize a new hash table with the expanded capacity
    hashMap->capacity *= hashMap->extendRatio;
    hashMap->buckets = (Pair **)calloc(hashMap->capacity, sizeof(Pair *));
    hashMap->size = 0;
    // Move the key-value pairs from the original hash table to the new one
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

/* Print the hash table */
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

/* Driver code */
int main() {
    // Initialize the hash table
    HashMapOpenAddressing *hashmap = newHashMapOpenAddressing();

    // Insert operation
    // Insert the key-value pair (key, val) into the hash table
    put(hashmap, 12836, "小哈");
    put(hashmap, 15937, "小啰");
    put(hashmap, 16750, "小算");
    put(hashmap, 13276, "小法");
    put(hashmap, 10583, "小鸭");
    printf("\nHash table after insertion:\nKey -> Value\n");
    print(hashmap);

    // Lookup operation
    // Look up key in the hash table to obtain val
    char *name = get(hashmap, 13276);
    printf("\nLook up student ID 13276; name found: %s\n", name);

    // Remove operation
    // Remove the key-value pair (key, val) from the hash table
    removeItem(hashmap, 16750);
    printf("\nHash table after removing 16750:\nKey -> Value\n");
    print(hashmap);

    // Destroy the hash table
    delHashMapOpenAddressing(hashmap);
    return 0;
}
