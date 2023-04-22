/**
 * File: array_hash_map.h
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
} Entry;

/* 基于数组简易实现的哈希表 */
typedef struct {
    Entry *buckets[HASH_MAP_DEFAULT_SIZE];
} ArrayHashMap;

/* 用于表示键值对、键、值的集合 */
typedef struct {
    void *set;
    int len;
} MapSet;

/* 哈希表初始化函数 */
ArrayHashMap *newArrayHashMap();

/* 哈希函数 */
int hashFunc(int key);

/* 查询操作 */
const char *get(const ArrayHashMap *d, const int key);

/* 添加操作 */
void put(ArrayHashMap *d, const int key, const char *val);

/* 删除操作 */
void del(ArrayHashMap *d);

/* 获取所有键值对 */
void removeItem(ArrayHashMap *d, const int key);

/* 获取所有键值对 */
void entrySet(ArrayHashMap *d, MapSet *set);

/* 获取所有键 */
void keySet(ArrayHashMap *d, MapSet *set);

/* 获取所有值 */
void valueSet(ArrayHashMap *d, MapSet *set);

/* 打印哈希表 */
void print(ArrayHashMap *d);

#ifdef __cplusplus
}
#endif

# endif