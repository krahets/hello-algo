
/**
 * File: hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

public class hash_map {
    [Test]
    public void Test() {
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
        Console.WriteLine("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение");
        PrintUtil.PrintHashMap(map);

        /* Операция поиска */
        // Ввести в хеш-таблицу ключ key и получить значение value
        string name = map[15937];
        Console.WriteLine("\nДля номера 15937 найдено имя " + name);

        /* Операция удаления */
        // Удалить пару (key, value) из хеш-таблицы
        map.Remove(10583);
        Console.WriteLine("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение");
        PrintUtil.PrintHashMap(map);

        /* Обход хеш-таблицы */
        Console.WriteLine("\nОтдельный обход пар ключ-значение");
        foreach (var kv in map) {
            Console.WriteLine(kv.Key + " -> " + kv.Value);
        }
        Console.WriteLine("\nОтдельный обход ключей");
        foreach (int key in map.Keys) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\nОтдельный обход значений");
        foreach (string val in map.Values) {
            Console.WriteLine(val);
        }
    }
}
