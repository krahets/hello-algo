/**
 * File: my_list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Класс списка */
class MyList {
  private:
    int *arr;             // Массив (хранит элементы списка)
    int arrCapacity = 10; // Вместимость списка
    int arrSize = 0;      // Длина списка (текущее количество элементов)
    int extendRatio = 2;   // Коэффициент расширения списка при каждом увеличении

  public:
    /* Конструктор */
    MyList() {
        arr = new int[arrCapacity];
    }

    /* Деструктор */
    ~MyList() {
        delete[] arr;
    }

    /* Получить длину списка (текущее количество элементов) */
    int size() {
        return arrSize;
    }

    /* Получить вместимость списка */
    int capacity() {
        return arrCapacity;
    }

    /* Получить доступ к элементу */
    int get(int index) {
        // Если индекс выходит за границы, выбросить исключение; далее аналогично
        if (index < 0 || index >= size())
            throw out_of_range("Индекс вне допустимого диапазона");
        return arr[index];
    }

    /* Обновить элемент */
    void set(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("Индекс вне допустимого диапазона");
        arr[index] = num;
    }

    /* Добавить элемент в конец */
    void add(int num) {
        // Если число элементов превышает вместимость, запустить механизм расширения
        if (size() == capacity())
            extendCapacity();
        arr[size()] = num;
        // Обновить количество элементов
        arrSize++;
    }

    /* Вставить элемент в середину */
    void insert(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("Индекс вне допустимого диапазона");
        // Если число элементов превышает вместимость, запустить механизм расширения
        if (size() == capacity())
            extendCapacity();
        // Сдвинуть на одну позицию назад элемент с индексом index и все последующие элементы
        for (int j = size() - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Обновить количество элементов
        arrSize++;
    }

    /* Удалить элемент */
    int remove(int index) {
        if (index < 0 || index >= size())
            throw out_of_range("Индекс вне допустимого диапазона");
        int num = arr[index];
        // Сдвинуть на одну позицию вперед все элементы после индекса index
        for (int j = index; j < size() - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Обновить количество элементов
        arrSize--;
        // Вернуть удаленный элемент
        return num;
    }

    /* Расширение списка */
    void extendCapacity() {
        // Создать новый массив длиной в extendRatio раз больше исходного массива
        int newCapacity = capacity() * extendRatio;
        int *tmp = arr;
        arr = new int[newCapacity];
        // Скопировать все элементы исходного массива в новый массив
        for (int i = 0; i < size(); i++) {
            arr[i] = tmp[i];
        }
        // Освободить память
        delete[] tmp;
        arrCapacity = newCapacity;
    }

    /* Преобразовать список в Vector для вывода */
    vector<int> toVector() {
        // Преобразовать только элементы списка в пределах действительной длины
        vector<int> vec(size());
        for (int i = 0; i < size(); i++) {
            vec[i] = arr[i];
        }
        return vec;
    }
};

/* Driver Code */
int main() {
    /* Инициализировать список */
    MyList *nums = new MyList();
    /* Добавить элемент в конец */
    nums->add(1);
    nums->add(3);
    nums->add(2);
    nums->add(5);
    nums->add(4);
    cout << "Список nums = ";
    vector<int> vec = nums->toVector();
    printVector(vec);
    cout << "вместимость =" << nums->capacity() << ", длина =" << nums->size() << endl;

    /* Вставить элемент в середину */
    nums->insert(3, 6);
    cout << "После вставки числа 6 по индексу 3 получаем nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Удалить элемент */
    nums->remove(3);
    cout << "После удаления элемента по индексу 3 получаем nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Получить доступ к элементу */
    int num = nums->get(1);
    cout << "обратиться киндекс 1 поэлемент, получаем num =" << num << endl;

    /* Обновить элемент */
    nums->set(1, 0);
    cout << "После обновления элемента по индексу 1 на 0 получаем nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Проверить механизм расширения */
    for (int i = 0; i < 10; i++) {
        // При i = 5 длина списка превысит его вместимость, и тогда сработает механизм расширения
        nums->add(i);
    }
    cout << "Список nums после расширения = ";
    vec = nums->toVector();
    printVector(vec);
    cout << "вместимость =" << nums->capacity() << ", длина =" << nums->size() << endl;

    // Освободить память
    delete nums;

    return 0;
}
