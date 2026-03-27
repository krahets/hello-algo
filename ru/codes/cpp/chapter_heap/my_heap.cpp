/**
 * File: my_heap.cpp
 * Created Time: 2023-02-04
 * Author: LoneRanger (836253168@qq.com), what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* Максимальная куча */
class MaxHeap {
  private:
    // Использовать динамический массив, чтобы не учитывать проблему расширения
    vector<int> maxHeap;

    /* Получить индекс левого дочернего узла */
    int left(int i) {
        return 2 * i + 1;
    }

    /* Получить индекс правого дочернего узла */
    int right(int i) {
        return 2 * i + 2;
    }

    /* Получить индекс родительского узла */
    int parent(int i) {
        return (i - 1) / 2; // Округление вниз при делении
    }

    /* Начиная с узла i, выполнить просеивание снизу вверх */
    void siftUp(int i) {
        while (true) {
            // Получение родительского узла для узла i
            int p = parent(i);
            // Завершить heapify, когда «корневой узел уже пройден» или «узел не требует исправления»
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // Поменять два узла местами
            swap(maxHeap[i], maxHeap[p]);
            // Циклическое просеивание вверх
            i = p;
        }
    }

    /* Начиная с узла i, выполнить просеивание сверху вниз */
    void siftDown(int i) {
        while (true) {
            // Определить узел с максимальным значением среди i, l и r и обозначить его как ma
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // Если узел i уже максимален или индексы l и r вне границ, дальнейшее просеивание не требуется, выйти
            if (ma == i)
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // Циклическое просеивание вниз
            i = ma;
        }
    }

  public:
    /* Конструктор, строящий кучу по входному списку */
    MaxHeap(vector<int> nums) {
        // Добавить элементы списка в кучу без изменений
        maxHeap = nums;
        // Выполнить heapify для всех узлов, кроме листовых
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* Получение размера кучи */
    int size() {
        return maxHeap.size();
    }

    /* Проверка, пуста ли куча */
    bool isEmpty() {
        return size() == 0;
    }

    /* Доступ к элементу на вершине кучи */
    int peek() {
        return maxHeap[0];
    }

    /* Добавление элемента в кучу */
    void push(int val) {
        // Добавление узла
        maxHeap.push_back(val);
        // Просеивание снизу вверх
        siftUp(size() - 1);
    }

    /* Извлечение элемента из кучи */
    void pop() {
        // Обработка пустого случая
        if (isEmpty()) {
            throw out_of_range("куча пуста");
        }
        // Поменять корневой узел с самым правым листом местами (поменять первый и последний элементы)
        swap(maxHeap[0], maxHeap[size() - 1]);
        // Удаление узла
        maxHeap.pop_back();
        // Просеивание сверху вниз
        siftDown(0);
    }

    /* Вывести кучу (двоичное дерево) */
    void print() {
        cout << "Массивное представление кучи:";
        printVector(maxHeap);
        cout << "Древовидное представление кучи:" << endl;
        TreeNode *root = vectorToTree(maxHeap);
        printTree(root);
        freeMemoryTree(root);
    }
};

/* Driver Code */
int main() {
    /* Инициализация максимальной кучи */
    vector<int> vec{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap maxHeap(vec);
    cout << "\nПосле построения кучи из входного списка" << endl;
    maxHeap.print();

    /* Получение элемента с вершины кучи */
    int peek = maxHeap.peek();
    cout << "\nВерхний элемент кучи = " << peek << endl;

    /* Добавление элемента в кучу */
    int val = 7;
    maxHeap.push(val);
    cout << "\nПосле добавления элемента " << val << " в кучу" << endl;
    maxHeap.print();

    /* Извлечение элемента с вершины кучи */
    peek = maxHeap.peek();
    maxHeap.pop();
    cout << "\nПосле извлечения верхнего элемента " << peek << " из кучи" << endl;
    maxHeap.print();

    /* Получение размера кучи */
    int size = maxHeap.size();
    cout << "\nКоличество элементов в куче = " << size << endl;

    /* Проверка, пуста ли куча */
    bool isEmpty = maxHeap.isEmpty();
    cout << "\nПуста ли куча: " << isEmpty << endl;

    return 0;
}
