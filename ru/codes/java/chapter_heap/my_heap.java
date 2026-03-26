/**
 * File: my_heap.java
 * Created Time: 2023-01-07
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

/* Max-куча */
class MaxHeap {
    // Использовать список вместо массива, чтобы не учитывать проблему расширения
    private List<Integer> maxHeap;

    /* Конструктор, создающий кучу по входному списку */
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

    /* Получить размер кучи */
    public int size() {
        return maxHeap.size();
    }

    /* Проверить, пуста ли куча */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Обратиться к элементу на вершине кучи */
    public int peek() {
        return maxHeap.get(0);
    }

    /* Добавить элемент в кучу */
    public void push(int val) {
        // Добавить узел
        maxHeap.add(val);
        // Выполнить heapify снизу вверх
        siftUp(size() - 1);
    }

    /* Начиная с узла i, выполнить просеивание снизу вверх */
    private void siftUp(int i) {
        while (true) {
            // Получить родительский узел для узла i
            int p = parent(i);
            // Завершить просеивание, когда произошел выход за корень или узел не нуждается в исправлении
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // Поменять местами два узла
            swap(i, p);
            // Циклически выполнять просеивание вверх
            i = p;
        }
    }

    /* Извлечение элемента из кучи */
    public int pop() {
        // Обработка пустого случая
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // Поменять местами корневой узел и крайний правый лист (первый и последний элементы)
        swap(0, size() - 1);
        // Удалить узел
        int val = maxHeap.remove(size() - 1);
        // Выполнить heapify сверху вниз
        siftDown(0);
        // Вернуть элемент на вершине кучи
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
            // Если узел i уже максимален или индексы l и r выходят за границы, дальнейшая heapify не требуется
            if (ma == i)
                break;
            // Поменять местами два узла
            swap(i, ma);
            // Циклически выполнять просеивание вниз
            i = ma;
        }
    }

    /* Вывести кучу (в виде двоичного дерева) */
    public void print() {
        Queue<Integer> queue = new PriorityQueue<>((a, b) -> { return b - a; });
        queue.addAll(maxHeap);
        PrintUtil.printHeap(queue);
    }
}

public class my_heap {
    public static void main(String[] args) {
        /* Инициализировать max-кучу */
        MaxHeap maxHeap = new MaxHeap(Arrays.asList(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2));
        System.out.println("\nВходной список и построение кучипосле");
        maxHeap.print();

        /* Получить верхний элемент кучи */
        int peek = maxHeap.peek();
        System.out.format("\nЭлемент на вершине кучи равен %d\n", peek);

        /* Добавить элемент в кучу */
        int val = 7;
        maxHeap.push(val);
        System.out.format("\nЭлемент %d после добавления в кучу\n", val);
        maxHeap.print();

        /* Извлечь верхний элемент из кучи */
        peek = maxHeap.pop();
        System.out.format("\nвершина кучиЭлемент %d после извлечения из кучи\n", peek);
        maxHeap.print();

        /* Получить размер кучи */
        int size = maxHeap.size();
        System.out.format("\nКоличество элементов в куче равно %d\n", size);

        /* Проверить, пуста ли куча */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nКуча пуста: %b\n", isEmpty);
    }
}
