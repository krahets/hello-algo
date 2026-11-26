/**
 * File: array_deque.java
 * Created Time: 2023-02-16
 * Author: krahets (krahets@163.com), FangYuan33 (374072213@qq.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Двусторонняя очередь (дек) на основе кольцевого массива */
class ArrayDeque {
    private int[] nums; // Массив для хранения элементов дека
    private int front; // Индекс первого элемента дека
    private int queSize; // Длина дека

    /* Конструктор */
    public ArrayDeque(int capacity) {
        this.nums = new int[capacity];
        front = queSize = 0;
    }

    /* Получить ёмкость дека */
    public int capacity() {
        return nums.length;
    }

    /* Получить длину дека */
    public int size() {
        return queSize;
    }

    /* Проверить, пуст ли дек */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* Вычислить индекс в кольцевом массиве */
    private int index(int i) {
        // Операция взятия остатка связывает конец массива с его началом
        // Если индекс i выходит за конец массива, отсчёт продолжается с начала
        // Если индекс i выходит за начало массива, отсчёт продолжается с конца
        return (i + capacity()) % capacity();
    }

    /* Добавить элемент в начало дека */
    public void pushFirst(int num) {
        if (queSize == capacity()) {
            System.out.println("Дек заполнен");
            return;
        }
        // Сдвинуть индекс начала дека на одну позицию влево
        // При выходе за начало массива операция взятия остатка возвращает front в конец
        front = index(front - 1);
        // Добавить num в начало дека
        nums[front] = num;
        queSize++;
    }

    /* Добавить элемент в конец дека */
    public void pushLast(int num) {
        if (queSize == capacity()) {
            System.out.println("Дек заполнен");
            return;
        }
        // Вычислить индекс вставки в конец дека: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        int rear = index(front + queSize);
        // Добавить num в конец дека
        nums[rear] = num;
        queSize++;
    }

    /* Извлечь элемент из начала дека */
    public int popFirst() {
        int num = peekFirst();
        // Сдвинуть индекс начала дека на одну позицию вперёд
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* Извлечь элемент из конца дека */
    public int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* Посмотреть первый элемент дека */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* Посмотреть последний элемент дека */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // Вычислить индекс последнего элемента
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* Вернуть массив для вывода */
    public int[] toArray() {
        // Преобразовать только те элементы, которые сейчас находятся в деке
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
}

public class array_deque {
    public static void main(String[] args) {
        /* Инициализировать дек */
        ArrayDeque deque = new ArrayDeque(10);
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.println("Дек deque = " + Arrays.toString(deque.toArray()));

        /* Посмотреть первый и последний элементы */
        int peekFirst = deque.peekFirst();
        System.out.println("Первый элемент дека peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("Последний элемент дека peekLast = " + peekLast);

        /* Добавить элементы в дек */
        deque.pushLast(4);
        System.out.println("После добавления 4 в конец дека deque = " + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("После добавления 1 в начало дека deque = " + Arrays.toString(deque.toArray()));

        /* Извлечь элементы из дека */
        int popLast = deque.popLast();
        System.out.println("Извлечённый последний элемент = " + popLast + ", после извлечения из конца deque = " + Arrays.toString(deque.toArray()));
        int popFirst = deque.popFirst();
        System.out.println("Извлечённый первый элемент = " + popFirst + ", после извлечения из начала deque = " + Arrays.toString(deque.toArray()));

        /* Получить длину дека */
        int size = deque.size();
        System.out.println("Длина дека size = " + size);

        /* Проверить, пуст ли дек */
        boolean isEmpty = deque.isEmpty();
        System.out.println("Дек пуст = " + isEmpty);
    }
}
