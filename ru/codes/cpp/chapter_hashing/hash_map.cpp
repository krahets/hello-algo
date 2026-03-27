/**
 * File: hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Инициализировать хеш-таблицу */
    unordered_map<int, string> map;

    /* Операция добавления */
    // Добавить в хеш-таблицу пару ключ-значение (key, value)
    map[12836] = "Сяо Ха";
    map[15937] = "Сяо Ло";
    map[16750] = "Сяо Суань";
    map[13276] = "Сяо Фа";
    map[10583] = "Утенок";
    cout << "\nПосле добавления хеш-таблица выглядит так\nKey -> Value" << endl;
    printHashMap(map);

    /* Операция поиска */
    // Передать ключ key в хеш-таблицу и получить значение value
    string name = map[15937];
    cout << "\nПо номеру студента 15937 найдено имя " << name << endl;

    /* Операция удаления */
    // Удалить из хеш-таблицы пару ключ-значение (key, value)
    map.erase(10583);
    cout << "\nПосле удаления 10583 хеш-таблица выглядит так\nKey -> Value" << endl;
    printHashMap(map);

    /* Перебрать хеш-таблицу */
    cout << "\nПеребираем пары Key->Value" << endl;
    for (auto kv : map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    cout << "\nОбход Key->Value с помощью итератора" << endl;
    for (auto iter = map.begin(); iter != map.end(); iter++) {
        cout << iter->first << "->" << iter->second << endl;
    }

    return 0;
}
