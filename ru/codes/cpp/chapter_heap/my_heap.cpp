/**
 * File: my_heap.cpp
 * Created Time: 2023-02-04
 * Author: LoneRanger (836253168@qq.com), what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* Max-куча */
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
            // Получить родительский узел для узла i
            int p = parent(i);
            // Завершить просеивание, когда произошел выход за корень или узел не нуждается в исправлении
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // Поменять местами два узла
            swap(maxHeap[i], maxHeap[p]);
            // Циклически выполнять просеивание вверх
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
            // Если узел i уже максимален или индексы l и r выходят за границы, дальнейшая heapify не требуется
            if (ma == i)
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // Циклически выполнять просеивание вниз
            i = ma;
        }
    }

  public:
    /* Конструктор, создающий кучу по входному списку */
    MaxHeap(vector<int> nums) {
        // Добавить элементы списка в кучу без изменений
        maxHeap = nums;
        // Выполнить heapify для всех узлов, кроме листовых
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* Получить размер кучи */
    int size() {
        return maxHeap.size();
    }

    /* Проверить, пуста ли куча */
    bool isEmpty() {
        return size() == 0;
    }

    /* Обратиться к элементу на вершине кучи */
    int peek() {
        return maxHeap[0];
    }

    /* Добавить элемент в кучу */
    void push(int val) {
        // Добавить узел
        maxHeap.push_back(val);
        // Выполнить heapify снизу вверх
        siftUp(size() - 1);
    }

    /* Извлечение элемента из кучи */
    void pop() {
        // Обработка пустого случая
        if (isEmpty()) {
            throw out_of_range("кучапуст");
        }
        // Поменять местами корневой узел и крайний правый лист (первый и последний элементы)
        swap(maxHeap[0], maxHeap[size() - 1]);
        // Удалить узел
        maxHeap.pop_back();
        // Выполнить heapify сверху вниз
        siftDown(0);
    }

    /* Вывести кучу (в виде двоичного дерева) */
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
    /* Инициализировать max-кучу */
    vector<int> vec{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap maxHeap(vec);
    cout << "\nПосле построения кучи по входному списку" << endl;
    maxHeap.print();

    /* Получить верхний элемент кучи */
    int peek = maxHeap.peek();
    cout << "\nЭлемент на вершине кучи равен " << peek << endl;

    /* Добавить элемент в кучу */
    int val = 7;
    maxHeap.push(val);
    cout << "\nПосле добавления элемента " << val << " в кучу" << endl;
    maxHeap.print();

    /* Извлечь верхний элемент из кучи */
    peek = maxHeap.peek();
    maxHeap.pop();
    cout << "\nПосле извлечения верхнего элемента " << peek << " из кучи" << endl;
    maxHeap.print();

    /* Получить размер кучи */
    int size = maxHeap.size();
    cout << "\nКоличество элементов в куче равно " << size << endl;

    /* Проверить, пуста ли куча */
    bool isEmpty = maxHeap.isEmpty();
    cout << "\nкучапуст ли" << isEmpty << endl;

    return 0;
}
