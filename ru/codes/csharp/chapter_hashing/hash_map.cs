
/**
 * File: hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

public class hash_map {
    [Test]
    public void Test() {
        /* Инициализировать хеш-таблицу */
        Dictionary<int, string> map = new() {
            /* Операция добавления */
            // Добавить в хеш-таблицу пару ключ-значение (key, value)
            { 12836, "Сяо Ха" },
            { 15937, "Сяо Ло" },
            { 16750, "Сяо Суань" },
            { 13276, "Сяо Фа" },
            { 10583, "Утенок" }
        };
        Console.WriteLine("\nПосле добавления хеш-таблица выглядит так\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        /* Операция поиска */
        // Передать ключ key в хеш-таблицу и получить значение value
        string name = map[15937];
        Console.WriteLine("\nПо номеру студента 15937 найдено имя " + name);

        /* Операция удаления */
        // Удалить из хеш-таблицы пару ключ-значение (key, value)
        map.Remove(10583);
        Console.WriteLine("\nПосле удаления 10583 хеш-таблица выглядит так\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        /* Перебрать хеш-таблицу */
        Console.WriteLine("\nПеребираем пары Key->Value");
        foreach (var kv in map) {
            Console.WriteLine(kv.Key + " -> " + kv.Value);
        }
        Console.WriteLine("\nОтдельно перебираем ключи Key");
        foreach (int key in map.Keys) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\nОтдельно перебираем значения Value");
        foreach (string val in map.Values) {
            Console.WriteLine(val);
        }
    }
}
