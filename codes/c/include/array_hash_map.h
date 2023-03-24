/**
 * File: hash_map.h
 * Created Time: 2023-03-18
 * Author: Guanngxu (446678850@qq.com)
 */

#ifndef _HASH_MAP_H_
#define _HASH_MAP_H_

#include <stdio.h> 
#include <stdlib.h> 
#include <string.h> 
#include <unistd.h>

#ifdef __cplusplus
extern "C" {
#endif

/** Minimal allocated number of entries in a hash map */
# define HASH_MAP_DEFAULT_SIZE 100

/**
  @brief    Hash_map entry
*/
typedef struct  {
	int key;
	char *val;
} entry_t;

/**
  @brief    Hash_map object
*/
typedef struct {
	entry_t buckets[HASH_MAP_DEFAULT_SIZE]; /** Entries in hash_map */
} array_hash_map_t;

/**
  @brief    KeySet、EntrySet、ValueSet object
*/
typedef struct {
	void *set;
	int len;
} set_t;

/**
  @brief    Create a new hash_map object.
  @param    size    Optional initial size of the hash_map.
  @return   1 newly allocated hash_map objet.
*/
array_hash_map_t *new_hash_map();

/**
  @brief    Compute hash.
  @param    key
  @return   computed result.
*/
int hash_func(int key);

/**
  @brief    Get a value from a hash_map.
  @param    d       hash_map object to search.
  @param    key     Key to look for in the hash_map.
  @return   1 pointer to internally allocated character string.
*/
const char *get(const array_hash_map_t *d, const int key);

/**
  @brief    Put a value in a hash_map.
  @param    d       hash_map object to modify.
  @param    key     Key to modify or add.
  @param    val     Value to add.
  @return   void
*/
void put(array_hash_map_t *d, const int key, const char *val);

/**
  @brief    Delete a hash_map object
  @param    d   hash_map object to deallocate.
  @return   void
*/
void del(array_hash_map_t *d);

/**
  @brief    Delete a key in a hash_map
  @param    d       hash_map object to modify.
  @param    key     Key to remove.
  @return   void
*/
void remove_item(array_hash_map_t *d, const int key);

/**
  @brief    Get entrySet from a hash_map
  @param    d       hash_map object.
  @param    set     entry_set to return.
  @return   void
 */
void entry_set(array_hash_map_t *d, set_t *set);

/**
  @brief    Get keySet from a hash_map
  @param    d       hash_map object.
  @param    set     key_set to return.
  @return   void
 */
void key_set(array_hash_map_t *d, set_t *set);

/**
  @brief    Get valSet from a hash_map
  @param    d       hash_map object.
  @param    set     val_set to return.
  @return   void
 */
void val_set(array_hash_map_t *d, set_t *set);

/**
  @brief    Show a hash_map object
  @param    d       hash_map object to show.
  @return   void
*/
void print(array_hash_map_t *d);

#ifdef __cplusplus
}
#endif

# endif