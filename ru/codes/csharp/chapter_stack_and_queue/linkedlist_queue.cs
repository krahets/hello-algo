/**
 * File: linkedlist_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Очередь на основе связного списка */
class LinkedListQueue {
    ListNode? front, rear;  // Головной узел front, хвостовой узел rear
    int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* Получение длины очереди */
    public int Size() {
        return queSize;
    }

    /* Проверка, пуста ли очередь */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Поместить в очередь */
    public void Push(int num) {
        // Добавить num после хвостового узла
        ListNode node = new(num);
        // Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
        if (front == null) {
            front = node;
            rear = node;
            // Если очередь не пуста, добавить этот узел после хвостового узла
        } else if (rear != null) {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* Извлечь из очереди */
    public int Pop() {
        int num = Peek();
        // Удалить головной узел
        front = front?.next;
        queSize--;
        return num;
    }

    /* Доступ к элементу в начале очереди */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return front!.val;
    }

    /* Преобразовать связный список в Array и вернуть */
    public int[] ToArray() {
        if (front == null)
            return [];

        ListNode? node = front;
        int[] res = new int[Size()];
        for (int i = 0; i < res.Length; i++) {
            res[i] = node!.val;
            node = node.next;
        }
        return res;
    }
}

public class linkedlist_queue {
    [Test]
    public void Test() {
        /* Инициализация очереди */
        LinkedListQueue queue = new();

        /* Добавление элемента в очередь */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("Очередь queue = " + string.Join(",", queue.ToArray()));

        /* Доступ к элементу в начале очереди */
        int peek = queue.Peek();
        Console.WriteLine("Первый элемент peek = " + peek);

        /* Извлечение элемента из очереди */
        int pop = queue.Pop();
        Console.WriteLine("Извлеченный элемент pop = " + pop + ", queue после извлечения = " + string.Join(",", queue.ToArray()));

        /* Получение длины очереди */
        int size = queue.Size();
        Console.WriteLine("Длина очереди size = " + size);

        /* Проверка, пуста ли очередь */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("Пуста ли очередь = " + isEmpty);
    }
}
