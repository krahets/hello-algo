/**
* File: hash_map_chaining.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

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
        buckets = new List<List<Pair>>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.Add([]);
        }
    }

    /* Хеш-функция */
    int HashFunc(int key) {
        return key % capacity;
    }

    /* Коэффициент загрузки */
    double LoadFactor() {
        return (double)size / capacity;
    }

    /* Операция поиска */
    public string? Get(int key) {
        int index = HashFunc(key);
        // Обойти корзину; если найден key, вернуть соответствующее val
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // Если key не найден, вернуть null
        return null;
    }

    /* Операция добавления */
    public void Put(int key, string val) {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if (LoadFactor() > loadThres) {
            Extend();
        }
        int index = HashFunc(key);
        // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // Если такого key нет, добавить пару ключ-значение в конец
        buckets[index].Add(new Pair(key, val));
        size++;
    }

    /* Операция удаления */
    public void Remove(int key) {
        int index = HashFunc(key);
        // Обойти корзину и удалить из нее пару ключ-значение
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
        // Инициализация новой хеш-таблицы после расширения
        capacity *= extendRatio;
        buckets = new List<List<Pair>>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.Add([]);
        }
        size = 0;
        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
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
        /* Инициализация хеш-таблицы */
        HashMapChaining map = new();

        /* Операция добавления */
        // Добавить пару (key, value) в хеш-таблицу
        map.Put(12836, "Сяо Ха");
        map.Put(15937, "Сяо Ло");
        map.Put(16750, "Сяо Суань");
        map.Put(13276, "Сяо Фа");
        map.Put(10583, "Сяо Я");
        Console.WriteLine("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение");
        map.Print();

        /* Операция поиска */
        // Ввести в хеш-таблицу ключ key и получить значение value
        string? name = map.Get(13276);
        Console.WriteLine("\nДля номера 13276 найдено имя " + name);

        /* Операция удаления */
        // Удалить пару (key, value) из хеш-таблицы
        map.Remove(12836);
        Console.WriteLine("\nПосле удаления 12836 хеш-таблица имеет вид\nКлюч -> Значение");
        map.Print();
    }
}