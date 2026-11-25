/**
 * File: array_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Очередь на основе кольцевого массива */
class ArrayQueue {
    int[] nums;  // Массив для хранения элементов очереди
    int front;   // Индекс первого элемента очереди
    int queSize; // Длина очереди

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* Получить ёмкость очереди */
    int Capacity() {
        return nums.Length;
    }

    /* Получить длину очереди */
    public int Size() {
        return queSize;
    }

    /* Проверить, пуста ли очередь */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* Добавить элемент в очередь */
    public void Push(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("Очередь заполнена");
            return;
        }
        // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        // При выходе за конец массива операция взятия остатка возвращает rear в начало
        int rear = (front + queSize) % Capacity();
        // Добавить num в конец очереди
        nums[rear] = num;
        queSize++;
    }

    /* Извлечь элемент из очереди */
    public int Pop() {
        int num = Peek();
        // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
        front = (front + 1) % Capacity();
        queSize--;
        return num;
    }

    /* Посмотреть первый элемент очереди */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return nums[front];
    }

    /* Вернуть массив */
    public int[] ToArray() {
        // Преобразовать только те элементы, которые сейчас находятся в очереди
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[j % this.Capacity()];
        }
        return res;
    }
}

public class array_queue {
    [Test]
    public void Test() {
        /* Инициализировать очередь */
        int capacity = 10;
        ArrayQueue queue = new(capacity);

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

        /* Проверить работу кольцевого массива */
        for (int i = 0; i < 10; i++) {
            queue.Push(i);
            queue.Pop();
            Console.WriteLine("В цикле " + i + " после добавления и извлечения элемента queue = " + string.Join(",", queue.ToArray()));
        }
    }
}
