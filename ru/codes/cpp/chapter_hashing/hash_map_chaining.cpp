/**
 * File: hash_map_chaining.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* Хеш-таблица с цепочками */
class HashMapChaining {
  private:
    int size;                       // Число пар ключ-значение
    int capacity;                   // Вместимость хеш-таблицы
    double loadThres;               // Порог коэффициента загрузки для запуска расширения
    int extendRatio;                // Коэффициент расширения
    vector<vector<Pair *>> buckets; // Массив корзин

  public:
    /* Конструктор */
    HashMapChaining() : size(0), capacity(4), loadThres(2.0 / 3.0), extendRatio(2) {
        buckets.resize(capacity);
    }

    /* Метод-деструктор */
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
        // Обойти корзину; если найден key, вернуть соответствующее val
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
        // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
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
        // Обойти корзину и удалить из нее пару ключ-значение
        for (int i = 0; i < bucket.size(); i++) {
            if (bucket[i]->key == key) {
                Pair *tmp = bucket[i];
                bucket.erase(bucket.begin() + i); // Удалить из него пару ключ-значение
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
        // Инициализация новой хеш-таблицы после расширения
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
    /* Инициализация хеш-таблицы */
    HashMapChaining map = HashMapChaining();

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
    string name = map.get(13276);
    cout << "\nДля студенческого номера 13276 найдено имя " << name << endl;

    /* Операция удаления */
    // Удалить пару (key, value) из хеш-таблицы
    map.remove(12836);
    cout << "\nПосле удаления 12836 хеш-таблица имеет вид\nКлюч -> Значение" << endl;
    map.print();

    return 0;
}
