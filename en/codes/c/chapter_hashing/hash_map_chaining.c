/**
 * File: hash_map_chaining.c
 * Created Time: 2023-10-13
 * Author: SenMing (1206575349@qq.com), krahets (krahets@163.com)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Assume max length of val is 100
#define MAX_SIZE 100

/* Key-value pair */
typedef struct {
    int key;
    char val[MAX_SIZE];
} Pair;

/* Linked list node */
typedef struct Node {
    Pair *pair;
    struct Node *next;
} Node;

/* Chained address hash table */
typedef struct {
    int size;         // Number of key-value pairs
    int capacity;     // Hash table capacity
    double loadThres; // Load factor threshold for triggering expansion
    int extendRatio;  // Expansion multiplier
    Node **buckets;   // Bucket array
} HashMapChaining;

/* Constructor */
HashMapChaining *newHashMapChaining() {
    HashMapChaining *hashMap = (HashMapChaining *)malloc(sizeof(HashMapChaining));
    hashMap->size = 0;
    hashMap->capacity = 4;
    hashMap->loadThres = 2.0 / 3.0;
    hashMap->extendRatio = 2;
    hashMap->buckets = (Node **)malloc(hashMap->capacity * sizeof(Node *));
    for (int i = 0; i < hashMap->capacity; i++) {
        hashMap->buckets[i] = NULL;
    }
    return hashMap;
}

/* Destructor */
void delHashMapChaining(HashMapChaining *hashMap) {
    for (int i = 0; i < hashMap->capacity; i++) {
        Node *cur = hashMap->buckets[i];
        while (cur) {
            Node *tmp = cur;
            cur = cur->next;
            free(tmp->pair);
            free(tmp);
        }
    }
    free(hashMap->buckets);
    free(hashMap);
}

/* Hash function */
int hashFunc(HashMapChaining *hashMap, int key) {
    return key % hashMap->capacity;
}

/* Load factor */
double loadFactor(HashMapChaining *hashMap) {
    return (double)hashMap->size / (double)hashMap->capacity;
}

/* Query operation */
char *get(HashMapChaining *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    // Traverse the bucket, if the key is found, return the corresponding val
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            return cur->pair->val;
        }
        cur = cur->next;
    }
    return ""; // If key not found, return an empty string
}

/* Add operation */
void put(HashMapChaining *hashMap, int key, const char *val);

/* Extend hash table */
void extend(HashMapChaining *hashMap) {
    // Temporarily store the original hash table
    int oldCapacity = hashMap->capacity;
    Node **oldBuckets = hashMap->buckets;
    // Initialize the extended new hash table
    hashMap->capacity *= hashMap->extendRatio;
    hashMap->buckets = (Node **)malloc(hashMap->capacity * sizeof(Node *));
    for (int i = 0; i < hashMap->capacity; i++) {
        hashMap->buckets[i] = NULL;
    }
    hashMap->size = 0;
    // Move key-value pairs from the original hash table to the new hash table
    for (int i = 0; i < oldCapacity; i++) {
        Node *cur = oldBuckets[i];
        while (cur) {
            put(hashMap, cur->pair->key, cur->pair->val);
            Node *temp = cur;
            cur = cur->next;
            // Free memory
            free(temp->pair);
            free(temp);
        }
    }

    free(oldBuckets);
}

/* Add operation */
void put(HashMapChaining *hashMap, int key, const char *val) {
    // When the load factor exceeds the threshold, perform expansion
    if (loadFactor(hashMap) > hashMap->loadThres) {
        extend(hashMap);
    }
    int index = hashFunc(hashMap, key);
    // Traverse the bucket, if the specified key is encountered, update the corresponding val and return
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            strcpy(cur->pair->val, val); // If specified key encountered, update corresponding val and return
            return;
        }
        cur = cur->next;
    }
    // If no such key, add key-value pair at head of list
    Pair *newPair = (Pair *)malloc(sizeof(Pair));
    newPair->key = key;
    strcpy(newPair->val, val);
    Node *newNode = (Node *)malloc(sizeof(Node));
    newNode->pair = newPair;
    newNode->next = hashMap->buckets[index];
    hashMap->buckets[index] = newNode;
    hashMap->size++;
}

/* Remove operation */
void removeItem(HashMapChaining *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    Node *cur = hashMap->buckets[index];
    Node *pre = NULL;
    while (cur) {
        if (cur->pair->key == key) {
            // Remove key-value pair
            if (pre) {
                pre->next = cur->next;
            } else {
                hashMap->buckets[index] = cur->next;
            }
            // Free memory
            free(cur->pair);
            free(cur);
            hashMap->size--;
            return;
        }
        pre = cur;
        cur = cur->next;
    }
}

/* Print hash table */
void print(HashMapChaining *hashMap) {
    for (int i = 0; i < hashMap->capacity; i++) {
        Node *cur = hashMap->buckets[i];
        printf("[");
        while (cur) {
            printf("%d -> %s, ", cur->pair->key, cur->pair->val);
            cur = cur->next;
        }
        printf("]\n");
    }
}

/* Driver Code */
int main() {
    /* Initialize hash table */
    HashMapChaining *hashMap = newHashMapChaining();

    /* Add operation */
    // Add key-value pair (key, value) to the hash table
    put(hashMap, 12836, "Ha");
    put(hashMap, 15937, "Luo");
    put(hashMap, 16750, "Suan");
    put(hashMap, 13276, "Fa");
    put(hashMap, 10583, "Ya");
    printf("\nAfter adding, the hashtable is\nKey -> Value\n");
    print(hashMap);

    /* Query operation */
    // Enter key to the hash table, get value
    char *name = get(hashMap, 13276);
    printf("\nInput student ID 13276, found name %s\n", name);

    /* Remove operation */
    // Remove key-value pair (key, value) from the hash table
    removeItem(hashMap, 12836);
    printf("\nAfter removing student ID 12836, the hashtable is\nKey -> Value\n");
    print(hashMap);

    /* Free hashtable space */
    delHashMapChaining(hashMap);

    return 0;
}
