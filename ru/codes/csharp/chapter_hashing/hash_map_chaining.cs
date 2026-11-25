/**
* File: hash_map_chaining.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

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
        buckets = new List<List<Pair>>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.Add([]);
        }
    }

    /* Хеш-функция */
    int HashFunc(int key) {
        return key % capacity;
    }

    /* Коэффициент заполнения */
    double LoadFactor() {
        return (double)size / capacity;
    }

    /* Поиск */
    public string? Get(int key) {
        int index = HashFunc(key);
        // Обойти корзину и при совпадении ключа key вернуть соответствующее значение val
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // Если ключ key не найден, вернуть null
        return null;
    }

    /* Вставка */
    public void Put(int key, string val) {
        // Расширить таблицу, если коэффициент заполнения превысил порог
        if (LoadFactor() > loadThres) {
            Extend();
        }
        int index = HashFunc(key);
        // Обойти корзину. Если найден ключ key, обновить val и завершить операцию
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // Если ключа key нет, добавить пару в конец списка
        buckets[index].Add(new Pair(key, val));
        size++;
    }

    /* Удаление */
    public void Remove(int key) {
        int index = HashFunc(key);
        // Обойти корзину и удалить из неё нужную пару
        foreach (Pair pair in buckets[index].ToList()) {
            if (pair.key == key) {
                buckets[index].Remove(pair);
                size--;
                break;
            }
        }
    }

    /* Расширить хеш-таблицу */
    void Extend() {
        // Временно сохранить исходную хеш-таблицу
        List<List<Pair>> bucketsTmp = buckets;
        // Создать новую таблицу увеличенной ёмкости
        capacity *= extendRatio;
        buckets = new List<List<Pair>>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.Add([]);
        }
        size = 0;
        // Перенести пары из исходной таблицы в новую
        foreach (List<Pair> bucket in bucketsTmp) {
            foreach (Pair pair in bucket) {
                Put(pair.key, pair.val);
            }
        }
    }

    /* Вывести хеш-таблицу */
    public void Print() {
        foreach (List<Pair> bucket in buckets) {
            List<string> res = [];
            foreach (Pair pair in bucket) {
                res.Add(pair.key + " -> " + pair.val);
            }
            foreach (string kv in res) {
                Console.WriteLine(kv);
            }
        }
    }
}

public class hash_map_chaining {
    [Test]
    public void Test() {
        /* Создать хеш-таблицу */
        HashMapChaining map = new();

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
        map.Remove(12836);
        Console.WriteLine("\nХеш-таблица после удаления 12836:\nКлюч -> Значение");
        map.Print();
    }
}