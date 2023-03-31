/**
 * File: array_hash_map.c
 * Created Time: 2023-03-18
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../include/include.h"

/* 字符串拷贝函数 */
static char *xstrdup(const char *s) {
  char *t;
  size_t len;
  if (!s)
    return NULL;

  len = strlen(s) + 1;
  t = (char *)malloc(len);
  if (t) {
    memcpy(t, s, len);
  }
  return t;
}

/* 扩大哈希表容量 */
static int hash_map_grow(hash_map_t *d) {
  char **new_val;
  long *new_key;
  ssize_t i, cur_size;

  cur_size = d->size * 2;
  new_val = (char **)calloc(cur_size, sizeof *d->val);
  new_key = (long *)calloc(cur_size, sizeof *d->key);
  if (!new_val || !new_key) {
    /* 若内存分配失败，则退出 */
    if (new_val)
      free(new_val);
    if (new_key)
      free(new_key);
    return -1;
  }

  /* 设置默认键 */
  for (i = 0; i < cur_size; i++) {
    d->key[i] = HASH_MAP_DEFAULT_KEY;
  }

  /* 拷贝原哈希表所有键值对 */
  memcpy(new_val, d->val, d->size * sizeof(char *));
  memcpy(new_key, d->key, d->size * sizeof(long));
  /* 删除原哈希表 */
  free(d->val);
  free(d->key);
  /* 更新哈希表 */
  d->size = cur_size;
  d->val = new_val;
  d->key = new_key;
  return 0;
}

/* 创建新的哈希表 */
hash_map_t *new_hash_map(size_t size) {
  hash_map_t *d;
  ssize_t i;

  /* 如果没有指定哈希表大小，则使用默认大小 */
  if (size < HASH_MAP_MIN_SIZE)
    size = HASH_MAP_MIN_SIZE;

  d = (hash_map_t *)calloc(1, sizeof *d);

  if (d) {
    d->size = size;
    d->val = (char **)calloc(size, sizeof *d->val);
    d->key = (long *)calloc(size, sizeof *d->key);
    /* 设置默认键 */
    for (i = 0; i < d->size; i++) {
      d->key[i] = HASH_MAP_DEFAULT_KEY;
    }
  }
  return d;
}

/* 查询操作 */
const char *get(const hash_map_t *d, const long key, const char *def) {
  ssize_t i;

  for (i = 0; i < d->size; i++) {
    /* Compare key */
    if (key == d->key[i]) {
      return d->val[i];
    }
  }
  return def;
}

/* 添加操作 */
int put(hash_map_t *d, const long key, const char *val) {
  ssize_t i;

  if (d == NULL)
    return -1;

  /* 查找是否已经有相同键的键值对 */
  if (d->n > 0) {
    for (i = 0; i < d->size; i++) {
      if (key == d->key[i]) {
        /* 存在相同键，直接更新值 */
        if (d->val[i] != NULL)
          free(d->val[i]);
        d->val[i] = (val ? xstrdup(val) : NULL);
        return 0;
      }
    }
  }

  /* 添加新的值，需要检验是否需要扩大哈希表 */
  if (d->n == d->size) {
    /* 达到哈希表允许的最大大小 */
    if (hash_map_grow(d) != 0)
      return -1;
  }

  for (i = d->n; d->key[i] != HASH_MAP_DEFAULT_KEY;) {
    if (++i == d->size)
      i = 0;
  }
  /* 设置键值对 */
  d->key[i] = key;
  d->val[i] = (val ? xstrdup(val) : NULL);
  d->n++;
  return 0;
}

/* 删除操作 */
void remove_item(hash_map_t *d, const long key) {
  ssize_t i;

  if (d == NULL) {
    return;
  }

  for (i = 0; i < d->size; i++) {
    /* 对比键 */
    if (key == d->key[i]) {
      break;
    }
  }
  if (i >= d->size)
    /* 没有找到键 */
    return;

  d->key[i] = HASH_MAP_DEFAULT_KEY;
  if (d->val[i] != NULL) {
    free(d->val[i]);
    d->val[i] = NULL;
  }
  d->n--;
  return;
}

/* 删除哈希表 */
void del(hash_map_t *d) {
  ssize_t i;

  if (d == NULL)
    return;
  for (i = 0; i < d->size; i++) {
    if (d->val[i] != NULL)
      free(d->val[i]);
  }
  free(d->val);
  free(d->key);
  free(d);
  return;
}

/* 打印哈希表 */
void print(hash_map_t *d) {
  int i;
  for (i = 0; i < d->n; i++) {
    printf("%ld -> %s\n", d->key[i], d->val[i]);
  }
}

int main() {
  /* 初始化哈希表 */
  hash_map_t *map = new_hash_map(4);

  /* 添加操作 */
  // 在哈希表中添加键值对 (key, value)
  put(map, 12836, "小哈");
  put(map, 15937, "小啰");
  put(map, 16750, "小算");
  put(map, 13276, "小法");
  put(map, 10583, "小鸭");
  printf("\n添加完成后，哈希表为\nKey -> Value\n");
  print(map);

  /* 查询操作 */
  // 向哈希表输入键 key ，得到值 value
  const char *name = get(map, 15937, "NULL");
  printf("\n输入学号 15937 ，查询到姓名 %s\n", name);

  /* 删除操作 */
  // 在哈希表中删除键值对 (key, value)
  remove_item(map, 10583);
  printf("\n删除 10583 后，哈希表为\nKey -> Value\n");
  print(map);

  /* 遍历哈希表 */
  int i;

  printf("\n遍历键值对 Key->Value\n");
  for (i = 0; i < map->n; i++) {
    printf("%ld -> %s\n", map->key[i], map->val[i]);
  }

  printf("\n单独遍历键 Key\n");
  for (i = 0; i < map->n; i++) {
    printf("%ld\n", map->key[i]);
  }

  printf("\n单独遍历键 Value\n");
  for (i = 0; i < map->n; i++) {
    printf("%s\n", map->val[i]);
  }
}