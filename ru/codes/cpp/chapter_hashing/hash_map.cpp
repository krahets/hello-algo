/**
 * File: hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Инициализация хеш-таблицы */
    unordered_map<int, string> map;

    /* Операция добавления */
    // Добавить пару (key, value) в хеш-таблицу
    map[12836] = "Сяо Ха";
    map[15937] = "Сяо Ло";
    map[16750] = "Сяо Суань";
    map[13276] = "Сяо Фа";
    map[10583] = "Сяо Я";
    cout << "\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение" << endl;
    printHashMap(map);

    /* Операция поиска */
    // Ввести в хеш-таблицу ключ key и получить значение value
    string name = map[15937];
    cout << "\nДля студенческого номера 15937 найдено имя " << name << endl;

    /* Операция удаления */
    // Удалить пару (key, value) из хеш-таблицы
    map.erase(10583);
    cout << "\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение" << endl;
    printHashMap(map);

    /* Обход хеш-таблицы */
    cout << "\nОтдельный обход пар ключ-значение" << endl;
    for (auto kv : map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    cout << "\nОбход пар Key->Value с помощью итератора" << endl;
    for (auto iter = map.begin(); iter != map.end(); iter++) {
        cout << iter->first << "->" << iter->second << endl;
    }

    return 0;
}
