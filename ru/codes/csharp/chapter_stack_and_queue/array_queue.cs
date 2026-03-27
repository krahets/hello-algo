/**
 * File: array_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Очередь на основе циклического массива */
class ArrayQueue {
    int[] nums;  // Массив для хранения элементов очереди
    int front;   // Указатель front, указывающий на первый элемент очереди
    int queSize; // Длина очереди

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* Получить вместимость очереди */
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

    /* Поместить в очередь */
    public void Push(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("Очередь заполнена");
            return;
        }
        // Вычислить указатель хвоста очереди, указывающий на индекс хвоста + 1
        // Операция взятия по модулю позволяет rear после выхода за конец массива вернуться к его началу
        int rear = (front + queSize) % Capacity();
        // Добавить num в конец очереди
        nums[rear] = num;
        queSize++;
    }

    /* Извлечь из очереди */
    public int Pop() {
        int num = Peek();
        // Указатель головы очереди сдвигается на одну позицию вперед; если он выходит за конец, то возвращается в начало массива
        front = (front + 1) % Capacity();
        queSize--;
        return num;
    }

    /* Получить элемент в начале очереди */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return nums[front];
    }

    /* Вернутьмассив */
    public int[] ToArray() {
        // Преобразовать только элементы списка в пределах действительной длины
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

        /* Поместить элемент в очередь */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("Очередь queue = " + string.Join(",", queue.ToArray()));

        /* Получить элемент в начале очереди */
        int peek = queue.Peek();
        Console.WriteLine("голова очередиэлемент peek =" + peek);

        /* Извлечь элемент из очереди */
        int pop = queue.Pop();
        Console.WriteLine("Элемент, извлеченный из очереди, pop = " + pop + ", queue после извлечения = " + string.Join(",", queue.ToArray()));

        /* Получить длину очереди */
        int size = queue.Size();
        Console.WriteLine("Длина очереди size =" + size);

        /* Проверить, пуста ли очередь */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("Очередь пуста: " + isEmpty);

        /* Проверить кольцевой массив */
        for (int i = 0; i < 10; i++) {
            queue.Push(i);
            queue.Pop();
            Console.WriteLine("Итерация" + i + ": после enqueue + dequeue queue =" + string.Join(",", queue.ToArray()));
        }
    }
}
