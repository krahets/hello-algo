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

/* 哈希表最小容量 */
#define HASH_MAP_MIN_SIZE 128

/* 哈希表默认 key */
#define HASH_MAP_DEFAULT_KEY -1

/* 基于数组简易实现的哈希表 */
typedef struct _hash_map_ {
  int n;        // 哈希表键值对数量
  ssize_t size; // 哈希表可用存储空间大小
  char **val;   // 哈希表值数组
  long *key;    // 哈希表键数组
} hash_map_t;

/* 创建新的哈希表 */
hash_map_t *new_hash_map(size_t size);

/* 查询操作 */
const char *get(const hash_map_t *d, const long key, const char *def);

/* 添加操作 */
int put(hash_map_t *d, const long key, const char *val);

/* 删除操作 */
void remove_item(hash_map_t *d, const long key);

/* 删除哈希表 */
void del(hash_map_t *d);

/* 打印哈希表 */
void print(hash_map_t *d);

#ifdef __cplusplus
}
#endif

#endif
