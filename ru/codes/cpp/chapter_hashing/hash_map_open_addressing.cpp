/**
 * File: hash_map_open_addressing.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* Хеш-таблица с открытой адресацией */
class HashMapOpenAddressing {
  private:
    int size;                             // Число пар «ключ — значение»
    int capacity = 4;                     // Ёмкость хеш-таблицы
    const double loadThres = 2.0 / 3.0;     // Порог коэффициента заполнения для расширения
    const int extendRatio = 2;            // Во сколько раз увеличивается ёмкость
    vector<Pair *> buckets;               // Массив корзин
    Pair *TOMBSTONE = new Pair(-1, "-1"); // Метка удаления

  public:
    /* Конструктор */
    HashMapOpenAddressing() : size(0), buckets(capacity, nullptr) {
    }

    /* Деструктор */
    ~HashMapOpenAddressing() {
        for (Pair *pair : buckets) {
            if (pair != nullptr && pair != TOMBSTONE) {
                delete pair;
            }
        }
        delete TOMBSTONE;
    }

    /* Хеш-функция */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* Коэффициент заполнения */
    double loadFactor() {
        return (double)size / capacity;
    }

    /* Найти индекс корзины для ключа key */
    int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // Линейное пробирование до первой пустой корзины
        while (buckets[index] != nullptr) {
            // При совпадении ключа key вернуть индекс его корзины
            if (buckets[index]->key == key) {
                // Если ранее встретилась метка удаления, переместить пару на её место
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // Вернуть индекс корзины после перемещения
                }
                return index; // Вернуть индекс корзины
            }
            // Запомнить первую встретившуюся метку удаления
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // Вычислить индекс корзины, после конца массива перейти в начало
            index = (index + 1) % capacity;
        }
        // Если ключа key нет, вернуть индекс для вставки
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* Поиск */
    string get(int key) {
        // Найти индекс корзины для ключа key
        int index = findBucket(key);
        // Если пара найдена, вернуть её значение val
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            return buckets[index]->val;
        }
        // Если пары нет, вернуть пустую строку
        return "";
    }

    /* Вставка */
    void put(int key, string val) {
        // Расширить таблицу, если коэффициент заполнения превысил порог
        if (loadFactor() > loadThres) {
            extend();
        }
        // Найти индекс корзины для ключа key
        int index = findBucket(key);
        // Если пара найдена, заменить val и завершить операцию
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            buckets[index]->val = val;
            return;
        }
        // Если пары нет, добавить её
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* Удаление */
    void remove(int key) {
        // Найти индекс корзины для ключа key
        int index = findBucket(key);
        // Если пара найдена, заменить её меткой удаления
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            delete buckets[index];
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* Расширить хеш-таблицу */
    void extend() {
        // Временно сохранить исходную хеш-таблицу
        vector<Pair *> bucketsTmp = buckets;
        // Создать новую таблицу увеличенной ёмкости
        capacity *= extendRatio;
        buckets = vector<Pair *>(capacity, nullptr);
        size = 0;
        // Перенести пары из исходной таблицы в новую
        for (Pair *pair : bucketsTmp) {
            if (pair != nullptr && pair != TOMBSTONE) {
                put(pair->key, pair->val);
                delete pair;
            }
        }
    }

    /* Вывести хеш-таблицу */
    void print() {
        for (Pair *pair : buckets) {
            if (pair == nullptr) {
                cout << "nullptr" << endl;
            } else if (pair == TOMBSTONE) {
                cout << "TOMBSTONE" << endl;
            } else {
                cout << pair->key << " -> " << pair->val << endl;
            }
        }
    }
};

/* Демонстрационный код */
int main() {
    // Создать хеш-таблицу
    HashMapOpenAddressing hashmap;

    // Вставка
    // Добавить в таблицу пару (key, val)
    hashmap.put(12836, "Сяо Ха");
    hashmap.put(15937, "Сяо Ло");
    hashmap.put(16750, "Сяо Суань");
    hashmap.put(13276, "Сяо Фа");
    hashmap.put(10583, "Сяо Я");
    cout << "\nХеш-таблица после вставки:\nКлюч -> Значение" << endl;
    hashmap.print();

    // Поиск
    // Получить из таблицы значение val по ключу key
    string name = hashmap.get(13276);
    cout << "\nИмя студента с номером 13276: " << name << endl;

    // Удаление
    // Удалить из таблицы пару (key, val)
    hashmap.remove(16750);
    cout << "\nХеш-таблица после удаления 16750:\nКлюч -> Значение" << endl;
    hashmap.print();

    return 0;
}
