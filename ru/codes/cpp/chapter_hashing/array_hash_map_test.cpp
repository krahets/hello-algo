/**
 * File: array_hash_map_test.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "./array_hash_map.cpp"

/* Driver Code */
int main() {
    /* Инициализировать хеш-таблицу */
    ArrayHashMap map = ArrayHashMap();

    /* Операция добавления */
    // Добавить в хеш-таблицу пару ключ-значение (key, value)
    map.put(12836, "Сяо Ха");
    map.put(15937, "Сяо Ло");
    map.put(16750, "Сяо Суань");
    map.put(13276, "Сяо Фа");
    map.put(10583, "Утенок");
    cout << "\nПосле добавления хеш-таблица выглядит так\nKey -> Value" << endl;
    map.print();

    /* Операция поиска */
    // Передать ключ key в хеш-таблицу и получить значение value
    string name = map.get(15937);
    cout << "\nПо номеру студента 15937 найдено имя " << name << endl;

    /* Операция удаления */
    // Удалить из хеш-таблицы пару ключ-значение (key, value)
    map.remove(10583);
    cout << "\nПосле удаления 10583 хеш-таблица выглядит так\nKey -> Value" << endl;
    map.print();

    /* Перебрать хеш-таблицу */
    cout << "\nПеребираем пары Key->Value" << endl;
    for (auto kv : map.pairSet()) {
        cout << kv->key << " -> " << kv->val << endl;
    }

    cout << "\nОтдельно перебираем ключи Key" << endl;
    for (auto key : map.keySet()) {
        cout << key << endl;
    }

    cout << "\nОтдельно перебираем значения Value" << endl;
    for (auto val : map.valueSet()) {
        cout << val << endl;
    }

    return 0;
}
