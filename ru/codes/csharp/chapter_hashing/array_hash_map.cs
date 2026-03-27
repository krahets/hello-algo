/**
 * File: array_hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

/* Пара ключ-значение int->string */
class Pair(int key, string val) {
    public int key = key;
    public string val = val;
}

/* Хеш-таблица на основе массива */
class ArrayHashMap {
    List<Pair?> buckets;
    public ArrayHashMap() {
        // Инициализировать массив, содержащий 100 корзин
        buckets = [];
        for (int i = 0; i < 100; i++) {
            buckets.Add(null);
        }
    }

    /* Хеш-функция */
    int HashFunc(int key) {
        int index = key % 100;
        return index;
    }

    /* Операция поиска */
    public string? Get(int key) {
        int index = HashFunc(key);
        Pair? pair = buckets[index];
        if (pair == null) return null;
        return pair.val;
    }

    /* Операция добавления */
    public void Put(int key, string val) {
        Pair pair = new(key, val);
        int index = HashFunc(key);
        buckets[index] = pair;
    }

    /* Операция удаления */
    public void Remove(int key) {
        int index = HashFunc(key);
        // Присвоить null, что означает удаление
        buckets[index] = null;
    }

    /* Получить все пары ключ-значение */
    public List<Pair> PairSet() {
        List<Pair> pairSet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                pairSet.Add(pair);
        }
        return pairSet;
    }

    /* Получить все ключи */
    public List<int> KeySet() {
        List<int> keySet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                keySet.Add(pair.key);
        }
        return keySet;
    }

    /* Получить все значения */
    public List<string> ValueSet() {
        List<string> valueSet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                valueSet.Add(pair.val);
        }
        return valueSet;
    }

    /* Вывести хеш-таблицу */
    public void Print() {
        foreach (Pair kv in PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
    }
}


public class array_hash_map {
    [Test]
    public void Test() {
        /* Инициализация хеш-таблицы */
        ArrayHashMap map = new();

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
        string? name = map.Get(15937);
        Console.WriteLine("\nДля номера 15937 найдено имя " + name);

        /* Операция удаления */
        // Удалить пару (key, value) из хеш-таблицы
        map.Remove(10583);
        Console.WriteLine("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение");
        map.Print();

        /* Обход хеш-таблицы */
        Console.WriteLine("\nОтдельный обход пар ключ-значение");
        foreach (Pair kv in map.PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
        Console.WriteLine("\nОтдельный обход ключей");
        foreach (int key in map.KeySet()) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\nОтдельный обход значений");
        foreach (string val in map.ValueSet()) {
            Console.WriteLine(val);
        }
    }
}
