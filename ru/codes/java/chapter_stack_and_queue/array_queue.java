/**
 * File: array_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Очередь на основе циклического массива */
class ArrayQueue {
    private int[] nums; // Массив для хранения элементов очереди
    private int front; // Указатель front, указывающий на первый элемент очереди
    private int queSize; // Длина очереди

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* Получить вместимость очереди */
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

    /* Поместить в очередь */
    public void push(int num) {
        if (queSize == capacity()) {
            System.out.println("очередьзаполнен");
            return;
        }
        // Вычислить указатель хвоста очереди, указывающий на индекс хвоста + 1
        // Операция взятия по модулю позволяет rear после выхода за конец массива вернуться к его началу
        int rear = (front + queSize) % capacity();
        // Добавить num в конец очереди
        nums[rear] = num;
        queSize++;
    }

    /* Извлечь из очереди */
    public int pop() {
        int num = peek();
        // Указатель головы очереди сдвигается на одну позицию вперед; если он выходит за конец, то возвращается в начало массива
        front = (front + 1) % capacity();
        queSize--;
        return num;
    }

    /* Получить элемент в начале очереди */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* Вернутьмассив */
    public int[] toArray() {
        // Преобразовать только элементы списка в пределах действительной длины
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

        /* Поместить элемент в очередь */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        System.out.println("очередь queue =" + Arrays.toString(queue.toArray()));

        /* Получить элемент в начале очереди */
        int peek = queue.peek();
        System.out.println("элемент в голове очереди peek =" + peek);

        /* Извлечь элемент из очереди */
        int pop = queue.pop();
        System.out.println("Элемент, извлеченный из очереди, pop =" + pop + ", queue после извлечения =" + Arrays.toString(queue.toArray()));

        /* Получить длину очереди */
        int size = queue.size();
        System.out.println("Длина очереди size =" + size);

        /* Проверить, пуста ли очередь */
        boolean isEmpty = queue.isEmpty();
        System.out.println("очередьпуст ли =" + isEmpty);

        /* Проверить кольцевой массив */
        for (int i = 0; i < 10; i++) {
            queue.push(i);
            queue.pop();
            System.out.println("Итерация" + i + ": после enqueue + dequeue queue =" + Arrays.toString(queue.toArray()));
        }
    }
}
