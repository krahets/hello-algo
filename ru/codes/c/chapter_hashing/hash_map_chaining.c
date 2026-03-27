/**
 * File: hash_map_chaining.c
 * Created Time: 2023-10-13
 * Author: SenMing (1206575349@qq.com), krahets (krahets@163.com)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Предположить, что максимальная длина val равна 100
#define MAX_SIZE 100

/* Пара ключ-значение */
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
    int size;         // Число пар ключ-значение
    int capacity;     // Вместимость хеш-таблицы
    double loadThres; // Порог коэффициента загрузки для запуска расширения
    int extendRatio;  // Коэффициент расширения
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

/* Коэффициент загрузки */
double loadFactor(HashMapChaining *hashMap) {
    return (double)hashMap->size / (double)hashMap->capacity;
}

/* Операция поиска */
char *get(HashMapChaining *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    // Обойти корзину; если найден key, вернуть соответствующее val
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            return cur->pair->val;
        }
        cur = cur->next;
    }
    return ""; // Если key не найден, вернуть пустую строку
}

/* Операция добавления */
void put(HashMapChaining *hashMap, int key, const char *val);

/* Расширить хеш-таблицу */
void extend(HashMapChaining *hashMap) {
    // Временно сохранить исходную хеш-таблицу
    int oldCapacity = hashMap->capacity;
    Node **oldBuckets = hashMap->buckets;
    // Инициализация новой хеш-таблицы после расширения
    hashMap->capacity *= hashMap->extendRatio;
    hashMap->buckets = (Node **)malloc(hashMap->capacity * sizeof(Node *));
    for (int i = 0; i < hashMap->capacity; i++) {
        hashMap->buckets[i] = NULL;
    }
    hashMap->size = 0;
    // Перенести пары ключ-значение из исходной хеш-таблицы в новую
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

/* Операция добавления */
void put(HashMapChaining *hashMap, int key, const char *val) {
    // Когда коэффициент загрузки превышает порог, выполнить расширение
    if (loadFactor(hashMap) > hashMap->loadThres) {
        extend(hashMap);
    }
    int index = hashFunc(hashMap, key);
    // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            strcpy(cur->pair->val, val); // Если встретился указанный key, обновить соответствующий val и вернуть
            return;
        }
        cur = cur->next;
    }
    // Если такого key нет, добавить пару ключ-значение в голову связного списка
    Pair *newPair = (Pair *)malloc(sizeof(Pair));
    newPair->key = key;
    strcpy(newPair->val, val);
    Node *newNode = (Node *)malloc(sizeof(Node));
    newNode->pair = newPair;
    newNode->next = hashMap->buckets[index];
    hashMap->buckets[index] = newNode;
    hashMap->size++;
}

/* Операция удаления */
void removeItem(HashMapChaining *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    Node *cur = hashMap->buckets[index];
    Node *pre = NULL;
    while (cur) {
        if (cur->pair->key == key) {
            // Удалить из него пару ключ-значение
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

/* Driver Code */
int main() {
    /* Инициализация хеш-таблицы */
    HashMapChaining *hashMap = newHashMapChaining();

    /* Операция добавления */
    // Добавить пару (key, value) в хеш-таблицу
    put(hashMap, 12836, "Сяо Ха");
    put(hashMap, 15937, "Сяо Ло");
    put(hashMap, 16750, "Сяо Суань");
    put(hashMap, 13276, "Сяо Фа");
    put(hashMap, 10583, "Сяо Я");
    printf("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение\n");
    print(hashMap);

    /* Операция поиска */
    // Ввести в хеш-таблицу ключ key и получить значение value
    char *name = get(hashMap, 13276);
    printf("\nДля студенческого номера 13276 найдено имя %s\n", name);

    /* Операция удаления */
    // Удалить пару (key, value) из хеш-таблицы
    removeItem(hashMap, 12836);
    printf("\nПосле удаления студенческого номера 12836 хеш-таблица имеет вид\nКлюч -> Значение\n");
    print(hashMap);

    /* Освободить память хеш-таблицы */
    delHashMapChaining(hashMap);

    return 0;
}
