/**
 * File: hash_map_open_addressing.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

/* Хеш-таблица с открытой адресацией */
class HashMapOpenAddressing {
    private int size; // Число пар «ключ — значение»
    private int capacity = 4; // Ёмкость хеш-таблицы
    private final double loadThres = 2.0 / 3.0; // Порог коэффициента заполнения для расширения
    private final int extendRatio = 2; // Во сколько раз увеличивается ёмкость
    private Pair[] buckets; // Массив корзин
    private final Pair TOMBSTONE = new Pair(-1, "-1"); // Метка удаления

    /* Конструктор */
    public HashMapOpenAddressing() {
        size = 0;
        buckets = new Pair[capacity];
    }

    /* Хеш-функция */
    private int hashFunc(int key) {
        return key % capacity;
    }

    /* Коэффициент заполнения */
    private double loadFactor() {
        return (double) size / capacity;
    }

    /* Найти индекс корзины для ключа key */
    private int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // Линейное пробирование до первой пустой корзины
        while (buckets[index] != null) {
            // При совпадении ключа key вернуть индекс его корзины
            if (buckets[index].key == key) {
                // Если ранее встретилась метка удаления, переместить пару на её место
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // Вернуть индекс корзины после перемещения
                }
                return index; // Вернуть индекс корзины
            }
            // Запомнить первую встретившуюся метку удаления
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // Вычислить индекс корзины, после конца массива перейти в начало
            index = (index + 1) % capacity;
        }
        // Если ключа key нет, вернуть индекс для вставки
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* Поиск */
    public String get(int key) {
        // Найти индекс корзины для ключа key
        int index = findBucket(key);
        // Если пара найдена, вернуть её значение val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // Если пары нет, вернуть null
        return null;
    }

    /* Вставка */
    public void put(int key, String val) {
        // Расширить таблицу, если коэффициент заполнения превысил порог
        if (loadFactor() > loadThres) {
            extend();
        }
        // Найти индекс корзины для ключа key
        int index = findBucket(key);
        // Если пара найдена, заменить val и завершить операцию
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index].val = val;
            return;
        }
        // Если пары нет, добавить её
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* Удаление */
    public void remove(int key) {
        // Найти индекс корзины для ключа key
        int index = findBucket(key);
        // Если пара найдена, заменить её меткой удаления
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* Расширить хеш-таблицу */
    private void extend() {
        // Временно сохранить исходную хеш-таблицу
        Pair[] bucketsTmp = buckets;
        // Создать новую таблицу увеличенной ёмкости
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // Перенести пары из исходной таблицы в новую
        for (Pair pair : bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair.val);
            }
        }
    }

    /* Вывести хеш-таблицу */
    public void print() {
        for (Pair pair : buckets) {
            if (pair == null) {
                System.out.println("null");
            } else if (pair == TOMBSTONE) {
                System.out.println("TOMBSTONE");
            } else {
                System.out.println(pair.key + " -> " + pair.val);
            }
        }
    }
}

public class hash_map_open_addressing {
    public static void main(String[] args) {
        // Создать хеш-таблицу
        HashMapOpenAddressing hashmap = new HashMapOpenAddressing();

        // Вставка
        // Добавить в таблицу пару (key, val)
        hashmap.put(12836, "Сяо Ха");
        hashmap.put(15937, "Сяо Ло");
        hashmap.put(16750, "Сяо Суань");
        hashmap.put(13276, "Сяо Фа");
        hashmap.put(10583, "Сяо Я");
        System.out.println("\nХеш-таблица после вставки:\nКлюч -> Значение");
        hashmap.print();

        // Поиск
        // Получить из таблицы значение val по ключу key
        String name = hashmap.get(13276);
        System.out.println("\nИмя студента с номером 13276: " + name);

        // Удаление
        // Удалить из таблицы пару (key, val)
        hashmap.remove(16750);
        System.out.println("\nХеш-таблица после удаления 16750:\nКлюч -> Значение");
        hashmap.print();
    }
}
