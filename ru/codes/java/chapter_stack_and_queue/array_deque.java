/**
 * File: array_deque.java
 * Created Time: 2023-02-16
 * Author: krahets (krahets@163.com), FangYuan33 (374072213@qq.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Двусторонняя очередь на основе кольцевого массива */
class ArrayDeque {
    private int[] nums; // Массив для хранения элементов двусторонней очереди
    private int front; // Указатель head, указывающий на первый элемент очереди
    private int queSize; // Длина двусторонней очереди

    /* Конструктор */
    public ArrayDeque(int capacity) {
        this.nums = new int[capacity];
        front = queSize = 0;
    }

    /* Получить вместимость двусторонней очереди */
    public int capacity() {
        return nums.length;
    }

    /* Получение длины двусторонней очереди */
    public int size() {
        return queSize;
    }

    /* Проверка, пуста ли двусторонняя очередь */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* Вычислить индекс в кольцевом массиве */
    private int index(int i) {
        // С помощью операции взятия по модулю соединить начало и конец массива
        // Когда i выходит за конец массива, он возвращается в начало
        // Когда i выходит за начало массива, он возвращается в конец
        return (i + capacity()) % capacity();
    }

    /* Добавление в голову очереди */
    public void pushFirst(int num) {
        if (queSize == capacity()) {
            System.out.println("Двусторонняя очередь заполнена");
            return;
        }
        // Указатель головы сдвигается на одну позицию влево
        // С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
        front = index(front - 1);
        // Добавить num в голову очереди
        nums[front] = num;
        queSize++;
    }

    /* Добавление в хвост очереди */
    public void pushLast(int num) {
        if (queSize == capacity()) {
            System.out.println("Двусторонняя очередь заполнена");
            return;
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        int rear = index(front + queSize);
        // Добавить num в хвост очереди
        nums[rear] = num;
        queSize++;
    }

    /* Извлечение из головы очереди */
    public int popFirst() {
        int num = peekFirst();
        // Указатель головы сдвигается на одну позицию назад
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* Извлечение из хвоста очереди */
    public int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* Доступ к элементу в начале очереди */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* Доступ к элементу в конце очереди */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // Вычислить индекс хвостового элемента
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* Вернуть массив для вывода */
    public int[] toArray() {
        // Преобразовывать только элементы списка в пределах фактической длины
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
}

public class array_deque {
    public static void main(String[] args) {
        /* Инициализация двусторонней очереди */
        ArrayDeque deque = new ArrayDeque(10);
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.println("Двусторонняя очередь deque = " + Arrays.toString(deque.toArray()));

        /* Доступ к элементу */
        int peekFirst = deque.peekFirst();
        System.out.println("Первый элемент peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("Последний элемент peekLast = " + peekLast);

        /* Добавление элемента в очередь */
        deque.pushLast(4);
        System.out.println("После добавления элемента 4 в хвост deque = " + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("После добавления элемента 1 в голову deque = " + Arrays.toString(deque.toArray()));

        /* Извлечение элемента из очереди */
        int popLast = deque.popLast();
        System.out.println("Извлеченный из хвоста элемент = " + popLast + ", deque после извлечения из хвоста = " + Arrays.toString(deque.toArray()));
        int popFirst = deque.popFirst();
        System.out.println("Извлеченный из головы элемент = " + popFirst + ", deque после извлечения из головы = " + Arrays.toString(deque.toArray()));

        /* Получение длины двусторонней очереди */
        int size = deque.size();
        System.out.println("Длина двусторонней очереди size = " + size);

        /* Проверка, пуста ли двусторонняя очередь */
        boolean isEmpty = deque.isEmpty();
        System.out.println("Пуста ли двусторонняя очередь = " + isEmpty);
    }
}
