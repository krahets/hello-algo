/**
 * File: array_deque.java
 * Created Time: 2023-02-16
 * Author: krahets (krahets@163.com), FangYuan33 (374072213@qq.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Двусторонняя очередь на основе циклического массива */
class ArrayDeque {
    private int[] nums; // Массив для хранения элементов двусторонней очереди
    private int front; // Указатель front, указывающий на первый элемент очереди
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

    /* Получить длину двусторонней очереди */
    public int size() {
        return queSize;
    }

    /* Проверить, пуста ли двусторонняя очередь */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* Вычислить индекс циклического массива */
    private int index(int i) {
        // Сделать начало и конец массива циклически связанными с помощью операции взятия по модулю
        // Когда i выходит за конец массива, он возвращается к началу
        // Когда i выходит за начало массива, он возвращается к концу
        return (i + capacity()) % capacity();
    }

    /* Поместить в голову очереди */
    public void pushFirst(int num) {
        if (queSize == capacity()) {
            System.out.println("двусторонняя очередьзаполнен");
            return;
        }
        // Указатель головы очереди сдвигается на одну позицию влево
        // Операция взятия по модулю позволяет front после выхода за начало массива вернуться к его концу
        front = index(front - 1);
        // Добавить num в голову очереди
        nums[front] = num;
        queSize++;
    }

    /* Поместить в хвост очереди */
    public void pushLast(int num) {
        if (queSize == capacity()) {
            System.out.println("двусторонняя очередьзаполнен");
            return;
        }
        // Вычислить указатель хвоста, указывающий на индекс за последним элементом
        int rear = index(front + queSize);
        // Добавить num в конец очереди
        nums[rear] = num;
        queSize++;
    }

    /* Извлечь из головы очереди */
    public int popFirst() {
        int num = peekFirst();
        // Указатель головы очереди сдвигается на одну позицию вперед
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* Извлечь из хвоста очереди */
    public int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* Получить элемент в начале очереди */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* Обратиться к элементу в хвосте очереди */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // Вычислить индекс хвостового элемента
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* Вернуть массив для печати */
    public int[] toArray() {
        // Преобразовать только элементы списка в пределах действительной длины
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
}

public class array_deque {
    public static void main(String[] args) {
        /* Инициализировать двустороннюю очередь */
        ArrayDeque deque = new ArrayDeque(10);
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.println("двусторонняя очередь deque =" + Arrays.toString(deque.toArray()));

        /* Получить доступ к элементу */
        int peekFirst = deque.peekFirst();
        System.out.println("элемент в голове очереди peekFirst =" + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("элемент в хвосте очереди peekLast =" + peekLast);

        /* Поместить элемент в очередь */
        deque.pushLast(4);
        System.out.println("После помещения элемента 4 в хвост очереди deque =" + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("После помещения элемента 1 в голову очереди deque =" + Arrays.toString(deque.toArray()));

        /* Извлечь элемент из очереди */
        int popLast = deque.popLast();
        System.out.println("Элемент, извлеченный из хвоста очереди, =" + popLast + ", deque после извлечения из хвоста =" + Arrays.toString(deque.toArray()));
        int popFirst = deque.popFirst();
        System.out.println("Элемент, извлеченный из головы очереди, =" + popFirst + ", deque после извлечения из головы =" + Arrays.toString(deque.toArray()));

        /* Получить длину двусторонней очереди */
        int size = deque.size();
        System.out.println("Длина двусторонней очереди size =" + size);

        /* Проверить, пуста ли двусторонняя очередь */
        boolean isEmpty = deque.isEmpty();
        System.out.println("двусторонняя Очередь пуста:" + isEmpty);
    }
}
