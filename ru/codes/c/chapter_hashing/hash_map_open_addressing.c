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
    int size;         // Число пар ключ-значение
    int capacity;     // Вместимость хеш-таблицы
    double loadThres; // Порог коэффициента загрузки для запуска расширения
    int extendRatio;  // Коэффициент расширения
    Pair **buckets;   // Массив корзин
    Pair *TOMBSTONE;  // Удалить метку
} HashMapOpenAddressing;

// Объявление функции
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

/* Коэффициент загрузки */
double loadFactor(HashMapOpenAddressing *hashMap) {
    return (double)hashMap->size / (double)hashMap->capacity;
}

/* Найти индекс корзины, соответствующий key */
int findBucket(HashMapOpenAddressing *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    int firstTombstone = -1;
    // Выполнять линейное пробирование и завершить при встрече с пустой корзиной
    while (hashMap->buckets[index] != NULL) {
        // Если встретился key, вернуть соответствующий индекс корзины
        if (hashMap->buckets[index]->key == key) {
            // Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
            if (firstTombstone != -1) {
                hashMap->buckets[firstTombstone] = hashMap->buckets[index];
                hashMap->buckets[index] = hashMap->TOMBSTONE;
                return firstTombstone; // Вернуть индекс корзины после перемещения
            }
            return index; // Вернуть индекс корзины
        }
        // Записать первую встретившуюся метку удаления
        if (firstTombstone == -1 && hashMap->buckets[index] == hashMap->TOMBSTONE) {
            firstTombstone = index;
        }
        // Вычислить индекс корзины; при выходе за конец вернуться к началу
        index = (index + 1) % hashMap->capacity;
    }
    // Если key не существует, вернуть индекс точки добавления
    return firstTombstone == -1 ? index : firstTombstone;
}

/* Операция поиска */
char *get(HashMapOpenAddressing *hashMap, int key) {
    // Найти индекс корзины, соответствующий key
    int index = findBucket(hashMap, key);
    // Если пара ключ-значение найдена, вернуть соответствующее val
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        return hashMap->buckets[index]->val;
    }
    // Если пары ключ-значение не существует, вернуть пустую строку
    return "";
}

/* Операция добавления */
void put(HashMapOpenAddressing *hashMap, int key, char *val) {
    // Когда коэффициент загрузки превышает порог, выполнить расширение
    if (loadFactor(hashMap) > hashMap->loadThres) {
        extend(hashMap);
    }
    // Найти индекс корзины, соответствующий key
    int index = findBucket(hashMap, key);
    // Если пара ключ-значение найдена, перезаписать val и вернуть
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        free(hashMap->buckets[index]->val);
        hashMap->buckets[index]->val = (char *)malloc(sizeof(strlen(val) + 1));
        strcpy(hashMap->buckets[index]->val, val);
        hashMap->buckets[index]->val[strlen(val)] = '\0';
        return;
    }
    // Если пары ключ-значение нет, добавить ее
    Pair *pair = (Pair *)malloc(sizeof(Pair));
    pair->key = key;
    pair->val = (char *)malloc(sizeof(strlen(val) + 1));
    strcpy(pair->val, val);
    pair->val[strlen(val)] = '\0';

    hashMap->buckets[index] = pair;
    hashMap->size++;
}

/* Операция удаления */
void removeItem(HashMapOpenAddressing *hashMap, int key) {
    // Найти индекс корзины, соответствующий key
    int index = findBucket(hashMap, key);
    // Если пара ключ-значение найдена, заменить ее меткой удаления
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
    // Инициализация новой хеш-таблицы после расширения
    hashMap->capacity *= hashMap->extendRatio;
    hashMap->buckets = (Pair **)calloc(hashMap->capacity, sizeof(Pair *));
    hashMap->size = 0;
    // Перенести пары ключ-значение из исходной хеш-таблицы в новую
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

/* Driver Code */
int main() {
    // Инициализация хеш-таблицы
    HashMapOpenAddressing *hashmap = newHashMapOpenAddressing();

    // Операция добавления
    // Добавить пару (key, val) в хеш-таблицу
    put(hashmap, 12836, "Сяо Ха");
    put(hashmap, 15937, "Сяо Ло");
    put(hashmap, 16750, "Сяо Суань");
    put(hashmap, 13276, "Сяо Фа");
    put(hashmap, 10583, "Сяо Я");
    printf("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение\n");
    print(hashmap);

    // Операция поиска
    // Передать ключ key в хеш-таблицу и получить значение val
    char *name = get(hashmap, 13276);
    printf("\nДля студенческого номера 13276 найдено имя %s\n", name);

    // Операция удаления
    // Удалить пару (key, val) из хеш-таблицы
    removeItem(hashmap, 16750);
    printf("\nПосле удаления 16750 хеш-таблица имеет вид\nКлюч -> Значение\n");
    print(hashmap);

    // Уничтожить хеш-таблицу
    delHashMapOpenAddressing(hashmap);
    return 0;
}
