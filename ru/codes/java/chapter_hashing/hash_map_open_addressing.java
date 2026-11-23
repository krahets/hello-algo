/**
 * File: hash_map_open_addressing.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

/* Хеш-таблица с открытой адресацией */
class HashMapOpenAddressing {
    private int size; // Число пар ключ-значение
    private int capacity = 4; // Вместимость хеш-таблицы
    private final double loadThres = 2.0 / 3.0; // Порог коэффициента загрузки для запуска расширения
    private final int extendRatio = 2; // Коэффициент расширения
    private Pair[] buckets; // Массив корзин
    private final Pair TOMBSTONE = new Pair(-1, "-1"); // Удалить метку

    /* Конструктор */
    public HashMapOpenAddressing() {
        size = 0;
        buckets = new Pair[capacity];
    }

    /* Хеш-функция */
    private int hashFunc(int key) {
        return key % capacity;
    }

    /* Коэффициент загрузки */
    private double loadFactor() {
        return (double) size / capacity;
    }

    /* Найти индекс корзины, соответствующий key */
    private int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // Выполнять линейное пробирование и завершить при встрече с пустой корзиной
        while (buckets[index] != null) {
            // Если встретился key, вернуть соответствующий индекс корзины
            if (buckets[index].key == key) {
                // Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // Вернуть индекс корзины после перемещения
                }
                return index; // Вернуть индекс корзины
            }
            // Записать первую встретившуюся метку удаления
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // Вычислить индекс корзины; при выходе за конец вернуться к началу
            index = (index + 1) % capacity;
        }
        // Если key не существует, вернуть индекс точки добавления
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* Операция поиска */
    public String get(int key) {
        // Найти индекс корзины, соответствующий key
        int index = findBucket(key);
        // Если пара ключ-значение найдена, вернуть соответствующее val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // Если пары ключ-значение не существует, вернуть null
        return null;
    }

    /* Операция добавления */
    public void put(int key, String val) {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if (loadFactor() > loadThres) {
            extend();
        }
        // Найти индекс корзины, соответствующий key
        int index = findBucket(key);
        // Если пара ключ-значение найдена, перезаписать val и вернуть
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index].val = val;
            return;
        }
        // Если пары ключ-значение нет, добавить ее
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* Операция удаления */
    public void remove(int key) {
        // Найти индекс корзины, соответствующий key
        int index = findBucket(key);
        // Если пара ключ-значение найдена, заменить ее меткой удаления
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* Расширить хеш-таблицу */
    private void extend() {
        // Временно сохранить исходную хеш-таблицу
        Pair[] bucketsTmp = buckets;
        // Инициализация новой хеш-таблицы после расширения
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
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
        // Инициализация хеш-таблицы
        HashMapOpenAddressing hashmap = new HashMapOpenAddressing();

        // Операция добавления
        // Добавить пару (key, val) в хеш-таблицу
        hashmap.put(12836, "Сяо Ха");
        hashmap.put(15937, "Сяо Ло");
        hashmap.put(16750, "Сяо Суань");
        hashmap.put(13276, "Сяо Фа");
        hashmap.put(10583, "Сяо Я");
        System.out.println("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение");
        hashmap.print();

        // Операция поиска
        // Передать ключ key в хеш-таблицу и получить значение val
        String name = hashmap.get(13276);
        System.out.println("\nДля номера 13276 найдено имя " + name);

        // Операция удаления
        // Удалить пару (key, val) из хеш-таблицы
        hashmap.remove(16750);
        System.out.println("\nПосле удаления 16750 хеш-таблица имеет вид\nКлюч -> Значение");
        hashmap.print();
    }
}
