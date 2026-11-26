/**
 * File: array_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Двусторонняя очередь (дек) на основе кольцевого массива */
public class ArrayDeque {
    int[] nums;  // Массив для хранения элементов дека
    int front;   // Индекс первого элемента дека
    int queSize; // Длина дека

    /* Конструктор */
    public ArrayDeque(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* Получить ёмкость дека */
    int Capacity() {
        return nums.Length;
    }

    /* Получить длину дека */
    public int Size() {
        return queSize;
    }

    /* Проверить, пуст ли дек */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* Вычислить индекс в кольцевом массиве */
    int Index(int i) {
        // Операция взятия остатка связывает конец массива с его началом
        // Если индекс i выходит за конец массива, отсчёт продолжается с начала
        // Если индекс i выходит за начало массива, отсчёт продолжается с конца
        return (i + Capacity()) % Capacity();
    }

    /* Добавить элемент в начало дека */
    public void PushFirst(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("Дек заполнен");
            return;
        }
        // Сдвинуть индекс начала дека на одну позицию влево
        // При выходе за начало массива операция взятия остатка возвращает front в конец
        front = Index(front - 1);
        // Добавить num в начало дека
        nums[front] = num;
        queSize++;
    }

    /* Добавить элемент в конец дека */
    public void PushLast(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("Дек заполнен");
            return;
        }
        // Вычислить индекс вставки в конец дека: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        int rear = Index(front + queSize);
        // Добавить num в конец дека
        nums[rear] = num;
        queSize++;
    }

    /* Извлечь элемент из начала дека */
    public int PopFirst() {
        int num = PeekFirst();
        // Сдвинуть индекс начала дека на одну позицию вперёд
        front = Index(front + 1);
        queSize--;
        return num;
    }

    /* Извлечь элемент из конца дека */
    public int PopLast() {
        int num = PeekLast();
        queSize--;
        return num;
    }

    /* Посмотреть первый элемент дека */
    public int PeekFirst() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        return nums[front];
    }

    /* Посмотреть последний элемент дека */
    public int PeekLast() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        // Вычислить индекс последнего элемента
        int last = Index(front + queSize - 1);
        return nums[last];
    }

    /* Вернуть массив для вывода */
    public int[] ToArray() {
        // Преобразовать только те элементы, которые сейчас находятся в деке
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[Index(j)];
        }
        return res;
    }
}

public class array_deque {
    [Test]
    public void Test() {
        /* Инициализировать дек */
        ArrayDeque deque = new(10);
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("Дек deque = " + string.Join(" ", deque.ToArray()));

        /* Посмотреть первый и последний элементы */
        int peekFirst = deque.PeekFirst();
        Console.WriteLine("Первый элемент дека peekFirst = " + peekFirst);
        int peekLast = deque.PeekLast();
        Console.WriteLine("Последний элемент дека peekLast = " + peekLast);

        /* Добавить элементы в дек */
        deque.PushLast(4);
        Console.WriteLine("После добавления 4 в конец дека deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("После добавления 1 в начало дека deque = " + string.Join(" ", deque.ToArray()));

        /* Извлечь элементы из дека */
        int popLast = deque.PopLast();
        Console.WriteLine("Извлечённый последний элемент = " + popLast + ", после извлечения из конца deque = " + string.Join(" ", deque.ToArray()));
        int popFirst = deque.PopFirst();
        Console.WriteLine("Извлечённый первый элемент = " + popFirst + ", после извлечения из начала deque = " + string.Join(" ", deque.ToArray()));

        /* Получить длину дека */
        int size = deque.Size();
        Console.WriteLine("Длина дека size = " + size);

        /* Проверить, пуст ли дек */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("Дек пуст = " + isEmpty);
    }
}
