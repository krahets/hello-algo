/**
 * File: hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* Демонстрационный код */
int main() {
    /* Создать хеш-таблицу */
    unordered_map<int, string> map;

    /* Вставка */
    // Добавить в таблицу пару (key, value)
    map[12836] = "Сяо Ха";
    map[15937] = "Сяо Ло";
    map[16750] = "Сяо Суань";
    map[13276] = "Сяо Фа";
    map[10583] = "Сяо Я";
    cout << "\nХеш-таблица после вставки:\nКлюч -> Значение" << endl;
    printHashMap(map);

    /* Поиск */
    // Получить из таблицы значение value по ключу key
    string name = map[15937];
    cout << "\nИмя студента с номером 15937: " << name << endl;

    /* Удаление */
    // Удалить из таблицы пару (key, value)
    map.erase(10583);
    cout << "\nХеш-таблица после удаления 10583:\nКлюч -> Значение" << endl;
    printHashMap(map);

    /* Обход хеш-таблицы */
    cout << "\nОбход пар «ключ -> значение»" << endl;
    for (auto kv : map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    cout << "\nОбход пар «ключ -> значение» с помощью итератора" << endl;
    for (auto iter = map.begin(); iter != map.end(); iter++) {
        cout << iter->first << "->" << iter->second << endl;
    }

    return 0;
}
