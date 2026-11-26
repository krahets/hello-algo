/**
 * File: hash_map_chaining.c
 * Created Time: 2023-10-13
 * Author: SenMing (1206575349@qq.com), krahets (krahets@163.com)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Предполагаем, что длина val не превышает 100
#define MAX_SIZE 100

/* Пара «ключ — значение» */
typedef struct {
    int key;
    char val[MAX_SIZE];
} Pair;

/* Узел связного списка */
typedef struct Node {
    Pair *pair;
    struct Node *next;
} Node;

/* Хеш-таблица с цепочками */
typedef struct {
    int size;         // Число пар «ключ — значение»
    int capacity;     // Ёмкость хеш-таблицы
    double loadThres; // Порог коэффициента заполнения для расширения
    int extendRatio;  // Во сколько раз увеличивается ёмкость
    Node **buckets;   // Массив корзин
} HashMapChaining;

/* Конструктор */
HashMapChaining *newHashMapChaining() {
    HashMapChaining *hashMap = (HashMapChaining *)malloc(sizeof(HashMapChaining));
    hashMap->size = 0;
    hashMap->capacity = 4;
    hashMap->loadThres = 2.0 / 3.0;
    hashMap->extendRatio = 2;
    hashMap->buckets = (Node **)malloc(hashMap->capacity * sizeof(Node *));
    for (int i = 0; i < hashMap->capacity; i++) {
        hashMap->buckets[i] = NULL;
    }
    return hashMap;
}

/* Деструктор */
void delHashMapChaining(HashMapChaining *hashMap) {
    for (int i = 0; i < hashMap->capacity; i++) {
        Node *cur = hashMap->buckets[i];
        while (cur) {
            Node *tmp = cur;
            cur = cur->next;
            free(tmp->pair);
            free(tmp);
        }
    }
    free(hashMap->buckets);
    free(hashMap);
}

/* Хеш-функция */
int hashFunc(HashMapChaining *hashMap, int key) {
    return key % hashMap->capacity;
}

/* Коэффициент заполнения */
double loadFactor(HashMapChaining *hashMap) {
    return (double)hashMap->size / (double)hashMap->capacity;
}

/* Поиск */
char *get(HashMapChaining *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    // Обойти корзину и при совпадении ключа key вернуть соответствующее значение val
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            return cur->pair->val;
        }
        cur = cur->next;
    }
    return ""; // Если ключ key не найден, вернуть пустую строку
}

/* Вставка */
void put(HashMapChaining *hashMap, int key, const char *val);

/* Расширить хеш-таблицу */
void extend(HashMapChaining *hashMap) {
    // Временно сохранить исходную хеш-таблицу
    int oldCapacity = hashMap->capacity;
    Node **oldBuckets = hashMap->buckets;
    // Создать новую таблицу увеличенной ёмкости
    hashMap->capacity *= hashMap->extendRatio;
    hashMap->buckets = (Node **)malloc(hashMap->capacity * sizeof(Node *));
    for (int i = 0; i < hashMap->capacity; i++) {
        hashMap->buckets[i] = NULL;
    }
    hashMap->size = 0;
    // Перенести пары из исходной таблицы в новую
    for (int i = 0; i < oldCapacity; i++) {
        Node *cur = oldBuckets[i];
        while (cur) {
            put(hashMap, cur->pair->key, cur->pair->val);
            Node *temp = cur;
            cur = cur->next;
            // Освободить память
            free(temp->pair);
            free(temp);
        }
    }

    free(oldBuckets);
}

/* Вставка */
void put(HashMapChaining *hashMap, int key, const char *val) {
    // Расширить таблицу, если коэффициент заполнения превысил порог
    if (loadFactor(hashMap) > hashMap->loadThres) {
        extend(hashMap);
    }
    int index = hashFunc(hashMap, key);
    // Обойти корзину. Если найден ключ key, обновить val и завершить операцию
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            strcpy(cur->pair->val, val); // Если найден ключ key, обновить val и завершить операцию
            return;
        }
        cur = cur->next;
    }
    // Если ключа key нет, добавить пару в начало списка
    Pair *newPair = (Pair *)malloc(sizeof(Pair));
    newPair->key = key;
    strcpy(newPair->val, val);
    Node *newNode = (Node *)malloc(sizeof(Node));
    newNode->pair = newPair;
    newNode->next = hashMap->buckets[index];
    hashMap->buckets[index] = newNode;
    hashMap->size++;
}

/* Удаление */
void removeItem(HashMapChaining *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    Node *cur = hashMap->buckets[index];
    Node *pre = NULL;
    while (cur) {
        if (cur->pair->key == key) {
            // Удалить из списка пару «ключ — значение»
            if (pre) {
                pre->next = cur->next;
            } else {
                hashMap->buckets[index] = cur->next;
            }
            // Освободить память
            free(cur->pair);
            free(cur);
            hashMap->size--;
            return;
        }
        pre = cur;
        cur = cur->next;
    }
}

/* Вывести хеш-таблицу */
void print(HashMapChaining *hashMap) {
    for (int i = 0; i < hashMap->capacity; i++) {
        Node *cur = hashMap->buckets[i];
        printf("[");
        while (cur) {
            printf("%d -> %s, ", cur->pair->key, cur->pair->val);
            cur = cur->next;
        }
        printf("]\n");
    }
}

/* Демонстрационный код */
int main() {
    /* Создать хеш-таблицу */
    HashMapChaining *hashMap = newHashMapChaining();

    /* Вставка */
    // Добавить в таблицу пару (key, value)
    put(hashMap, 12836, "Сяо Ха");
    put(hashMap, 15937, "Сяо Ло");
    put(hashMap, 16750, "Сяо Суань");
    put(hashMap, 13276, "Сяо Фа");
    put(hashMap, 10583, "Сяо Я");
    printf("\nХеш-таблица после вставки:\nКлюч -> Значение\n");
    print(hashMap);

    /* Поиск */
    // Получить из таблицы значение value по ключу key
    char *name = get(hashMap, 13276);
    printf("\nИмя студента с номером 13276: %s\n", name);

    /* Удаление */
    // Удалить из таблицы пару (key, value)
    removeItem(hashMap, 12836);
    printf("\nХеш-таблица после удаления студента с номером 12836:\nКлюч -> Значение\n");
    print(hashMap);

    /* Освободить память хеш-таблицы */
    delHashMapChaining(hashMap);

    return 0;
}
