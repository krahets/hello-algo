/**
 * File: array_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Двусторонняя очередь на основе кольцевого массива */
public class ArrayDeque {
    int[] nums;  // Массив для хранения элементов двусторонней очереди
    int front;   // Указатель head, указывающий на первый элемент очереди
    int queSize; // Длина двусторонней очереди

    /* Конструктор */
    public ArrayDeque(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* Получить вместимость двусторонней очереди */
    int Capacity() {
        return nums.Length;
    }

    /* Получение длины двусторонней очереди */
    public int Size() {
        return queSize;
    }

    /* Проверка, пуста ли двусторонняя очередь */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* Вычислить индекс в кольцевом массиве */
    int Index(int i) {
        // С помощью операции взятия по модулю соединить начало и конец массива
        // Когда i выходит за конец массива, он возвращается в начало
        // Когда i выходит за начало массива, он возвращается в конец
        return (i + Capacity()) % Capacity();
    }

    /* Добавление в голову очереди */
    public void PushFirst(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("Двусторонняя очередь заполнена");
            return;
        }
        // Указатель головы сдвигается на одну позицию влево
        // С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
        front = Index(front - 1);
        // Добавить num в голову очереди
        nums[front] = num;
        queSize++;
    }

    /* Добавление в хвост очереди */
    public void PushLast(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("Двусторонняя очередь заполнена");
            return;
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        int rear = Index(front + queSize);
        // Добавить num в хвост очереди
        nums[rear] = num;
        queSize++;
    }

    /* Извлечение из головы очереди */
    public int PopFirst() {
        int num = PeekFirst();
        // Указатель головы сдвигается на одну позицию назад
        front = Index(front + 1);
        queSize--;
        return num;
    }

    /* Извлечение из хвоста очереди */
    public int PopLast() {
        int num = PeekLast();
        queSize--;
        return num;
    }

    /* Доступ к элементу в начале очереди */
    public int PeekFirst() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        return nums[front];
    }

    /* Доступ к элементу в конце очереди */
    public int PeekLast() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        // Вычислить индекс хвостового элемента
        int last = Index(front + queSize - 1);
        return nums[last];
    }

    /* Вернуть массив для вывода */
    public int[] ToArray() {
        // Преобразовывать только элементы списка в пределах фактической длины
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
        /* Инициализация двусторонней очереди */
        ArrayDeque deque = new(10);
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("Двусторонняя очередь deque = " + string.Join(" ", deque.ToArray()));

        /* Доступ к элементу */
        int peekFirst = deque.PeekFirst();
        Console.WriteLine("Первый элемент peekFirst = " + peekFirst);
        int peekLast = deque.PeekLast();
        Console.WriteLine("Последний элемент peekLast = " + peekLast);

        /* Добавление элемента в очередь */
        deque.PushLast(4);
        Console.WriteLine("После добавления элемента 4 в хвост deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("После добавления элемента 1 в голову deque = " + string.Join(" ", deque.ToArray()));

        /* Извлечение элемента из очереди */
        int popLast = deque.PopLast();
        Console.WriteLine("Извлеченный из хвоста элемент = " + popLast + ", deque после извлечения из хвоста = " + string.Join(" ", deque.ToArray()));
        int popFirst = deque.PopFirst();
        Console.WriteLine("Извлеченный из головы элемент = " + popFirst + ", deque после извлечения из головы = " + string.Join(" ", deque.ToArray()));

        /* Получение длины двусторонней очереди */
        int size = deque.Size();
        Console.WriteLine("Длина двусторонней очереди size = " + size);

        /* Проверка, пуста ли двусторонняя очередь */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("Пуста ли двусторонняя очередь = " + isEmpty);
    }
}
