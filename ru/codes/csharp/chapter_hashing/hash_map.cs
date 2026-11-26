
/**
 * File: hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

public class hash_map {
    [Test]
    public void Test() {
        /* Создать хеш-таблицу */
        Dictionary<int, string> map = new() {
            /* Вставка */
            // Добавить в таблицу пару (key, value)
            { 12836, "Сяо Ха" },
            { 15937, "Сяо Ло" },
            { 16750, "Сяо Суань" },
            { 13276, "Сяо Фа" },
            { 10583, "Сяо Я" }
        };
        Console.WriteLine("\nХеш-таблица после вставки:\nКлюч -> Значение");
        PrintUtil.PrintHashMap(map);

        /* Поиск */
        // Получить из таблицы значение value по ключу key
        string name = map[15937];
        Console.WriteLine("\nИмя студента с номером 15937: " + name);

        /* Удаление */
        // Удалить из таблицы пару (key, value)
        map.Remove(10583);
        Console.WriteLine("\nХеш-таблица после удаления 10583:\nКлюч -> Значение");
        PrintUtil.PrintHashMap(map);

        /* Обход хеш-таблицы */
        Console.WriteLine("\nОбход пар «ключ -> значение»");
        foreach (var kv in map) {
            Console.WriteLine(kv.Key + " -> " + kv.Value);
        }
        Console.WriteLine("\nОбход только ключей");
        foreach (int key in map.Keys) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\nОбход только значений");
        foreach (string val in map.Values) {
            Console.WriteLine(val);
        }
    }
}
