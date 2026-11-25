/**
 * File: hash_map_open_addressing.c
 * Created Time: 2023-10-6
 * Author: lclc6 (w1929522410@163.com)
 */

#include "../utils/common.h"

/* Хеш-таблица с открытой адресацией */
typedef struct {
    int key;
    char *val;
} Pair;

/* Хеш-таблица с открытой адресацией */
typedef struct {
    int size;         // Число пар «ключ — значение»
    int capacity;     // Ёмкость хеш-таблицы
    double loadThres; // Порог коэффициента заполнения для расширения
    int extendRatio;  // Во сколько раз увеличивается ёмкость
    Pair **buckets;   // Массив корзин
    Pair *TOMBSTONE;  // Метка удаления
} HashMapOpenAddressing;

// Объявления функций
void extend(HashMapOpenAddressing *hashMap);

/* Конструктор */
HashMapOpenAddressing *newHashMapOpenAddressing() {
    HashMapOpenAddressing *hashMap = (HashMapOpenAddressing *)malloc(sizeof(HashMapOpenAddressing));
    hashMap->size = 0;
    hashMap->capacity = 4;
    hashMap->loadThres = 2.0 / 3.0;
    hashMap->extendRatio = 2;
    hashMap->buckets = (Pair **)calloc(hashMap->capacity, sizeof(Pair *));
    hashMap->TOMBSTONE = (Pair *)malloc(sizeof(Pair));
    hashMap->TOMBSTONE->key = -1;
    hashMap->TOMBSTONE->val = "-1";

    return hashMap;
}

/* Деструктор */
void delHashMapOpenAddressing(HashMapOpenAddressing *hashMap) {
    for (int i = 0; i < hashMap->capacity; i++) {
        Pair *pair = hashMap->buckets[i];
        if (pair != NULL && pair != hashMap->TOMBSTONE) {
            free(pair->val);
            free(pair);
        }
    }
    free(hashMap->buckets);
    free(hashMap->TOMBSTONE);
    free(hashMap);
}

/* Хеш-функция */
int hashFunc(HashMapOpenAddressing *hashMap, int key) {
    return key % hashMap->capacity;
}

/* Коэффициент заполнения */
double loadFactor(HashMapOpenAddressing *hashMap) {
    return (double)hashMap->size / (double)hashMap->capacity;
}

/* Найти индекс корзины для ключа key */
int findBucket(HashMapOpenAddressing *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    int firstTombstone = -1;
    // Линейное пробирование до первой пустой корзины
    while (hashMap->buckets[index] != NULL) {
        // При совпадении ключа key вернуть индекс его корзины
        if (hashMap->buckets[index]->key == key) {
            // Если ранее встретилась метка удаления, переместить пару на её место
            if (firstTombstone != -1) {
                hashMap->buckets[firstTombstone] = hashMap->buckets[index];
                hashMap->buckets[index] = hashMap->TOMBSTONE;
                return firstTombstone; // Вернуть индекс корзины после перемещения
            }
            return index; // Вернуть индекс корзины
        }
        // Запомнить первую встретившуюся метку удаления
        if (firstTombstone == -1 && hashMap->buckets[index] == hashMap->TOMBSTONE) {
            firstTombstone = index;
        }
        // Вычислить индекс корзины, после конца массива перейти в начало
        index = (index + 1) % hashMap->capacity;
    }
    // Если ключа key нет, вернуть индекс для вставки
    return firstTombstone == -1 ? index : firstTombstone;
}

/* Поиск */
char *get(HashMapOpenAddressing *hashMap, int key) {
    // Найти индекс корзины для ключа key
    int index = findBucket(hashMap, key);
    // Если пара найдена, вернуть её значение val
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        return hashMap->buckets[index]->val;
    }
    // Если пары нет, вернуть пустую строку
    return "";
}

/* Вставка */
void put(HashMapOpenAddressing *hashMap, int key, char *val) {
    // Расширить таблицу, если коэффициент заполнения превысил порог
    if (loadFactor(hashMap) > hashMap->loadThres) {
        extend(hashMap);
    }
    // Найти индекс корзины для ключа key
    int index = findBucket(hashMap, key);
    // Если пара найдена, заменить val и завершить операцию
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        free(hashMap->buckets[index]->val);
        hashMap->buckets[index]->val = (char *)malloc(strlen(val) + 1);
        strcpy(hashMap->buckets[index]->val, val);
        hashMap->buckets[index]->val[strlen(val)] = '\0';
        return;
    }
    // Если пары нет, добавить её
    Pair *pair = (Pair *)malloc(sizeof(Pair));
    pair->key = key;
    pair->val = (char *)malloc(strlen(val) + 1);
    strcpy(pair->val, val);
    pair->val[strlen(val)] = '\0';

    hashMap->buckets[index] = pair;
    hashMap->size++;
}

/* Удаление */
void removeItem(HashMapOpenAddressing *hashMap, int key) {
    // Найти индекс корзины для ключа key
    int index = findBucket(hashMap, key);
    // Если пара найдена, заменить её меткой удаления
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        Pair *pair = hashMap->buckets[index];
        free(pair->val);
        free(pair);
        hashMap->buckets[index] = hashMap->TOMBSTONE;
        hashMap->size--;
    }
}

/* Расширить хеш-таблицу */
void extend(HashMapOpenAddressing *hashMap) {
    // Временно сохранить исходную хеш-таблицу
    Pair **bucketsTmp = hashMap->buckets;
    int oldCapacity = hashMap->capacity;
    // Создать новую таблицу увеличенной ёмкости
    hashMap->capacity *= hashMap->extendRatio;
    hashMap->buckets = (Pair **)calloc(hashMap->capacity, sizeof(Pair *));
    hashMap->size = 0;
    // Перенести пары из исходной таблицы в новую
    for (int i = 0; i < oldCapacity; i++) {
        Pair *pair = bucketsTmp[i];
        if (pair != NULL && pair != hashMap->TOMBSTONE) {
            put(hashMap, pair->key, pair->val);
            free(pair->val);
            free(pair);
        }
    }
    free(bucketsTmp);
}

/* Вывести хеш-таблицу */
void print(HashMapOpenAddressing *hashMap) {
    for (int i = 0; i < hashMap->capacity; i++) {
        Pair *pair = hashMap->buckets[i];
        if (pair == NULL) {
            printf("NULL\n");
        } else if (pair == hashMap->TOMBSTONE) {
            printf("TOMBSTONE\n");
        } else {
            printf("%d -> %s\n", pair->key, pair->val);
        }
    }
}

/* Демонстрационный код */
int main() {
    // Создать хеш-таблицу
    HashMapOpenAddressing *hashmap = newHashMapOpenAddressing();

    // Вставка
    // Добавить в таблицу пару (key, val)
    put(hashmap, 12836, "Сяо Ха");
    put(hashmap, 15937, "Сяо Ло");
    put(hashmap, 16750, "Сяо Суань");
    put(hashmap, 13276, "Сяо Фа");
    put(hashmap, 10583, "Сяо Я");
    printf("\nХеш-таблица после вставки:\nКлюч -> Значение\n");
    print(hashmap);

    // Поиск
    // Получить из таблицы значение val по ключу key
    char *name = get(hashmap, 13276);
    printf("\nИмя студента с номером 13276: %s\n", name);

    // Удаление
    // Удалить из таблицы пару (key, val)
    removeItem(hashmap, 16750);
    printf("\nХеш-таблица после удаления 16750:\nКлюч -> Значение\n");
    print(hashmap);

    // Уничтожить хеш-таблицу
    delHashMapOpenAddressing(hashmap);
    return 0;
}
