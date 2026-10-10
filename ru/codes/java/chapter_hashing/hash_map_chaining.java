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
    int size; // Число пар ключ-значение
    int capacity; // Вместимость хеш-таблицы
    double loadThres; // Порог коэффициента загрузки для запуска расширения
    int extendRatio; // Коэффициент расширения
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

    /* Коэффициент загрузки */
    double loadFactor() {
        return (double) size / capacity;
    }

    /* Операция поиска */
    String get(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // Обойти корзину; если найден key, вернуть соответствующее val
        for (Pair pair : bucket) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // Если key не найден, вернуть null
        return null;
    }

    /* Операция добавления */
    void put(int key, String val) {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
        for (Pair pair : bucket) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // Если такого key нет, добавить пару ключ-значение в конец
        Pair pair = new Pair(key, val);
        bucket.add(pair);
        size++;
    }

    /* Операция удаления */
    void remove(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // Обойти корзину и удалить из нее пару ключ-значение
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
        // Инициализация новой хеш-таблицы после расширения
        capacity *= extendRatio;
        buckets = new ArrayList<>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.add(new ArrayList<>());
        }
        size = 0;
        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
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
        /* Инициализация хеш-таблицы */
        HashMapChaining map = new HashMapChaining();

        /* Операция добавления */
        // Добавить пару (key, value) в хеш-таблицу
        map.put(12836, "Сяо Ха");
        map.put(15937, "Сяо Ло");
        map.put(16750, "Сяо Суань");
        map.put(13276, "Сяо Фа");
        map.put(10583, "Сяо Я");
        System.out.println("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение");
        map.print();

        /* Операция поиска */
        // Ввести в хеш-таблицу ключ key и получить значение value
        String name = map.get(13276);
        System.out.println("\nДля номера 13276 найдено имя " + name);

        /* Операция удаления */
        // Удалить пару (key, value) из хеш-таблицы
        map.remove(12836);
        System.out.println("\nПосле удаления 12836 хеш-таблица имеет вид\nКлюч -> Значение");
        map.print();
    }
}
