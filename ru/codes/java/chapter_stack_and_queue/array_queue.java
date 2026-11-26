/**
 * File: array_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Очередь на основе кольцевого массива */
class ArrayQueue {
    private int[] nums; // Массив для хранения элементов очереди
    private int front; // Индекс первого элемента очереди
    private int queSize; // Длина очереди

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* Получить ёмкость очереди */
    public int capacity() {
        return nums.length;
    }

    /* Получить длину очереди */
    public int size() {
        return queSize;
    }

    /* Проверить, пуста ли очередь */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* Добавить элемент в очередь */
    public void push(int num) {
        if (queSize == capacity()) {
            System.out.println("Очередь заполнена");
            return;
        }
        // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        // При выходе за конец массива операция взятия остатка возвращает rear в начало
        int rear = (front + queSize) % capacity();
        // Добавить num в конец очереди
        nums[rear] = num;
        queSize++;
    }

    /* Извлечь элемент из очереди */
    public int pop() {
        int num = peek();
        // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
        front = (front + 1) % capacity();
        queSize--;
        return num;
    }

    /* Посмотреть первый элемент очереди */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* Вернуть массив */
    public int[] toArray() {
        // Преобразовать только те элементы, которые сейчас находятся в очереди
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[j % capacity()];
        }
        return res;
    }
}

public class array_queue {
    public static void main(String[] args) {
        /* Инициализировать очередь */
        int capacity = 10;
        ArrayQueue queue = new ArrayQueue(capacity);

        /* Добавить элементы в очередь */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        System.out.println("Очередь queue = " + Arrays.toString(queue.toArray()));

        /* Посмотреть первый элемент очереди */
        int peek = queue.peek();
        System.out.println("Первый элемент очереди peek = " + peek);

        /* Извлечь элемент из очереди */
        int pop = queue.pop();
        System.out.println("Извлечённый элемент pop = " + pop + ", после извлечения queue = " + Arrays.toString(queue.toArray()));

        /* Получить длину очереди */
        int size = queue.size();
        System.out.println("Длина очереди size = " + size);

        /* Проверить, пуста ли очередь */
        boolean isEmpty = queue.isEmpty();
        System.out.println("Очередь пуста = " + isEmpty);

        /* Проверить работу кольцевого массива */
        for (int i = 0; i < 10; i++) {
            queue.push(i);
            queue.pop();
            System.out.println("В цикле " + i + " после добавления и извлечения элемента queue = " + Arrays.toString(queue.toArray()));
        }
    }
}
