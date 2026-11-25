/**
* File: hash_map_open_addressing.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

/* Хеш-таблица с открытой адресацией */
class HashMapOpenAddressing {
    int size; // Число пар «ключ — значение»
    int capacity = 4; // Ёмкость хеш-таблицы
    double loadThres = 2.0 / 3.0; // Порог коэффициента заполнения для расширения
    int extendRatio = 2; // Во сколько раз увеличивается ёмкость
    Pair[] buckets; // Массив корзин
    Pair TOMBSTONE = new(-1, "-1"); // Метка удаления

    /* Конструктор */
    public HashMapOpenAddressing() {
        size = 0;
        buckets = new Pair[capacity];
    }

    /* Хеш-функция */
    int HashFunc(int key) {
        return key % capacity;
    }

    /* Коэффициент заполнения */
    double LoadFactor() {
        return (double)size / capacity;
    }

    /* Найти индекс корзины для ключа key */
    int FindBucket(int key) {
        int index = HashFunc(key);
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
    public string? Get(int key) {
        // Найти индекс корзины для ключа key
        int index = FindBucket(key);
        // Если пара найдена, вернуть её значение val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // Если пары нет, вернуть null
        return null;
    }

    /* Вставка */
    public void Put(int key, string val) {
        // Расширить таблицу, если коэффициент заполнения превысил порог
        if (LoadFactor() > loadThres) {
            Extend();
        }
        // Найти индекс корзины для ключа key
        int index = FindBucket(key);
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
    public void Remove(int key) {
        // Найти индекс корзины для ключа key
        int index = FindBucket(key);
        // Если пара найдена, заменить её меткой удаления
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* Расширить хеш-таблицу */
    void Extend() {
        // Временно сохранить исходную хеш-таблицу
        Pair[] bucketsTmp = buckets;
        // Создать новую таблицу увеличенной ёмкости
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // Перенести пары из исходной таблицы в новую
        foreach (Pair pair in bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                Put(pair.key, pair.val);
            }
        }
    }

    /* Вывести хеш-таблицу */
    public void Print() {
        foreach (Pair pair in buckets) {
            if (pair == null) {
                Console.WriteLine("null");
            } else if (pair == TOMBSTONE) {
                Console.WriteLine("TOMBSTONE");
            } else {
                Console.WriteLine(pair.key + " -> " + pair.val);
            }
        }
    }
}

public class hash_map_open_addressing {
    [Test]
    public void Test() {
        /* Создать хеш-таблицу */
        HashMapOpenAddressing map = new();

        /* Вставка */
        // Добавить в таблицу пару (key, value)
        map.Put(12836, "Сяо Ха");
        map.Put(15937, "Сяо Ло");
        map.Put(16750, "Сяо Суань");
        map.Put(13276, "Сяо Фа");
        map.Put(10583, "Сяо Я");
        Console.WriteLine("\nХеш-таблица после вставки:\nКлюч -> Значение");
        map.Print();

        /* Поиск */
        // Получить из таблицы значение value по ключу key
        string? name = map.Get(13276);
        Console.WriteLine("\nИмя студента с номером 13276: " + name);

        /* Удаление */
        // Удалить из таблицы пару (key, value)
        map.Remove(16750);
        Console.WriteLine("\nХеш-таблица после удаления 16750:\nКлюч -> Значение");
        map.Print();
    }
}
