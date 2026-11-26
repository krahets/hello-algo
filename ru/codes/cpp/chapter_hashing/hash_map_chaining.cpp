/**
 * File: hash_map_chaining.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* Хеш-таблица с цепочками */
class HashMapChaining {
  private:
    int size;                       // Число пар «ключ — значение»
    int capacity;                   // Ёмкость хеш-таблицы
    double loadThres;               // Порог коэффициента заполнения для расширения
    int extendRatio;                // Во сколько раз увеличивается ёмкость
    vector<vector<Pair *>> buckets; // Массив корзин

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

    /* Коэффициент заполнения */
    double loadFactor() {
        return (double)size / (double)capacity;
    }

    /* Поиск */
    string get(int key) {
        int index = hashFunc(key);
        // Обойти корзину и при совпадении ключа key вернуть соответствующее значение val
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                return pair->val;
            }
        }
        // Если ключ key не найден, вернуть пустую строку
        return "";
    }

    /* Вставка */
    void put(int key, string val) {
        // Расширить таблицу, если коэффициент заполнения превысил порог
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        // Обойти корзину. Если найден ключ key, обновить val и завершить операцию
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                pair->val = val;
                return;
            }
        }
        // Если ключа key нет, добавить пару в конец списка
        buckets[index].push_back(new Pair(key, val));
        size++;
    }

    /* Удаление */
    void remove(int key) {
        int index = hashFunc(key);
        auto &bucket = buckets[index];
        // Обойти корзину и удалить из неё нужную пару
        for (int i = 0; i < bucket.size(); i++) {
            if (bucket[i]->key == key) {
                Pair *tmp = bucket[i];
                bucket.erase(bucket.begin() + i); // Удалить из списка пару «ключ — значение»
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
        // Создать новую таблицу увеличенной ёмкости
        capacity *= extendRatio;
        buckets.clear();
        buckets.resize(capacity);
        size = 0;
        // Перенести пары из исходной таблицы в новую
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

/* Демонстрационный код */
int main() {
    /* Создать хеш-таблицу */
    HashMapChaining map = HashMapChaining();

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
    string name = map.get(13276);
    cout << "\nИмя студента с номером 13276: " << name << endl;

    /* Удаление */
    // Удалить из таблицы пару (key, value)
    map.remove(12836);
    cout << "\nХеш-таблица после удаления 12836:\nКлюч -> Значение" << endl;
    map.print();

    return 0;
}
