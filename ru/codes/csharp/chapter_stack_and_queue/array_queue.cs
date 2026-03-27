/**
 * File: array_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Очередь на основе кольцевого массива */
class ArrayQueue {
    int[] nums;  // Массив для хранения элементов очереди
    int front;   // Указатель head, указывающий на первый элемент очереди
    int queSize; // Длина очереди

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* Получить вместимость очереди */
    int Capacity() {
        return nums.Length;
    }

    /* Получение длины очереди */
    public int Size() {
        return queSize;
    }

    /* Проверка, пуста ли очередь */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* Поместить в очередь */
    public void Push(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("Очередь заполнена");
            return;
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
        int rear = (front + queSize) % Capacity();
        // Добавить num в хвост очереди
        nums[rear] = num;
        queSize++;
    }

    /* Извлечь из очереди */
    public int Pop() {
        int num = Peek();
        // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
        front = (front + 1) % Capacity();
        queSize--;
        return num;
    }

    /* Доступ к элементу в начале очереди */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return nums[front];
    }

    /* Вернуть массив */
    public int[] ToArray() {
        // Преобразовывать только элементы списка в пределах фактической длины
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
        /* Инициализация очереди */
        int capacity = 10;
        ArrayQueue queue = new(capacity);

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

        /* Проверка кольцевого массива */
        for (int i = 0; i < 10; i++) {
            queue.Push(i);
            queue.Pop();
            Console.WriteLine("После " + i + "-го раунда операций enqueue и dequeue queue = " + string.Join(",", queue.ToArray()));
        }
    }
}
