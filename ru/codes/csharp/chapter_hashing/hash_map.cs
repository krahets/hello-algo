
/**
 * File: hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

public class hash_map {
    [Test]
    public void Test() {
        // [region]{init_hash_map}
        /* Инициализация хеш-таблицы */
        Dictionary<int, string> map = new() {
            /* Операция добавления */
            // Добавить пару (key, value) в хеш-таблицу
            { 12836, "Сяо Ха" },
            { 15937, "Сяо Ло" },
            { 16750, "Сяо Суань" },
            { 13276, "Сяо Фа" },
            { 10583, "Сяо Я" }
        };
        // [endregion]{init_hash_map}
        Console.WriteLine("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение");
        PrintUtil.PrintHashMap(map);

        // [region]{get_value}
        /* Операция поиска */
        // Ввести в хеш-таблицу ключ key и получить значение value
        string name = map[15937];
        // [endregion]{get_value}
        Console.WriteLine("\nДля номера 15937 найдено имя " + name);

        // [region]{remove_pair}
        /* Операция удаления */
        // Удалить пару (key, value) из хеш-таблицы
        map.Remove(10583);
        // [endregion]{remove_pair}
        Console.WriteLine("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение");
        PrintUtil.PrintHashMap(map);

        Console.WriteLine("\nОтдельный обход пар ключ-значение");
        // [region]{iterate_pairs}
        /* Обход хеш-таблицы */
        // Обход пар ключ-значение key->value
        foreach (var kv in map) {
            Console.WriteLine(kv.Key + " -> " + kv.Value);
        }
        // [endregion]{iterate_pairs}

        Console.WriteLine("\nОтдельный обход ключей");
        // [region]{iterate_keys}
        // Обход только ключей key
        foreach (int key in map.Keys) {
            Console.WriteLine(key);
        }
        // [endregion]{iterate_keys}

        Console.WriteLine("\nОтдельный обход значений");
        // [region]{iterate_values}
        // Обход только значений value
        foreach (string val in map.Values) {
            Console.WriteLine(val);
        }
        // [endregion]{iterate_values}
    }
}
