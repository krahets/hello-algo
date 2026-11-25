/**
 * File: array_hash_map.c
 * Created Time: 2023-03-18
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* Default hash table size */
#define MAX_SIZE 100

/* Key-value pair: int->string */
typedef struct {
    int key;
    char *val;
} Pair;

/* Collection of key-value pairs */
typedef struct {
    void *set;
    int len;
} MapSet;

/* Array-based hash table */
typedef struct {
    Pair *buckets[MAX_SIZE];
} ArrayHashMap;

/* Constructor */
ArrayHashMap *newArrayHashMap() {
    ArrayHashMap *hmap = malloc(sizeof(ArrayHashMap));
    for (int i=0; i < MAX_SIZE; i++) {
        hmap->buckets[i] = NULL;
    }
    return hmap;
}

/* Destructor */
void delArrayHashMap(ArrayHashMap *hmap) {
    for (int i = 0; i < MAX_SIZE; i++) {
        if (hmap->buckets[i] != NULL) {
            free(hmap->buckets[i]->val);
            free(hmap->buckets[i]);
        }
    }
    free(hmap);
}

/* Hash function */
int hashFunc(int key) {
    int index = key % MAX_SIZE;
    return index;
}

/* Look up a value */
const char *get(const ArrayHashMap *hmap, const int key) {
    int index = hashFunc(key);
    const Pair *Pair = hmap->buckets[index];
    if (Pair == NULL)
        return NULL;
    return Pair->val;
}

/* Insert a key-value pair */
void put(ArrayHashMap *hmap, const int key, const char *val) {
    Pair *pair = malloc(sizeof(Pair));
    pair->key = key;
    pair->val = malloc(strlen(val) + 1);
    strcpy(pair->val, val);

    int index = hashFunc(key);
    hmap->buckets[index] = pair;
}

/* Remove a key-value pair */
void removeItem(ArrayHashMap *hmap, const int key) {
    int index = hashFunc(key);
    free(hmap->buckets[index]->val);
    free(hmap->buckets[index]);
    hmap->buckets[index] = NULL;
}

/* Get all key-value pairs */
void pairSet(ArrayHashMap *hmap, MapSet *set) {
    Pair *entries;
    int i = 0, index = 0;
    int total = 0;
    /* Count the occupied entries */
    for (i = 0; i < MAX_SIZE; i++) {
        if (hmap->buckets[i] != NULL) {
            total++;
        }
    }
    entries = malloc(sizeof(Pair) * total);
    for (i = 0; i < MAX_SIZE; i++) {
        if (hmap->buckets[i] != NULL) {
            entries[index].key = hmap->buckets[i]->key;
            entries[index].val = malloc(strlen(hmap->buckets[i]->val) + 1);
            strcpy(entries[index].val, hmap->buckets[i]->val);
            index++;
        }
    }
    set->set = entries;
    set->len = total;
}

/* Get all keys */
void keySet(ArrayHashMap *hmap, MapSet *set) {
    int *keys;
    int i = 0, index = 0;
    int total = 0;
    /* Count the occupied entries */
    for (i = 0; i < MAX_SIZE; i++) {
        if (hmap->buckets[i] != NULL) {
            total++;
        }
    }
    keys = malloc(total * sizeof(int));
    for (i = 0; i < MAX_SIZE; i++) {
        if (hmap->buckets[i] != NULL) {
            keys[index] = hmap->buckets[i]->key;
            index++;
        }
    }
    set->set = keys;
    set->len = total;
}

/* Get all values */
void valueSet(ArrayHashMap *hmap, MapSet *set) {
    char **vals;
    int i = 0, index = 0;
    int total = 0;
    /* Count the occupied entries */
    for (i = 0; i < MAX_SIZE; i++) {
        if (hmap->buckets[i] != NULL) {
            total++;
        }
    }
    vals = malloc(total * sizeof(char *));
    for (i = 0; i < MAX_SIZE; i++) {
        if (hmap->buckets[i] != NULL) {
            vals[index] = hmap->buckets[i]->val;
            index++;
        }
    }
    set->set = vals;
    set->len = total;
}

/* Print the hash table */
void print(ArrayHashMap *hmap) {
    int i;
    MapSet set;
    pairSet(hmap, &set);
    Pair *entries = (Pair *)set.set;
    for (i = 0; i < set.len; i++) {
        printf("%d -> %s\n", entries[i].key, entries[i].val);
    }
    free(set.set);
}

/* Driver code */
int main() {
    /* Initialize the hash table */
    ArrayHashMap *hmap = newArrayHashMap();

    /* Insert a key-value pair */
    // Insert the pair (key, value) into the hash table
    put(hmap, 12836, "Xiao Ha");
    put(hmap, 15937, "Xiao Luo");
    put(hmap, 16750, "Xiao Suan");
    put(hmap, 13276, "Xiao Fa");
    put(hmap, 10583, "Xiao Ya");
    printf("\nHash table after insertion:\nKey -> Value\n");
    print(hmap);

    /* Look up a value */
    // Look up key in the hash table to get value
    const char *name = get(hmap, 15937);
    printf("\nName for student ID 15937: %s\n", name);

    /* Remove a key-value pair */
    // Remove the pair (key, value) from the hash table
    removeItem(hmap, 10583);
    printf("\nHash table after removing 10583:\nKey -> Value\n");
    print(hmap);

    /* Iterate over the hash table */
    int i;

    printf("\nIterate over key-value pairs (Key->Value)\n");
    print(hmap);

    MapSet set;

    keySet(hmap, &set);
    int *keys = (int *)set.set;
    printf("\nIterate over keys only\n");
    for (i = 0; i < set.len; i++) {
        printf("%d\n", keys[i]);
    }
    free(set.set);

    valueSet(hmap, &set);
    char **vals = (char **)set.set;
    printf("\nIterate over values only\n");
    for (i = 0; i < set.len; i++) {
        printf("%s\n", vals[i]);
    }
    free(set.set);

    delArrayHashMap(hmap);
    return 0;
}
