/**
 * File: arrayhashing.c
 * Created Time: 2022-12-20
 * Author: MolDuM (moldum@163.com)
 */

#include "../include/include.h"

#define HASHTABLE_SIZE 1000

/* 键值对 int->str */
typedef struct
{
    int key;
    char *val;
} entry_t;

/* 基于数组简易实现的哈希表 */
typedef struct
{
    entry_t table[HASHTABLE_SIZE];
    int size;
} hashtable_t;

/* 哈希函数 */
static int hashing_function(int input)
{
    return abs(input) % HASHTABLE_SIZE;
}

/* 构造 Hashtable */
hashtable_t *hashtable_create()
{
    hashtable_t *hashtable = (hashtable_t *)malloc(sizeof(hashtable_t));
    if (hashtable == NULL)
    {
        fprintf(stderr, "Failed to allocate memory for hashtable\n");
        exit(1);
    }
    for (int i = 0; i < HASHTABLE_SIZE; i++)
    {
        hashtable->table[i].key = -1;
        hashtable->table[i].val = NULL;
    }
    hashtable->size = 0;
    return hashtable;
}

/* 添加操作 */
void hashtable_put(hashtable_t *hashtable, int key, char *val)
{
    int index = hashing_function(key);
    hashtable->table[index].key = key;
    hashtable->table[index].val = val;
    hashtable->size++;
}

/* 查询操作 */
char *hashtable_get(hashtable_t *hashtable, int key)
{
    int index = hashing_function(key);
    if (hashtable->table[index].key == key)
    {
        return hashtable->table[index].val;
    }
    return NULL;
}

/* 删除操作 */
void hashtable_remove(hashtable_t *hashtable, int key)
{
    int index = hashing_function(key);
    hashtable->table[index].key = -1;
    hashtable->table[index].val = NULL;
    hashtable->size--;
}

/* 获取所有键 */
int *hashtable_keyset(hashtable_t *ht, int *num_keys)
{
    int *keys = (int *)malloc(ht->size * sizeof(int));
    if (keys == NULL)
    {
        printf("Failed to allocate memory for keys array.\n");
        exit(1);
    }

    *num_keys = 0;
    for (int i = 0; i < HASHTABLE_SIZE; i++)
    {
        if (ht->table[i].key != -1)
        {
            keys[*num_keys] = ht->table[i].key;
            (*num_keys)++;
        }
    }
    return keys;
}

/* 获取所有值 */
char **hashtable_valueset(hashtable_t *ht, int *num_values)
{
    char **values = (char **)malloc(ht->size * sizeof(char *));
    if (values == NULL)
    {
        printf("Failed to allocate memory for values array.\n");
        exit(1);
    }
    int cnt = 0;
    for (int i = 0; i < HASHTABLE_SIZE; i++)
    {
        if (ht->table[i].val != NULL)
        {
            values[cnt++] = strdup(ht->table[i].val);
        }
    }
    *num_values = cnt;
    return values;
}

/* 获取所有键值对 */
entry_t *hashtable_entryset(hashtable_t *ht, int *num_elements)
{
    entry_t *elements = (entry_t *)malloc(ht->size * sizeof(entry_t));
    if (elements == NULL)
    {
        printf("Error: Failed to allocate memory for elements\n");
        exit(EXIT_FAILURE);
    }
    int cnt = 0;
    for (int i = 0; i < HASHTABLE_SIZE; i++)
    {
        if (ht->table[i].key != -1)
        {
            elements[cnt++] = ht->table[i];
        }
    }
    *num_elements = cnt;
    return elements;
}

/* 打印哈希表 */
void hashtable_print(hashtable_t *hashtable)
{
    int num_elems;
    entry_t *elems = hashtable_entryset(hashtable, &num_elems);
    for (int i = 0; i < num_elems; i++)
    {
        printf("\n%d -> %s", elems[i].key, elems[i].val);
    }
    printf("\n");
    free(elems);
}

/* 释放内存 */
void hashtable_destroy(hashtable_t *hashtable)
{
    free(hashtable);
}

int main()
{
    /* 初始化哈希表 */
    hashtable_t *hashtable = hashtable_create();

    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    hashtable_put(hashtable, 12836, "小哈");
    hashtable_put(hashtable, 15937, "小啰");
    hashtable_put(hashtable, 16750, "小算");
    hashtable_put(hashtable, 13276, "小法");
    hashtable_put(hashtable, 10583, "小鸭");
    printf("\n添加完成后，哈希表为\nKey -> Value");
    hashtable_print(hashtable);

    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    printf("\n输入学号 15937 ，查询到姓名 %s\n", hashtable_get(hashtable, 15937));

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    hashtable_remove(hashtable, 10583);
    printf("\n删除 10583 后，哈希表为\nKey -> Value");
    hashtable_print(hashtable);

    /* 遍历哈希表 */
    printf("\n单独遍历键 Key\n");
    int num_keys;
    int *keyset = hashtable_keyset(hashtable, &num_keys);
    for (int i = 0; i < num_keys; i++)
    {
        printf("%d\n", keyset[i]);
    }
    free(keyset);

    printf("\n单独遍历值 Value\n");
    int num_values;
    char **values = hashtable_valueset(hashtable, &num_values);
    for (int i = 0; i < num_values; i++)
    {
        printf("%s\n", values[i]);
    }
    printf("\n");
    // 释放动态分配的内存
    for (int i = 0; i < num_values; i++)
    {
        free(values[i]);
    }
    free(values);

    hashtable_destroy(hashtable);
    return 0;
}