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
# define HASH_MAP_MIN_SIZE 128

/** Default key in a hash map */
# define HASH_MAP_DEFAULT_KEY - 1

/**
  @brief    Hash_map object
*/
typedef struct _hash_map_ {
	int n; /** Number of entries in hash_map */
	ssize_t size; /** Storage size */
	char * * val; /** List of string values */
	long * key; /** List of int keys */
}
hash_map_t;

/**
  @brief    Create a new hash_map object.
  @param    size    Optional initial size of the hash_map.
  @return   1 newly allocated hash_map objet.
*/
hash_map_t * new_hash_map(size_t size);

/**
  @brief    Delete a hash_map object
  @param    d   hash_map object to deallocate.
  @return   void
*/
void del(hash_map_t * d);

/**
  @brief    Get a value from a hash_map.
  @param    d       hash_map object to search.
  @param    key     Key to look for in the hash_map.
  @param    def     Default value to return if key not found.
  @return   1 pointer to internally allocated character string.
*/
const char * get(const hash_map_t * d, const long key, const char * def);

/**
  @brief    Put a value in a hash_map.
  @param    d       hash_map object to modify.
  @param    key     Key to modify or add.
  @param    val     Value to add.
  @return   int     0 if Ok, anything else otherwise
*/
int put(hash_map_t * d, const long key, const char * val);

/**
  @brief    Delete a key in a hash_map
  @param    d       hash_map object to modify.
  @param    key     Key to remove.
  @return   void
*/
void remove_item(hash_map_t * d, const long key);

/**
  @brief    Show a hash_map object
  @param    d       hash_map object to show.
  @return   void
*/
void show_map(hash_map_t * d);

#ifdef __cplusplus
}
#endif

# endif