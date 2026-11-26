/**
 * File: array_hash_map_test.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "./array_hash_map.cpp"

/* Демонстрационный код */
int main() {
    /* Создать хеш-таблицу */
    ArrayHashMap map = ArrayHashMap();

    /* Вставка */
    // Добавить в таблицу пару (key, value)
    map.put(12836, "Сяо Ха");
    map.put(15937, "Сяо Ло");
    map.put(16750, "Сяо Суань");
    map.put(13276, "Сяо Фа");
    map.put(10583, "Сяо Я");
    cout << "\nХеш-таблица после вставки:\nКлюч -> Значение" << endl;
    map.print();

    /* Поиск */
    // Получить из таблицы значение value по ключу key
    string name = map.get(15937);
    cout << "\nИмя студента с номером 15937: " << name << endl;

    /* Удаление */
    // Удалить из таблицы пару (key, value)
    map.remove(10583);
    cout << "\nХеш-таблица после удаления 10583:\nКлюч -> Значение" << endl;
    map.print();

    /* Обход хеш-таблицы */
    cout << "\nОбход пар «ключ -> значение»" << endl;
    for (auto kv : map.pairSet()) {
        cout << kv->key << " -> " << kv->val << endl;
    }

    cout << "\nОбход только ключей" << endl;
    for (auto key : map.keySet()) {
        cout << key << endl;
    }

    cout << "\nОбход только значений" << endl;
    for (auto val : map.valueSet()) {
        cout << val << endl;
    }

    return 0;
}
