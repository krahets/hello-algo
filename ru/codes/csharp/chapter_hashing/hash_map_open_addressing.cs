/**
* File: hash_map_open_addressing.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

/* Хеш-таблица с открытой адресацией */
class HashMapOpenAddressing {
    int size; // Количество пар ключ-значение
    int capacity = 4; // Вместимость хеш-таблицы
    double loadThres = 2.0 / 3.0; // Порог коэффициента загрузки, запускающий расширение
    int extendRatio = 2; // Коэффициент расширения
    Pair[] buckets; // Массив бакетов
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

    /* Коэффициент загрузки */
    double LoadFactor() {
        return (double)size / capacity;
    }

    /* Найти индекс корзины, соответствующей ключу key */
    int FindBucket(int key) {
        int index = HashFunc(key);
        int firstTombstone = -1;
        // Выполнять линейное пробирование и остановиться при встрече с пустым бакетом
        while (buckets[index] != null) {
            // Если встретился key, вернуть соответствующий индекс бакета
            if (buckets[index].key == key) {
                // Если ранее встретилась метка удаления, переместить пару ключ-значение в этот индекс
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // Вернуть индекс бакета после перемещения
                }
                return index; // Вернуть индекс бакета
            }
            // Записать первую встретившуюся метку удаления
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // Вычислить индекс бакета; при выходе за конец вернуться к началу
            index = (index + 1) % capacity;
        }
        // Если key не существует, вернуть индекс точки добавления
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* Операция поиска */
    public string? Get(int key) {
        // Найти индекс корзины, соответствующей ключу key
        int index = FindBucket(key);
        // Если пара ключ-значение найдена, вернуть соответствующее val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // Если пара ключ-значение не существует, вернуть null
        return null;
    }

    /* Операция добавления */
    public void Put(int key, string val) {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if (LoadFactor() > loadThres) {
            Extend();
        }
        // Найти индекс корзины, соответствующей ключу key
        int index = FindBucket(key);
        // Если пара ключ-значение найдена, перезаписать val и вернуть результат
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index].val = val;
            return;
        }
        // Если пара ключ-значение не существует, добавить ее
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* Операция удаления */
    public void Remove(int key) {
        // Найти индекс корзины, соответствующей ключу key
        int index = FindBucket(key);
        // Если пара ключ-значение найдена, пометить ее меткой удаления
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* Расширить хеш-таблицу */
    void Extend() {
        // Временно сохранить исходную хеш-таблицу
        Pair[] bucketsTmp = buckets;
        // Инициализировать новую хеш-таблицу после расширения
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
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
        /* Инициализировать хеш-таблицу */
        HashMapOpenAddressing map = new();

        /* Операция добавления */
        // Добавить в хеш-таблицу пару ключ-значение (key, value)
        map.Put(12836, "Сяо Ха");
        map.Put(15937, "Сяо Ло");
        map.Put(16750, "Сяо Суань");
        map.Put(13276, "Сяо Фа");
        map.Put(10583, "Утенок");
        Console.WriteLine("\nПосле добавления хеш-таблица имеет вид\nKey -> Value");
        map.Print();

        /* Операция поиска */
        // Передать ключ key в хеш-таблицу и получить значение value
        string? name = map.Get(13276);
        Console.WriteLine("\nВходномер 13276, найденоимя" + name);

        /* Операция удаления */
        // Удалить из хеш-таблицы пару ключ-значение (key, value)
        map.Remove(16750);
        Console.WriteLine("\nПосле удаления 16750 хеш-таблица имеет вид\nKey -> Value");
        map.Print();
    }
}
