/**
 * File: array_hash_map_test.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "./array_hash_map.cpp"

/* Driver Code */
int main() {
    /* Инициализация хеш-таблицы */
    ArrayHashMap map = ArrayHashMap();

    /* Операция добавления */
    // Добавить пару (key, value) в хеш-таблицу
    map.put(12836, "Сяо Ха");
    map.put(15937, "Сяо Ло");
    map.put(16750, "Сяо Суань");
    map.put(13276, "Сяо Фа");
    map.put(10583, "Сяо Я");
    cout << "\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение" << endl;
    map.print();

    /* Операция поиска */
    // Ввести в хеш-таблицу ключ key и получить значение value
    string name = map.get(15937);
    cout << "\nДля студенческого номера 15937 найдено имя " << name << endl;

    /* Операция удаления */
    // Удалить пару (key, value) из хеш-таблицы
    map.remove(10583);
    cout << "\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение" << endl;
    map.print();

    /* Обход хеш-таблицы */
    cout << "\nОтдельный обход пар ключ-значение" << endl;
    for (auto kv : map.pairSet()) {
        cout << kv->key << " -> " << kv->val << endl;
    }

    cout << "\nОтдельный обход ключей" << endl;
    for (auto key : map.keySet()) {
        cout << key << endl;
    }

    cout << "\nОтдельный обход значений" << endl;
    for (auto val : map.valueSet()) {
        cout << val << endl;
    }

    return 0;
}
