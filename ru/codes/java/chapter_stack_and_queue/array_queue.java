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
    private int front; // Указатель head, указывающий на первый элемент очереди
    private int queSize; // Длина очереди

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* Получить вместимость очереди */
    public int capacity() {
        return nums.length;
    }

    /* Получение длины очереди */
    public int size() {
        return queSize;
    }

    /* Проверка, пуста ли очередь */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* Поместить в очередь */
    public void push(int num) {
        if (queSize == capacity()) {
            System.out.println("Очередь заполнена");
            return;
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
        int rear = (front + queSize) % capacity();
        // Добавить num в хвост очереди
        nums[rear] = num;
        queSize++;
    }

    /* Извлечь из очереди */
    public int pop() {
        int num = peek();
        // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
        front = (front + 1) % capacity();
        queSize--;
        return num;
    }

    /* Доступ к элементу в начале очереди */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* Вернуть массив */
    public int[] toArray() {
        // Преобразовывать только элементы списка в пределах фактической длины
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[j % capacity()];
        }
        return res;
    }
}

public class array_queue {
    public static void main(String[] args) {
        /* Инициализация очереди */
        int capacity = 10;
        ArrayQueue queue = new ArrayQueue(capacity);

        /* Добавление элемента в очередь */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        System.out.println("Очередь queue = " + Arrays.toString(queue.toArray()));

        /* Доступ к элементу в начале очереди */
        int peek = queue.peek();
        System.out.println("Первый элемент peek = " + peek);

        /* Извлечение элемента из очереди */
        int pop = queue.pop();
        System.out.println("Извлеченный элемент pop = " + pop + ", queue после извлечения = " + Arrays.toString(queue.toArray()));

        /* Получение длины очереди */
        int size = queue.size();
        System.out.println("Длина очереди size = " + size);

        /* Проверка, пуста ли очередь */
        boolean isEmpty = queue.isEmpty();
        System.out.println("Пуста ли очередь = " + isEmpty);

        /* Проверка кольцевого массива */
        for (int i = 0; i < 10; i++) {
            queue.push(i);
            queue.pop();
            System.out.println("После " + i + "-го раунда операций enqueue и dequeue queue = " + Arrays.toString(queue.toArray()));
        }
    }
}
