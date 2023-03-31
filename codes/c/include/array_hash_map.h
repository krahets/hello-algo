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

/* 哈希表默认数组大小 */
# define HASH_MAP_DEFAULT_SIZE 100

/* 键值对 int->string */
typedef struct  {
	int key;
	char *val;
} entry_t;

/* 基于数组简易实现的哈希表 */
typedef struct {
  // 初始化数组，包含 100 个桶
	entry_t buckets[HASH_MAP_DEFAULT_SIZE]; /** Entries in hash_map */
} array_hash_map_t;

/* 用于表示键值对、键、值的集合 */
typedef struct {
	void *set;
	int len;
} set_t;

/* 哈希表初始化函数 */
array_hash_map_t *new_hash_map();

/* 哈希函数 */
int hash_func(int key);

/* 查询操作 */
const char *get(const array_hash_map_t *d, const int key);

/* 添加操作 */
void put(array_hash_map_t *d, const int key, const char *val);

/* 删除操作 */
void del(array_hash_map_t *d);

/* 获取所有键值对 */
void remove_item(array_hash_map_t *d, const int key);

/* 获取所有键值对 */
void entry_set(array_hash_map_t *d, set_t *set);

/* 获取所有键 */
void key_set(array_hash_map_t *d, set_t *set);

/* 获取所有值 */
void val_set(array_hash_map_t *d, set_t *set);

/* 打印哈希表 */
void print(array_hash_map_t *d);

#ifdef __cplusplus
}
#endif

# endif