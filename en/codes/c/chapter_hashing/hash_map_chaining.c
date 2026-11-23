/**
 * File: hash_map_chaining.c
 * Created Time: 2023-10-13
 * Author: SenMing (1206575349@qq.com), krahets (krahets@163.com)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Assume val has a maximum length of 100
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

/* Hash table with separate chaining */
typedef struct {
    int size;         // Number of key-value pairs
    int capacity;     // Hash table capacity
    double loadThres; // Load factor threshold that triggers capacity growth
    int extendRatio;  // Capacity growth factor
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

/* Lookup operation */
char *get(HashMapChaining *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    // Traverse the bucket; if key is found, return its corresponding val
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            return cur->pair->val;
        }
        cur = cur->next;
    }
    return ""; // Return an empty string if key is not found
}

/* Insert operation */
void put(HashMapChaining *hashMap, int key, const char *val);

/* Grow the hash table capacity */
void extend(HashMapChaining *hashMap) {
    // Keep a reference to the original hash table
    int oldCapacity = hashMap->capacity;
    Node **oldBuckets = hashMap->buckets;
    // Initialize a new hash table with the expanded capacity
    hashMap->capacity *= hashMap->extendRatio;
    hashMap->buckets = (Node **)malloc(hashMap->capacity * sizeof(Node *));
    for (int i = 0; i < hashMap->capacity; i++) {
        hashMap->buckets[i] = NULL;
    }
    hashMap->size = 0;
    // Move the key-value pairs from the original hash table to the new one
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

/* Insert operation */
void put(HashMapChaining *hashMap, int key, const char *val) {
    // Grow the capacity when the load factor exceeds the threshold
    if (loadFactor(hashMap) > hashMap->loadThres) {
        extend(hashMap);
    }
    int index = hashFunc(hashMap, key);
    // Traverse the bucket; if the specified key is found, update its val and return
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            strcpy(cur->pair->val, val); // If the specified key is found, update its val and return
            return;
        }
        cur = cur->next;
    }
    // If key is absent, add the key-value pair at the head of the linked list
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
            // Remove the key-value pair from the list
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

/* Print the hash table */
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

/* Driver code */
int main() {
    /* Initialize the hash table */
    HashMapChaining *hashMap = newHashMapChaining();

    /* Insert operation */
    // Insert the key-value pair (key, value) into the hash table
    put(hashMap, 12836, "小哈");
    put(hashMap, 15937, "小啰");
    put(hashMap, 16750, "小算");
    put(hashMap, 13276, "小法");
    put(hashMap, 10583, "小鸭");
    printf("\nHash table after insertion:\nKey -> Value\n");
    print(hashMap);

    /* Lookup operation */
    // Look up key in the hash table to obtain value
    char *name = get(hashMap, 13276);
    printf("\nLook up student ID 13276; name found: %s\n", name);

    /* Remove operation */
    // Remove the key-value pair (key, value) from the hash table
    removeItem(hashMap, 12836);
    printf("\nHash table after removing student ID 12836:\nKey -> Value\n");
    print(hashMap);

    /* Free the hash table's memory */
    delHashMapChaining(hashMap);

    return 0;
}
