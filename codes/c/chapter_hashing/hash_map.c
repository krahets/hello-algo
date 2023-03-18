/**
 * File: hash_map.c
 * Created Time: 2023-03-18
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../include/include.h"

/**
  @brief    Duplicate a string
  @param    s String to duplicate
  @return   Pointer to a newly allocated string, to be freed with free()
 */
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

/**
  @brief    Double the size of the hash_map
  @param    d Hash_map to grow
  @return   This function returns non-zero in case of failure
 */
/*--------------------------------------------------------------------------*/
static int hash_map_grow(hash_map_t *d) {
  char **new_val;
  long *new_key;
  ssize_t i, cur_size;

  cur_size = d->size * 2;
  new_val = (char **)calloc(cur_size, sizeof *d->val);
  new_key = (long *)calloc(cur_size, sizeof *d->key);
  if (!new_val || !new_key) {
    /* An allocation failed, leave the hash_map unchanged */
    if (new_val)
      free(new_val);
    if (new_key)
      free(new_key);
    return -1;
  }

  /* Set default key */
  for (i = 0; i < cur_size; i++) {
    d->key[i] = HASH_MAP_DEFAULT_KEY;
  }

  /* Initialize the newly allocated space */
  memcpy(new_val, d->val, d->size * sizeof(char *));
  memcpy(new_key, d->key, d->size * sizeof(long));
  /* Delete previous data */
  free(d->val);
  free(d->key);
  /* Actually update the hash_map */
  d->size = cur_size;
  d->val = new_val;
  d->key = new_key;
  return 0;
}

/**
  @brief    Create a new hash_map object.
  @param    size    Optional initial size of the hash_map.
  @return   1 newly allocated hash_map objet.
 */
hash_map_t *new_hash_map(size_t size) {
  hash_map_t *d;
  ssize_t i;

  /* If no size was specified, allocate space for HASH_MAP_MIN_SIZE */
  if (size < HASH_MAP_MIN_SIZE)
    size = HASH_MAP_MIN_SIZE;

  d = (hash_map_t *)calloc(1, sizeof *d);

  if (d) {
    d->size = size;
    d->val = (char **)calloc(size, sizeof *d->val);
    d->key = (long *)calloc(size, sizeof *d->key);
    /* Set default key */
    for (i = 0; i < d->size; i++) {
      d->key[i] = HASH_MAP_DEFAULT_KEY;
    }
  }
  return d;
}

/**
  @brief    Delete a hash_map object
  @param    d   hash_map object to deallocate.
  @return   void
 */
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

/**
  @brief    Get a value from a hash_map.
  @param    d       hash_map object to search.
  @param    key     Key to look for in the hash_map.
  @param    def     Default value to return if key not found.
  @return   1 pointer to internally allocated character string.
 */
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

/**
  @brief    Put a value in a hash_map.
  @param    d       hash_map object to modify.
  @param    key     Key to modify or add.
  @param    val     Value to add.
  @return   int     0 if Ok, anything else otherwise
 */
int put(hash_map_t *d, const long key, const char *val) {
  ssize_t i;

  if (d == NULL)
    return -1;

  /* Find if value is already in hash_map */
  if (d->n > 0) {
    for (i = 0; i < d->size; i++) {
      if (key == d->key[i]) { /* Same key */
        /* Found a value: modify and return */
        if (d->val[i] != NULL)
          free(d->val[i]);
        d->val[i] = (val ? xstrdup(val) : NULL);
        /* Value has been modified: return */
        return 0;
      }
    }
  }

  /* Add a new value */
  /* See if hash_map needs to grow */
  if (d->n == d->size) {
    /* Reached maximum size: reallocate hash_map */
    if (hash_map_grow(d) != 0)
      return -1;
  }

  /* Insert key in the first empty slot. Start at d->n and wrap at
     d->size. Because d->n < d->size this will necessarily
     terminate. */
  for (i = d->n; d->key[i] != HASH_MAP_DEFAULT_KEY;) {
    if (++i == d->size)
      i = 0;
  }
  /* Copy key */
  d->key[i] = key;
  d->val[i] = (val ? xstrdup(val) : NULL);
  d->n++;
  return 0;
}

/**
  @brief    Delete a key in a hash_map
  @param    d       hash_map object to modify.
  @param    key     Key to remove.
  @return   void
 */
void remove_item(hash_map_t *d, const long key) {
  ssize_t i;

  if (d == NULL) {
    return;
  }

  for (i = 0; i < d->size; i++) {
    /* Compare key */
    if (key == d->key[i]) {
      /* Found key */
      break;
    }
  }
  if (i >= d->size)
    /* Key not found */
    return;

  d->key[i] = HASH_MAP_DEFAULT_KEY;
  if (d->val[i] != NULL) {
    free(d->val[i]);
    d->val[i] = NULL;
  }
  d->n--;
  return;
}

/**
  @brief    Show a hash_map object
  @param    d       hash_map object to show.
  @return   void
 */
void show_map(hash_map_t *d) {
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
  show_map(map);

  /* 查询操作 */
  // 向哈希表输入键 key ，得到值 value
  const char *name = get(map, 15937, "NULL");
  printf("\n输入学号 15937 ，查询到姓名 %s\n", name);

  /* 删除操作 */
  // 在哈希表中删除键值对 (key, value)
  remove_item(map, 10583);
  printf("\n删除 10583 后，哈希表为\nKey -> Value\n");
  show_map(map);

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