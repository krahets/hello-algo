/**
 * File: my_list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Класс списка */
class MyList {
  private:
    int *arr;             // Массив (для хранения элементов списка)
    int arrCapacity = 10; // Вместимость списка
    int arrSize = 0;      // Длина списка (текущее число элементов)
    int extendRatio = 2;   // Коэффициент увеличения списка при каждом расширении

  public:
    /* Конструктор */
    MyList() {
        arr = new int[arrCapacity];
    }

    /* Метод-деструктор */
    ~MyList() {
        delete[] arr;
    }

    /* Получить длину списка (текущее число элементов) */
    int size() {
        return arrSize;
    }

    /* Получить вместимость списка */
    int capacity() {
        return arrCapacity;
    }

    /* Доступ к элементу */
    int get(int index) {
        // Если индекс выходит за границы, выбрасывается исключение; далее аналогично
        if (index < 0 || index >= size())
            throw out_of_range("индекс выходит за границы");
        return arr[index];
    }

    /* Обновление элемента */
    void set(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("индекс выходит за границы");
        arr[index] = num;
    }

    /* Добавление элемента в конец */
    void add(int num) {
        // При превышении вместимости по числу элементов запускается расширение
        if (size() == capacity())
            extendCapacity();
        arr[size()] = num;
        // Обновить число элементов
        arrSize++;
    }

    /* Вставка элемента в середину */
    void insert(int index, int num) {
        if (index < 0 || index >= size())
            throw out_of_range("индекс выходит за границы");
        // При превышении вместимости по числу элементов запускается расширение
        if (size() == capacity())
            extendCapacity();
        // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
        for (int j = size() - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Обновить число элементов
        arrSize++;
    }

    /* Удаление элемента */
    int remove(int index) {
        if (index < 0 || index >= size())
            throw out_of_range("индекс выходит за границы");
        int num = arr[index];
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for (int j = index; j < size() - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Обновить число элементов
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
        // Преобразовывать только элементы списка в пределах фактической длины
        vector<int> vec(size());
        for (int i = 0; i < size(); i++) {
            vec[i] = arr[i];
        }
        return vec;
    }
};

/* Driver Code */
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
    cout << "Вместимость = " << nums->capacity() << ", длина = " << nums->size() << endl;

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

    /* Обновление элемента */
    nums->set(1, 0);
    cout << "После обновления элемента по индексу 1 на 0 nums = ";
    vec = nums->toVector();
    printVector(vec);

    /* Проверка механизма расширения */
    for (int i = 0; i < 10; i++) {
        // При i = 5 длина списка превысит его вместимость, и в этот момент сработает механизм расширения
        nums->add(i);
    }
    cout << "После расширения список nums = ";
    vec = nums->toVector();
    printVector(vec);
    cout << "Вместимость = " << nums->capacity() << ", длина = " << nums->size() << endl;

    // Освободить память
    delete nums;

    return 0;
}
