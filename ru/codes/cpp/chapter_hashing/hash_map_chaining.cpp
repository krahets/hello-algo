/**
 * File: hash_map_chaining.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* Хеш-таблица с цепочечной адресацией */
class HashMapChaining {
  private:
    int size;                       // Количество пар ключ-значение
    int capacity;                   // Вместимость хеш-таблицы
    double loadThres;               // Порог коэффициента загрузки, запускающий расширение
    int extendRatio;                // Коэффициент расширения
    vector<vector<Pair *>> buckets; // Массив бакетов

  public:
    /* Конструктор */
    HashMapChaining() : size(0), capacity(4), loadThres(2.0 / 3.0), extendRatio(2) {
        buckets.resize(capacity);
    }

    /* Деструктор */
    ~HashMapChaining() {
        for (auto &bucket : buckets) {
            for (Pair *pair : bucket) {
                // Освободить память
                delete pair;
            }
        }
    }

    /* Хеш-функция */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* Коэффициент загрузки */
    double loadFactor() {
        return (double)size / (double)capacity;
    }

    /* Операция поиска */
    string get(int key) {
        int index = hashFunc(key);
        // Обойти бакет; если найден key, вернуть соответствующее val
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                return pair->val;
            }
        }
        // Если key не найден, вернуть пустую строку
        return "";
    }

    /* Операция добавления */
    void put(int key, string val) {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        // Обойти бакет; если встретился указанный key, обновить соответствующее val и вернуть результат
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                pair->val = val;
                return;
            }
        }
        // Если такого key нет, добавить пару ключ-значение в конец
        buckets[index].push_back(new Pair(key, val));
        size++;
    }

    /* Операция удаления */
    void remove(int key) {
        int index = hashFunc(key);
        auto &bucket = buckets[index];
        // Обойти бакет и удалить из него пару ключ-значение
        for (int i = 0; i < bucket.size(); i++) {
            if (bucket[i]->key == key) {
                Pair *tmp = bucket[i];
                bucket.erase(bucket.begin() + i); // из него удалить пару ключ-значение
                delete tmp;                       // Освободить память
                size--;
                return;
            }
        }
    }

    /* Расширить хеш-таблицу */
    void extend() {
        // Временно сохранить исходную хеш-таблицу
        vector<vector<Pair *>> bucketsTmp = buckets;
        // Инициализировать новую хеш-таблицу после расширения
        capacity *= extendRatio;
        buckets.clear();
        buckets.resize(capacity);
        size = 0;
        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
        for (auto &bucket : bucketsTmp) {
            for (Pair *pair : bucket) {
                put(pair->key, pair->val);
                // Освободить память
                delete pair;
            }
        }
    }

    /* Вывести хеш-таблицу */
    void print() {
        for (auto &bucket : buckets) {
            cout << "[";
            for (Pair *pair : bucket) {
                cout << pair->key << " -> " << pair->val << ", ";
            }
            cout << "]\n";
        }
    }
};

/* Driver Code */
int main() {
    /* Инициализировать хеш-таблицу */
    HashMapChaining map = HashMapChaining();

    /* Операция добавления */
    // Добавить в хеш-таблицу пару ключ-значение (key, value)
    map.put(12836, "Сяо Ха");
    map.put(15937, "Сяо Ло");
    map.put(16750, "Сяо Суань");
    map.put(13276, "Сяо Фа");
    map.put(10583, "Утенок");
    cout << "\nПосле добавления хеш-таблица имеет вид\nKey -> Value" << endl;
    map.print();

    /* Операция поиска */
    // Передать ключ key в хеш-таблицу и получить значение value
    string name = map.get(13276);
    cout << "\nВведен номер 13276, найдено имя " << name << endl;

    /* Операция удаления */
    // Удалить из хеш-таблицы пару ключ-значение (key, value)
    map.remove(12836);
    cout << "\nПосле удаления 12836 хеш-таблица имеет вид\nKey -> Value" << endl;
    map.print();

    return 0;
}
