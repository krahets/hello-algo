/**
 * File: array_hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* Пара ключ-значение */
struct Pair {
  public:
    int key;
    string val;
    Pair(int key, string val) {
        this->key = key;
        this->val = val;
    }
};

/* Хеш-таблица на основе массива */
class ArrayHashMap {
  private:
    vector<Pair *> buckets;

  public:
    ArrayHashMap() {
        // Инициализировать массив, содержащий 100 корзин
        buckets = vector<Pair *>(100);
    }

    ~ArrayHashMap() {
        // Освободить память
        for (const auto &bucket : buckets) {
            delete bucket;
        }
        buckets.clear();
    }

    /* Хеш-функция */
    int hashFunc(int key) {
        int index = key % 100;
        return index;
    }

    /* Операция поиска */
    string get(int key) {
        int index = hashFunc(key);
        Pair *pair = buckets[index];
        if (pair == nullptr)
            return "";
        return pair->val;
    }

    /* Операция добавления */
    void put(int key, string val) {
        Pair *pair = new Pair(key, val);
        int index = hashFunc(key);
        buckets[index] = pair;
    }

    /* Операция удаления */
    void remove(int key) {
        int index = hashFunc(key);
        // Освободить память и присвоить nullptr
        delete buckets[index];
        buckets[index] = nullptr;
    }

    /* Получить все пары ключ-значение */
    vector<Pair *> pairSet() {
        vector<Pair *> pairSet;
        for (Pair *pair : buckets) {
            if (pair != nullptr) {
                pairSet.push_back(pair);
            }
        }
        return pairSet;
    }

    /* Получить все ключи */
    vector<int> keySet() {
        vector<int> keySet;
        for (Pair *pair : buckets) {
            if (pair != nullptr) {
                keySet.push_back(pair->key);
            }
        }
        return keySet;
    }

    /* Получить все значения */
    vector<string> valueSet() {
        vector<string> valueSet;
        for (Pair *pair : buckets) {
            if (pair != nullptr) {
                valueSet.push_back(pair->val);
            }
        }
        return valueSet;
    }

    /* Вывести хеш-таблицу */
    void print() {
        for (Pair *kv : pairSet()) {
            cout << kv->key << " -> " << kv->val << endl;
        }
    }
};

// Тестовые примеры см. в array_hash_map_test.cpp
