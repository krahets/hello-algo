/**
 * File: hash_map_chaining.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.ArrayList;
import java.util.List;

/* Хеш-таблица с цепочками */
class HashMapChaining {
    int size; // Число пар «ключ — значение»
    int capacity; // Ёмкость хеш-таблицы
    double loadThres; // Порог коэффициента заполнения для расширения
    int extendRatio; // Во сколько раз увеличивается ёмкость
    List<List<Pair>> buckets; // Массив корзин

    /* Конструктор */
    public HashMapChaining() {
        size = 0;
        capacity = 4;
        loadThres = 2.0 / 3.0;
        extendRatio = 2;
        buckets = new ArrayList<>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.add(new ArrayList<>());
        }
    }

    /* Хеш-функция */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* Коэффициент заполнения */
    double loadFactor() {
        return (double) size / capacity;
    }

    /* Поиск */
    String get(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // Обойти корзину и при совпадении ключа key вернуть соответствующее значение val
        for (Pair pair : bucket) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // Если ключ key не найден, вернуть null
        return null;
    }

    /* Вставка */
    void put(int key, String val) {
        // Расширить таблицу, если коэффициент заполнения превысил порог
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // Обойти корзину. Если найден ключ key, обновить val и завершить операцию
        for (Pair pair : bucket) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // Если ключа key нет, добавить пару в конец списка
        Pair pair = new Pair(key, val);
        bucket.add(pair);
        size++;
    }

    /* Удаление */
    void remove(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // Обойти корзину и удалить из неё нужную пару
        for (Pair pair : bucket) {
            if (pair.key == key) {
                bucket.remove(pair);
                size--;
                break;
            }
        }
    }

    /* Расширить хеш-таблицу */
    void extend() {
        // Временно сохранить исходную хеш-таблицу
        List<List<Pair>> bucketsTmp = buckets;
        // Создать новую таблицу увеличенной ёмкости
        capacity *= extendRatio;
        buckets = new ArrayList<>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.add(new ArrayList<>());
        }
        size = 0;
        // Перенести пары из исходной таблицы в новую
        for (List<Pair> bucket : bucketsTmp) {
            for (Pair pair : bucket) {
                put(pair.key, pair.val);
            }
        }
    }

    /* Вывести хеш-таблицу */
    void print() {
        for (List<Pair> bucket : buckets) {
            List<String> res = new ArrayList<>();
            for (Pair pair : bucket) {
                res.add(pair.key + " -> " + pair.val);
            }
            System.out.println(res);
        }
    }
}

public class hash_map_chaining {
    public static void main(String[] args) {
        /* Создать хеш-таблицу */
        HashMapChaining map = new HashMapChaining();

        /* Вставка */
        // Добавить в таблицу пару (key, value)
        map.put(12836, "Сяо Ха");
        map.put(15937, "Сяо Ло");
        map.put(16750, "Сяо Суань");
        map.put(13276, "Сяо Фа");
        map.put(10583, "Сяо Я");
        System.out.println("\nХеш-таблица после вставки:\nКлюч -> Значение");
        map.print();

        /* Поиск */
        // Получить из таблицы значение value по ключу key
        String name = map.get(13276);
        System.out.println("\nИмя студента с номером 13276: " + name);

        /* Удаление */
        // Удалить из таблицы пару (key, value)
        map.remove(12836);
        System.out.println("\nХеш-таблица после удаления 12836:\nКлюч -> Значение");
        map.print();
    }
}
