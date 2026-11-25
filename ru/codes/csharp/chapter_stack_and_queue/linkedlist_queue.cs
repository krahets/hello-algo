/**
 * File: linkedlist_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Очередь на основе связного списка */
class LinkedListQueue {
    ListNode? front, rear;  // front — первый узел, rear — последний 
    int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* Получить длину очереди */
    public int Size() {
        return queSize;
    }

    /* Проверить, пуста ли очередь */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Добавить элемент в очередь */
    public void Push(int num) {
        // Добавить узел со значением num после последнего узла
        ListNode node = new(num);
        // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
        if (front == null) {
            front = node;
            rear = node;
            // Если очередь непуста, добавить новый узел после последнего
        } else if (rear != null) {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* Извлечь элемент из очереди */
    public int Pop() {
        int num = Peek();
        // Удалить первый узел
        front = front?.next;
        queSize--;
        return num;
    }

    /* Посмотреть первый элемент очереди */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return front!.val;
    }

    /* Преобразовать связный список в массив и вернуть его */
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
        /* Инициализировать очередь */
        LinkedListQueue queue = new();

        /* Добавить элементы в очередь */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("Очередь queue = " + string.Join(",", queue.ToArray()));

        /* Посмотреть первый элемент очереди */
        int peek = queue.Peek();
        Console.WriteLine("Первый элемент очереди peek = " + peek);

        /* Извлечь элемент из очереди */
        int pop = queue.Pop();
        Console.WriteLine("Извлечённый элемент pop = " + pop + ", после извлечения queue = " + string.Join(",", queue.ToArray()));

        /* Получить длину очереди */
        int size = queue.Size();
        Console.WriteLine("Длина очереди size = " + size);

        /* Проверить, пуста ли очередь */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("Очередь пуста = " + isEmpty);
    }
}
