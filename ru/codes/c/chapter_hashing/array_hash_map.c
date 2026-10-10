/**
 * File: array_hash_map.c
 * Created Time: 2023-03-18
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* Размер хеш-таблицы по умолчанию */
#define MAX_SIZE 100

/* Пара ключ-значение int->string */
typedef struct {
    int key;
    char *val;
} Pair;

/* Набор пар ключ-значение */
typedef struct {
    void *set;
    int len;
} MapSet;

/* Хеш-таблица на основе массива */
typedef struct {
    Pair *buckets[MAX_SIZE];
} ArrayHashMap;

/* Конструктор */
ArrayHashMap *newArrayHashMap() {
    ArrayHashMap *hmap = malloc(sizeof(ArrayHashMap));
    for (int i=0; i < MAX_SIZE; i++) {
        hmap->buckets[i] = NULL;
    }
    return hmap;
}

/* Деструктор */
void delArrayHashMap(ArrayHashMap *hmap) {
    for (int i = 0; i < MAX_SIZE; i++) {
        if (hmap->buckets[i] != NULL) {
            free(hmap->buckets[i]->val);
            free(hmap->buckets[i]);
        }
    }
    free(hmap);
}

/* Хеш-функция */
int hashFunc(int key) {
    int index = key % MAX_SIZE;
    return index;
}

/* Операция поиска */
const char *get(const ArrayHashMap *hmap, const int key) {
    int index = hashFunc(key);
    const Pair *Pair = hmap->buckets[index];
    if (Pair == NULL)
        return NULL;
    return Pair->val;
}

/* Операция добавления */
void put(ArrayHashMap *hmap, const int key, const char *val) {
    Pair *Pair = malloc(sizeof(Pair));
    Pair->key = key;
    Pair->val = malloc(strlen(val) + 1);
    strcpy(Pair->val, val);

    int index = hashFunc(key);
    hmap->buckets[index] = Pair;
}

/* Операция удаления */
void removeItem(ArrayHashMap *hmap, const int key) {
    int index = hashFunc(key);
    free(hmap->buckets[index]->val);
    free(hmap->buckets[index]);
    hmap->buckets[index] = NULL;
}

/* Получить все пары ключ-значение */
void pairSet(ArrayHashMap *hmap, MapSet *set) {
    Pair *entries;
    int i = 0, index = 0;
    int total = 0;
    /* Подсчитать число действительных пар ключ-значение */
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

/* Получить все ключи */
void keySet(ArrayHashMap *hmap, MapSet *set) {
    int *keys;
    int i = 0, index = 0;
    int total = 0;
    /* Подсчитать число действительных пар ключ-значение */
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

/* Получить все значения */
void valueSet(ArrayHashMap *hmap, MapSet *set) {
    char **vals;
    int i = 0, index = 0;
    int total = 0;
    /* Подсчитать число действительных пар ключ-значение */
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

/* Вывести хеш-таблицу */
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

/* Driver Code */
int main() {
    /* Инициализация хеш-таблицы */
    ArrayHashMap *hmap = newArrayHashMap();

    /* Операция добавления */
    // Добавить пару (key, value) в хеш-таблицу
    put(hmap, 12836, "Сяо Ха");
    put(hmap, 15937, "Сяо Ло");
    put(hmap, 16750, "Сяо Суань");
    put(hmap, 13276, "Сяо Фа");
    put(hmap, 10583, "Сяо Я");
    printf("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение\n");
    print(hmap);

    /* Операция поиска */
    // Ввести в хеш-таблицу ключ key и получить значение value
    const char *name = get(hmap, 15937);
    printf("\nДля студенческого номера 15937 найдено имя %s\n", name);

    /* Операция удаления */
    // Удалить пару (key, value) из хеш-таблицы
    removeItem(hmap, 10583);
    printf("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение\n");
    print(hmap);

    /* Обход хеш-таблицы */
    int i;

    printf("\nОтдельный обход пар ключ-значение\n");
    print(hmap);

    MapSet set;

    keySet(hmap, &set);
    int *keys = (int *)set.set;
    printf("\nОтдельный обход ключей\n");
    for (i = 0; i < set.len; i++) {
        printf("%d\n", keys[i]);
    }
    free(set.set);

    valueSet(hmap, &set);
    char **vals = (char **)set.set;
    printf("\nОбход только значений Value\n");
    for (i = 0; i < set.len; i++) {
        printf("%s\n", vals[i]);
    }
    free(set.set);

    delArrayHashMap(hmap);
    return 0;
}
