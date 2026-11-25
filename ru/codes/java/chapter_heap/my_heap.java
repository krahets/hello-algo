/**
 * File: my_heap.java
 * Created Time: 2023-01-07
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

/* Макс-куча */
class MaxHeap {
    // Список, в отличие от массива, расширяется автоматически
    private List<Integer> maxHeap;

    /* Конструктор кучи по входному списку */
    public MaxHeap(List<Integer> nums) {
        // Поместить элементы списка в кучу в прежнем порядке
        maxHeap = new ArrayList<>(nums);
        // Выполнить просеивание для всех узлов, кроме листьев
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* Индекс левого ребёнка */
    private int left(int i) {
        return 2 * i + 1;
    }

    /* Индекс правого ребёнка */
    private int right(int i) {
        return 2 * i + 2;
    }

    /* Индекс родителя */
    private int parent(int i) {
        return (i - 1) / 2; // Целочисленное деление с округлением вниз
    }

    /* Поменять элементы местами */
    private void swap(int i, int j) {
        int tmp = maxHeap.get(i);
        maxHeap.set(i, maxHeap.get(j));
        maxHeap.set(j, tmp);
    }

    /* Размер кучи */
    public int size() {
        return maxHeap.size();
    }

    /* Проверить, пуста ли куча */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Посмотреть элемент в корне */
    public int peek() {
        return maxHeap.get(0);
    }

    /* Вставить элемент в кучу */
    public void push(int val) {
        // Добавить узел
        maxHeap.add(val);
        // Просеивание вверх
        siftUp(size() - 1);
    }

    /* Просеивать вверх от узла i */
    private void siftUp(int i) {
        while (true) {
            // Найти родителя узла i
            int p = parent(i);
            // Если вышли за корень или узел уже на своём месте, завершить просеивание
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // Поменять два узла местами
            swap(i, p);
            // Продолжить просеивание вверх
            i = p;
        }
    }

    /* Извлечь элемент из кучи */
    public int pop() {
        // Проверить, пуста ли куча
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // Поменять местами корень и крайний правый лист (первый и последний элементы)
        swap(0, size() - 1);
        // Удалить узел
        int val = maxHeap.remove(size() - 1);
        // Просеивание вниз
        siftDown(0);
        // Вернуть элемент из корня
        return val;
    }

    /* Просеивать вниз от узла i */
    private void siftDown(int i) {
        while (true) {
            // Сохранить в ma индекс наибольшего из узлов i, l и r
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // Если i уже наибольший или оба индекса l и r вне диапазона, завершить просеивание
            if (ma == i)
                break;
            // Поменять два узла местами
            swap(i, ma);
            // Продолжить просеивание вниз
            i = ma;
        }
    }

    /* Вывести кучу в виде бинарного дерева */
    public void print() {
        Queue<Integer> queue = new PriorityQueue<>((a, b) -> { return b - a; });
        queue.addAll(maxHeap);
        PrintUtil.printHeap(queue);
    }
}

public class my_heap {
    public static void main(String[] args) {
        /* Инициализировать макс-кучу */
        MaxHeap maxHeap = new MaxHeap(Arrays.asList(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2));
        System.out.println("\nКуча, построенная по входному списку:");
        maxHeap.print();

        /* Получить элемент в корне */
        int peek = maxHeap.peek();
        System.out.format("\nЭлемент в корне: %d\n", peek);

        /* Вставить элемент в кучу */
        int val = 7;
        maxHeap.push(val);
        System.out.format("\nПосле вставки элемента %d:\n", val);
        maxHeap.print();

        /* Извлечь элемент из корня */
        peek = maxHeap.pop();
        System.out.format("\nПосле извлечения элемента %d из корня:\n", peek);
        maxHeap.print();

        /* Размер кучи */
        int size = maxHeap.size();
        System.out.format("\nЧисло элементов в куче: %d\n", size);

        /* Проверить, пуста ли куча */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nПуста ли куча: %b\n", isEmpty);
    }
}
