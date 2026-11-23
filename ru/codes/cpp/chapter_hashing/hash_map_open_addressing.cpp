/**
 * File: hash_map_open_addressing.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* Хеш-таблица с открытой адресацией */
class HashMapOpenAddressing {
  private:
    int size;                             // Число пар ключ-значение
    int capacity = 4;                     // Вместимость хеш-таблицы
    const double loadThres = 2.0 / 3.0;     // Порог коэффициента загрузки для запуска расширения
    const int extendRatio = 2;            // Коэффициент расширения
    vector<Pair *> buckets;               // Массив корзин
    Pair *TOMBSTONE = new Pair(-1, "-1"); // Удалить метку

  public:
    /* Конструктор */
    HashMapOpenAddressing() : size(0), buckets(capacity, nullptr) {
    }

    /* Метод-деструктор */
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

    /* Коэффициент загрузки */
    double loadFactor() {
        return (double)size / capacity;
    }

    /* Найти индекс корзины, соответствующий key */
    int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // Выполнять линейное пробирование и завершить при встрече с пустой корзиной
        while (buckets[index] != nullptr) {
            // Если встретился key, вернуть соответствующий индекс корзины
            if (buckets[index]->key == key) {
                // Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // Вернуть индекс корзины после перемещения
                }
                return index; // Вернуть индекс корзины
            }
            // Записать первую встретившуюся метку удаления
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // Вычислить индекс корзины; при выходе за конец вернуться к началу
            index = (index + 1) % capacity;
        }
        // Если key не существует, вернуть индекс точки добавления
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* Операция поиска */
    string get(int key) {
        // Найти индекс корзины, соответствующий key
        int index = findBucket(key);
        // Если пара ключ-значение найдена, вернуть соответствующее val
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            return buckets[index]->val;
        }
        // Если пары ключ-значение не существует, вернуть пустую строку
        return "";
    }

    /* Операция добавления */
    void put(int key, string val) {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if (loadFactor() > loadThres) {
            extend();
        }
        // Найти индекс корзины, соответствующий key
        int index = findBucket(key);
        // Если пара ключ-значение найдена, перезаписать val и вернуть
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            buckets[index]->val = val;
            return;
        }
        // Если пары ключ-значение нет, добавить ее
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* Операция удаления */
    void remove(int key) {
        // Найти индекс корзины, соответствующий key
        int index = findBucket(key);
        // Если пара ключ-значение найдена, заменить ее меткой удаления
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
        // Инициализация новой хеш-таблицы после расширения
        capacity *= extendRatio;
        buckets = vector<Pair *>(capacity, nullptr);
        size = 0;
        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
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

/* Driver Code */
int main() {
    // Инициализация хеш-таблицы
    HashMapOpenAddressing hashmap;

    // Операция добавления
    // Добавить пару (key, val) в хеш-таблицу
    hashmap.put(12836, "Сяо Ха");
    hashmap.put(15937, "Сяо Ло");
    hashmap.put(16750, "Сяо Суань");
    hashmap.put(13276, "Сяо Фа");
    hashmap.put(10583, "Сяо Я");
    cout << "\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение" << endl;
    hashmap.print();

    // Операция поиска
    // Передать ключ key в хеш-таблицу и получить значение val
    string name = hashmap.get(13276);
    cout << "\nДля студенческого номера 13276 найдено имя " << name << endl;

    // Операция удаления
    // Удалить пару (key, val) из хеш-таблицы
    hashmap.remove(16750);
    cout << "\nПосле удаления 16750 хеш-таблица имеет вид\nКлюч -> Значение" << endl;
    hashmap.print();

    return 0;
}
