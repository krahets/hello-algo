/**
 * File: array_hash_map.java
 * Created Time: 2022-12-04
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.*;

/* пара ключ-значение */
class Pair {
    public int key;
    public String val;

    public Pair(int key, String val) {
        this.key = key;
        this.val = val;
    }
}

/* Хеш-таблица на основе массива */
class ArrayHashMap {
    private List<Pair> buckets;

    public ArrayHashMap() {
        // Инициализировать массив, содержащий 100 бакетов
        buckets = new ArrayList<>();
        for (int i = 0; i < 100; i++) {
            buckets.add(null);
        }
    }

    /* Хеш-функция */
    private int hashFunc(int key) {
        int index = key % 100;
        return index;
    }

    /* Операция поиска */
    public String get(int key) {
        int index = hashFunc(key);
        Pair pair = buckets.get(index);
        if (pair == null)
            return null;
        return pair.val;
    }

    /* Операция добавления */
    public void put(int key, String val) {
        Pair pair = new Pair(key, val);
        int index = hashFunc(key);
        buckets.set(index, pair);
    }

    /* Операция удаления */
    public void remove(int key) {
        int index = hashFunc(key);
        // Установить null, обозначая удаление
        buckets.set(index, null);
    }

    /* Получить все пары ключ-значение */
    public List<Pair> pairSet() {
        List<Pair> pairSet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                pairSet.add(pair);
        }
        return pairSet;
    }

    /* Получить все ключи */
    public List<Integer> keySet() {
        List<Integer> keySet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                keySet.add(pair.key);
        }
        return keySet;
    }

    /* Получить все значения */
    public List<String> valueSet() {
        List<String> valueSet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                valueSet.add(pair.val);
        }
        return valueSet;
    }

    /* Вывести хеш-таблицу */
    public void print() {
        for (Pair kv : pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
    }
}

public class array_hash_map {
    public static void main(String[] args) {
        /* Инициализировать хеш-таблицу */
        ArrayHashMap map = new ArrayHashMap();

        /* Операция добавления */
        // Добавить в хеш-таблицу пару ключ-значение (key, value)
        map.put(12836, "Сяо Ха");
        map.put(15937, "Сяо Ло");
        map.put(16750, "Сяо Суань");
        map.put(13276, "Сяо Фа");
        map.put(10583, "Утенок");
        System.out.println("\nПосле добавления хеш-таблица выглядит так\nKey -> Value");
        map.print();

        /* Операция поиска */
        // Передать ключ key в хеш-таблицу и получить значение value
        String name = map.get(15937);
        System.out.println("\nПо номеру студента 15937 найдено имя " + name);

        /* Операция удаления */
        // Удалить из хеш-таблицы пару ключ-значение (key, value)
        map.remove(10583);
        System.out.println("\nПосле удаления 10583 хеш-таблица выглядит так\nKey -> Value");
        map.print();

        /* Перебрать хеш-таблицу */
        System.out.println("\nПеребираем пары Key->Value");
        for (Pair kv : map.pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
        System.out.println("\nОтдельно перебираем ключи Key");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\nОтдельно перебираем значения Value");
        for (String val : map.valueSet()) {
            System.out.println(val);
        }
    }
}
