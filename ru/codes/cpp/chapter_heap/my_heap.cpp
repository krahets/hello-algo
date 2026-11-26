/**
 * File: my_heap.cpp
 * Created Time: 2023-02-04
 * Author: LoneRanger (836253168@qq.com), what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* Макс-куча */
class MaxHeap {
  private:
    // Динамический массив расширяется автоматически
    vector<int> maxHeap;

    /* Индекс левого ребёнка */
    int left(int i) {
        return 2 * i + 1;
    }

    /* Индекс правого ребёнка */
    int right(int i) {
        return 2 * i + 2;
    }

    /* Индекс родителя */
    int parent(int i) {
        return (i - 1) / 2; // Целочисленное деление с округлением вниз
    }

    /* Просеивать вверх от узла i */
    void siftUp(int i) {
        while (true) {
            // Найти родителя узла i
            int p = parent(i);
            // Если вышли за корень или узел уже на своём месте, завершить просеивание
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // Поменять два узла местами
            swap(maxHeap[i], maxHeap[p]);
            // Продолжить просеивание вверх
            i = p;
        }
    }

    /* Просеивать вниз от узла i */
    void siftDown(int i) {
        while (true) {
            // Сохранить в ma индекс наибольшего из узлов i, l и r
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // Если ни у одного потомка значение не больше, чем у родителя, завершить просеивание
            if (ma == i)
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // Продолжить просеивание вниз
            i = ma;
        }
    }

  public:
    /* Конструктор кучи по входному списку */
    MaxHeap(vector<int> nums) {
        // Поместить элементы списка в кучу в прежнем порядке
        maxHeap = nums;
        // Выполнить просеивание для всех узлов, кроме листьев
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* Размер кучи */
    int size() {
        return maxHeap.size();
    }

    /* Проверить, пуста ли куча */
    bool isEmpty() {
        return size() == 0;
    }

    /* Посмотреть элемент в корне */
    int peek() {
        return maxHeap[0];
    }

    /* Вставить элемент в кучу */
    void push(int val) {
        // Добавить узел
        maxHeap.push_back(val);
        // Просеивание вверх
        siftUp(size() - 1);
    }

    /* Извлечь элемент из кучи */
    void pop() {
        // Проверить, пуста ли куча
        if (isEmpty()) {
            throw out_of_range("Куча пуста");
        }
        // Поменять местами корень и крайний правый лист (первый и последний элементы)
        swap(maxHeap[0], maxHeap[size() - 1]);
        // Удалить узел
        maxHeap.pop_back();
        // Просеивание вниз
        siftDown(0);
    }

    /* Вывести кучу в виде бинарного дерева*/
    void print() {
        cout << "Куча в виде массива:";
        printVector(maxHeap);
        cout << "Куча в виде дерева:" << endl;
        TreeNode *root = vectorToTree(maxHeap);
        printTree(root);
        freeMemoryTree(root);
    }
};

/* Пример использования */
int main() {
    /* Инициализировать макс-кучу */
    vector<int> vec{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap maxHeap(vec);
    cout << "\nКуча, построенная по входному списку:" << endl;
    maxHeap.print();

    /* Получить элемент в корне */
    int peek = maxHeap.peek();
    cout << "\nЭлемент в корне: " << peek << endl;

    /* Вставить элемент в кучу */
    int val = 7;
    maxHeap.push(val);
    cout << "\nЭлемент " << val << " добавлен в кучу:" << endl;
    maxHeap.print();

    /* Извлечь элемент из корня */
    peek = maxHeap.peek();
    maxHeap.pop();
    cout << "\nЭлемент " << peek << " извлечён из корня:" << endl;
    maxHeap.print();

    /* Размер кучи */
    int size = maxHeap.size();
    cout << "\nЧисло элементов в куче: " << size << endl;

    /* Проверить, пуста ли куча */
    bool isEmpty = maxHeap.isEmpty();
    cout << "\nПуста ли куча: " << isEmpty << endl;

    return 0;
}
