/**
 * File: my_list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Класс списка */
class MyList {
  private:
    int *arr;             // Массив для хранения элементов списка
    int arrCapacity = 10; // Ёмкость списка
    int arrSize = 0;      // Длина списка (текущее количество элементов)
    int extendRatio = 2;   // Коэффициент увеличения ёмкости списка

  public:
    /* Конструктор */
    MyList() {
        arr = new int[arrCapacity];
    }

    /* Деструктор */
    ~MyList() {
        delete[] arr;
    }

    /* Получить длину списка (текущее количество элементов)*/
    int size() {
        return arrSize;
    }

    /* Получить ёмкость списка */
    int capacity() {
        return arrCapacity;
    }

    /* Доступ к элементу */
    int get(int index) {
        // При выходе индекса за границы выбросить исключение. То же правило действует ниже
        if (index < 0 || index >= size())
            throw out_of_range("Индекс за пределами списка");
        return arr[index];
    }

    /* Изменение элемента */
    void set(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("Индекс за пределами списка");
        arr[index] = num;
    }

    /* Добавление элемента в конец */
    void add(int num) {
        // Если для элементов не хватает места, увеличить ёмкость
        if (size() == capacity())
            extendCapacity();
        arr[size()] = num;
        // Обновить количество элементов
        arrSize++;
    }

    /* Вставка элемента в середину */
    void insert(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("Индекс за пределами списка");
        // Если для элементов не хватает места, увеличить ёмкость
        if (size() == capacity())
            extendCapacity();
        // Сдвинуть все элементы начиная с index на одну позицию вправо
        for (int j = size() - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Обновить количество элементов
        arrSize++;
    }

    /* Удаление элемента */
    int remove(int index) {
        if (index < 0 || index >= size())
            throw out_of_range("Индекс за пределами списка");
        int num = arr[index];
        // Сдвинуть все элементы после index на одну позицию влево
        for (int j = index; j < size() - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Обновить количество элементов
        arrSize--;
        // Вернуть удалённый элемент
        return num;
    }

    /* Увеличение ёмкости списка */
    void extendCapacity() {
        // Создать массив, длина которого в extendRatio раз больше длины исходного
        int newCapacity = capacity() * extendRatio;
        int *tmp = arr;
        arr = new int[newCapacity];
        // Скопировать все элементы исходного массива в новый
        for (int i = 0; i < size(); i++) {
            arr[i] = tmp[i];
        }
        // Освободить память
        delete[] tmp;
        arrCapacity = newCapacity;
    }

    /* Преобразовать список в вектор для вывода */
    vector<int> toVector() {
        // Преобразовать только используемую часть списка
        vector<int> vec(size());
        for (int i = 0; i < size(); i++) {
            vec[i] = arr[i];
        }
        return vec;
    }
};

/* Демонстрационный код */
int main() {
    /* Инициализация списка */
    MyList *nums = new MyList();
    /* Добавление элемента в конец */
    nums->add(1);
    nums->add(3);
    nums->add(2);
    nums->add(5);
    nums->add(4);
    cout << "Список nums = ";
    vector<int> vec = nums->toVector();
    printVector(vec);
    cout << "Ёмкость = " << nums->capacity() << " | длина = " << nums->size() << endl;

    /* Вставка элемента в середину */
    nums->insert(3, 6);
    cout << "После вставки числа 6 по индексу 3 nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Удаление элемента */
    nums->remove(3);
    cout << "После удаления элемента по индексу 3 nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Доступ к элементу */
    int num = nums->get(1);
    cout << "Элемент по индексу 1: num = " << num << endl;

    /* Изменение элемента */
    nums->set(1, 0);
    cout << "После записи 0 по индексу 1 nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Проверка увеличения ёмкости */
    for (int i = 0; i < 10; i++) {
        // При i = 5 длина списка превысит его ёмкость, поэтому потребуется увеличить ёмкость
        nums->add(i);
    }
    cout << "После увеличения ёмкости список nums = ";
    vec = nums->toVector();
    printVector(vec);
    cout << "Ёмкость = " << nums->capacity() << " | длина = " << nums->size() << endl;

    // Освободить память
    delete nums;

    return 0;
}
