/**
 * File: my_heap.java
 * Created Time: 2023-01-07
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

/* Максимальная куча */
class MaxHeap {
    // Использовать список вместо массива, чтобы не учитывать проблему расширения
    private List<Integer> maxHeap;

    /* Конструктор, строящий кучу по входному списку */
    public MaxHeap(List<Integer> nums) {
        // Добавить элементы списка в кучу без изменений
        maxHeap = new ArrayList<>(nums);
        // Выполнить heapify для всех узлов, кроме листовых
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* Получить индекс левого дочернего узла */
    private int left(int i) {
        return 2 * i + 1;
    }

    /* Получить индекс правого дочернего узла */
    private int right(int i) {
        return 2 * i + 2;
    }

    /* Получить индекс родительского узла */
    private int parent(int i) {
        return (i - 1) / 2; // Округление вниз при делении
    }

    /* Поменять элементы местами */
    private void swap(int i, int j) {
        int tmp = maxHeap.get(i);
        maxHeap.set(i, maxHeap.get(j));
        maxHeap.set(j, tmp);
    }

    /* Получение размера кучи */
    public int size() {
        return maxHeap.size();
    }

    /* Проверка, пуста ли куча */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Доступ к элементу на вершине кучи */
    public int peek() {
        return maxHeap.get(0);
    }

    /* Добавление элемента в кучу */
    public void push(int val) {
        // Добавление узла
        maxHeap.add(val);
        // Просеивание снизу вверх
        siftUp(size() - 1);
    }

    /* Начиная с узла i, выполнить просеивание снизу вверх */
    private void siftUp(int i) {
        while (true) {
            // Получение родительского узла для узла i
            int p = parent(i);
            // Завершить heapify, когда «корневой узел уже пройден» или «узел не требует исправления»
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // Поменять два узла местами
            swap(i, p);
            // Циклическое просеивание вверх
            i = p;
        }
    }

    /* Извлечение элемента из кучи */
    public int pop() {
        // Обработка пустого случая
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // Поменять корневой узел с самым правым листом местами (поменять первый и последний элементы)
        swap(0, size() - 1);
        // Удаление узла
        int val = maxHeap.remove(size() - 1);
        // Просеивание сверху вниз
        siftDown(0);
        // Вернуть элемент с вершины кучи
        return val;
    }

    /* Начиная с узла i, выполнить просеивание сверху вниз */
    private void siftDown(int i) {
        while (true) {
            // Определить узел с максимальным значением среди i, l и r и обозначить его как ma
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // Если узел i уже максимален или индексы l и r вне границ, дальнейшее просеивание не требуется, выйти
            if (ma == i)
                break;
            // Поменять два узла местами
            swap(i, ma);
            // Циклическое просеивание вниз
            i = ma;
        }
    }

    /* Вывести кучу (двоичное дерево) */
    public void print() {
        Queue<Integer> queue = new PriorityQueue<>((a, b) -> { return b - a; });
        queue.addAll(maxHeap);
        PrintUtil.printHeap(queue);
    }
}

public class my_heap {
    public static void main(String[] args) {
        /* Инициализация максимальной кучи */
        MaxHeap maxHeap = new MaxHeap(Arrays.asList(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2));
        System.out.println("\nПосле построения кучи из входного списка");
        maxHeap.print();

        /* Получение элемента с вершины кучи */
        int peek = maxHeap.peek();
        System.out.format("\nЭлемент на вершине кучи = %d\n", peek);

        /* Добавление элемента в кучу */
        int val = 7;
        maxHeap.push(val);
        System.out.format("\nПосле добавления элемента %d в кучу\n", val);
        maxHeap.print();

        /* Извлечение элемента с вершины кучи */
        peek = maxHeap.pop();
        System.out.format("\nПосле удаления элемента %d с вершины кучи\n", peek);
        maxHeap.print();

        /* Получение размера кучи */
        int size = maxHeap.size();
        System.out.format("\nКоличество элементов в куче = %d\n", size);

        /* Проверка, пуста ли куча */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nПуста ли куча: %b\n", isEmpty);
    }
}
