/**
 * File: arrayhashtable.c
 * Created Time: 2023-4-17
 * Author: AndreaJi (andrea.hb.ji@outlook.com)
 */

#include "../include/include.h"
#include "math.h"

#define HASHTABLE_SIZE 1000

#define DEFAULT_CAPACITY 3
#define DEFAULT_LOAD_FACTOR 0.75

/* 基于单链表的 HashTable 节点，键值对为 int->str*/
typedef struct entry_t
{
    int key;
    char *val;
    struct entry_t *next;
} entry_t;

/* 基于 Separate Chaining 实现的哈希表 */
typedef struct
{
    entry_t **table;
    int capacity, threshold, size;
    double max_load_factor;
} hashtable_t;

/* Linked List 操作*/
static void list_append(entry_t **head, entry_t *new)
{
    entry_t **indirect = head;
    while (*indirect)
        indirect = &((*indirect)->next);
    *indirect = new;
}

static char *list_remove(entry_t **head, entry_t *removal)
{
    if (*head == NULL || removal == NULL)
    {
        return NULL;
    }

    entry_t *current = *head;
    entry_t *prev = NULL;

    while (current != NULL && current != removal)
    {
        prev = current;
        current = current->next;
    }

    if (current == removal)
    {
        if (prev != NULL)
        {
            prev->next = current->next;
        }

        char *val = current->val;
        free(current);
        return val;
    }

    return NULL;
}

/* 根据 Key 值计算 hashcode */
static unsigned int key_hashcode(int key, int size)
{
    // 将 int 类型的 key 转换为无符号整数
    unsigned int u_key = (unsigned int)key;
    // 直接对无符号整数取模得到哈希码
    unsigned int hash = u_key % ++size;
    return hash;
}

/* 构造 Hashtable */
hashtable_t *hashtable_create(int capacity, double max_load_factor)
{
    if (capacity < 0)
    {
        printf("Illegal capacity\n");
        return NULL;
    }
    if (max_load_factor <= 0 ||
        max_load_factor != max_load_factor || // is not a number
        isinf(max_load_factor))               // is infinite
    {
        printf("Illegal max load factor\n");
        return NULL;
    }

    hashtable_t *hashtable = (hashtable_t *)malloc(sizeof(hashtable_t));
    if (hashtable == NULL)
    {
        printf("Memory allocation failed for hashtable\n");
        free(hashtable);
        return NULL;
    }
    hashtable->capacity = DEFAULT_CAPACITY > capacity ? DEFAULT_CAPACITY : capacity; // Max within DEFAULT_CAPACITY and capacity
    hashtable->max_load_factor = max_load_factor;
    hashtable->threshold = (int)(hashtable->capacity * hashtable->max_load_factor);
    hashtable->table = (entry_t **)malloc(hashtable->capacity * sizeof(entry_t *));
    if (hashtable->table == NULL)
    {
        printf("Memory allocation failed for hashtable_t->table\n");
        free(hashtable->table);
        free(hashtable);
        return NULL;
    }
    hashtable->size = 0;
    for (int i = 0; i < hashtable->capacity; i++)
        hashtable->table[i] = (entry_t *)malloc(sizeof(entry_t));
    return hashtable;
}

hashtable_t *hashtable_create2(int capacity)
{
    return hashtable_create(capacity, DEFAULT_LOAD_FACTOR);
}

hashtable_t *hashtable_create1()
{
    return hashtable_create(DEFAULT_CAPACITY, DEFAULT_LOAD_FACTOR);
}

// 释放哈希表的所有节点
void hashtable_clear(hashtable_t *ht)
{
    if (ht == NULL)
    {
        return;
    }
    for (int i = 0; i < ht->capacity; i++)
    {
        entry_t *current = ht->table[i]->next;
        while (current != NULL)
        {
            entry_t *next = current->next;
            current->next = NULL;
            free(current);
            current = next;
        }
        ht->table[i]->next = NULL;
    }
    ht->size = 0;
}

// 销毁哈希表
void hashtable_destroy(hashtable_t *ht)
{
    hashtable_clear(ht);
    free(ht->table);
    free(ht);
}

int hashtable_size(hashtable_t *hashtable)
{
    return hashtable->size;
}

bool hashtable_is_empty(hashtable_t *hashtable)
{
    return hashtable->size == 0;
}

static unsigned int normalize_index(hashtable_t *hashtable, int keyHash)
{
    return (keyHash & 0x7FFFFFFF) % hashtable->capacity;
}

static entry_t *bucket_seek_entry(hashtable_t *ht, unsigned int bucket_index, int key)
{
    if (key == 0)
        return NULL;
    entry_t *header = ht->table[bucket_index];
    if (header == NULL)
        return NULL;
    entry_t *entry = header->next;
    for (; entry != NULL; entry = entry->next)
        if (entry->key == key)
            return entry;
    return NULL;
}

bool has_key(hashtable_t *hashtable, int key)
{
    unsigned int bucket_index = normalize_index(hashtable, key_hashcode(key, hashtable->size));
    return bucket_seek_entry(hashtable, bucket_index, key) != NULL;
}

bool contains_key(hashtable_t *hashtable, int key)
{
    return has_key(hashtable, key);
}

static void resize_table(hashtable_t *ht)
{
    int oldcapacity = ht->capacity;
    ht->capacity *= 2;
    ht->threshold = (int)ht->capacity * ht->max_load_factor;

    entry_t **newtable = (entry_t **)malloc(ht->capacity * sizeof(entry_t *));
    if (newtable == NULL)
    {
        printf("Memory allocation failed for newtable\n");
        free(newtable);
        return;
    }
    for (int i = 0; i < ht->capacity; i++)
        newtable[i] = (entry_t *)malloc(sizeof(entry_t));
    for (int i = 0; i < oldcapacity; i++)
    {
        if (ht->table[i] != NULL)
        {
            entry_t *next = ht->table[i]->next;
            while (next != NULL)
            {
                unsigned int bucket_index = normalize_index(ht, key_hashcode(next->key, ht->size));
                entry_t *head = newtable[bucket_index];
                entry_t *entry = next;
                next = next->next;
                entry->next = NULL;
                list_append(&head, entry);
            }
        }
        ht->table[i]->next = NULL;
        free(ht->table[i]);
    }
    ht->table = newtable;
}

static char *bucket_insert_entry(hashtable_t *ht, int bucket_index, entry_t *entry)
{
    entry_t *header = ht->table[bucket_index];
    entry_t *existent_entry = bucket_seek_entry(ht, bucket_index, entry->key);
    if (existent_entry == NULL)
    {
        list_append(&header, entry);
        if (++(ht->size) > ht->threshold)
            resize_table(ht);
        return NULL;
    }
    else
    {
        char *oldval = existent_entry->val;
        existent_entry->val = entry->val;
        return oldval;
    }
}

/* 添加操作 */
char *hashtable_insert(hashtable_t *ht, int key, char *val)
{
    if (key == 0)
    {
        printf("Null key\n");
        return NULL;
    }

    entry_t *new_entry = (entry_t *)malloc(sizeof(entry_t));
    new_entry->key = key;
    new_entry->val = val;
    unsigned int bucket_index = normalize_index(ht, key_hashcode(key, ht->size));
    return bucket_insert_entry(ht, bucket_index, new_entry);
}

void hashtable_put(hashtable_t *ht, int key, char *val)
{
    hashtable_insert(ht, key, val);
}

/* 查询操作 */
char *hashtable_get(hashtable_t *ht, int key)
{
    if (key == 0)
    {
        printf("Null key\n");
        return NULL;
    }

    int bucket_index = normalize_index(ht, key_hashcode(key, ht->size));
    entry_t *entry = bucket_seek_entry(ht, bucket_index, key);
    if (entry != NULL)
        return entry->val;
    return NULL;
}

static char *bucket_remove_entry(hashtable_t *ht, unsigned int bucket_index, int key)
{
    entry_t *entry = bucket_seek_entry(ht, bucket_index, key);
    if (entry != NULL)
    {
        entry_t *header = ht->table[bucket_index];
        char *val = list_remove(&header, entry);
        --ht->size;
        return val;
    }
    else
    {
        return NULL;
    }
}

/* 删除操作 */
char *hashtable_remove(hashtable_t *ht, int key)
{
    if (key == 0)
    {
        printf("Null key\n");
        return NULL;
    }

    unsigned int bucket_index = normalize_index(ht, key_hashcode(key, ht->size));
    return bucket_remove_entry(ht, bucket_index, key);
}

/* 获取所有键 */
int *hashtable_keyset(hashtable_t *ht)
{
    int *keys = (int *)malloc(ht->size * sizeof(int));
    if (keys == NULL)
    {
        printf("Failed to allocate memory for keys array.\n");
        exit(1);
    }
    int cnt = 0;
    for (int i = 0; i < ht->capacity; i++)
    {
        entry_t *current = ht->table[i];
        while (current->next != NULL)
        {
            entry_t *next = current->next;
            keys[cnt++] = next->key;
            current = next;
        }
    }
    return keys;
}

/* 获取所有值 */
char **hashtable_valueset(hashtable_t *ht)
{
    char **values = (char **)malloc(ht->size * sizeof(char *));
    if (values == NULL)
    {
        printf("Failed to allocate memory for values array.\n");
        exit(1);
    }
    int cnt = 0;
    for (int i = 0; i < ht->capacity; i++)
    {
        entry_t *current = ht->table[i];
        while (current->next != NULL)
        {
            entry_t *next = current->next;
            values[cnt++] = strdup(next->val);
            current = next;
        }
    }
    return values;
}

/* 获取所有键值对 */
entry_t **hashtable_entryset(hashtable_t *ht)
{
    entry_t **entrys = (entry_t **)malloc(ht->size * sizeof(entry_t *));
    if (entrys == NULL)
    {
        printf("Failed to allocate memory for entrys array.\n");
        return NULL;
    }
    int cnt = 0;
    for (int i = 0; i < ht->capacity; i++)
    {
        entry_t *current = ht->table[i];
        while (current->next != NULL)
        {
            entry_t *next = current->next;
            entrys[cnt++] = next;
            current = next;
        }
    }
    return entrys;
}

/* 打印哈希表 */
void hashtable_print(hashtable_t *ht)
{
    if (ht == NULL)
    {
        return;
    }
    entry_t **entrys = hashtable_entryset(ht);
    for (int i = 0; i < ht->size; i++)
    {
        printf("\n%d -> %s", entrys[i]->key, entrys[i]->val);
    }
    printf("\n");
}

int main()
{
    /* 初始化哈希表 */
    hashtable_t *hashtable = hashtable_create1();

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
    int *keyset = hashtable_keyset(hashtable);
    for (int i = 0; i < hashtable->size; i++)
    {
        printf("%d\n", keyset[i]);
    }
    free(keyset);

    printf("\n单独遍历值 Value\n");
    char **values = hashtable_valueset(hashtable);
    for (int i = 0; i < hashtable->size; i++)
    {
        printf("%s\n", values[i]);
    }
    printf("\n");
    // 释放动态分配的内存
    for (int i = 0; i < hashtable->size; i++)
    {
        free(values[i]);
    }
    free(values);

    /* 清空操作 */
    hashtable_clear(hashtable);

    /* 销毁操作 */
    hashtable_destroy(hashtable);

    return 0;
}