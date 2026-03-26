/**
 * File: array_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Двусторонняя очередь на основе циклического массива */
public class ArrayDeque {
    int[] nums;  // Массив для хранения элементов двусторонней очереди
    int front;   // Указатель front, указывающий на первый элемент очереди
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

    /* Получить длину двусторонней очереди */
    public int Size() {
        return queSize;
    }

    /* Проверить, пуста ли двусторонняя очередь */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* Вычислить индекс циклического массива */
    int Index(int i) {
        // Сделать начало и конец массива циклически связанными с помощью операции взятия по модулю
        // Когда i выходит за конец массива, он возвращается к началу
        // Когда i выходит за начало массива, он возвращается к концу
        return (i + Capacity()) % Capacity();
    }

    /* Поместить в голову очереди */
    public void PushFirst(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("двусторонняя очередьзаполнен");
            return;
        }
        // Указатель головы очереди сдвигается на одну позицию влево
        // Операция взятия по модулю позволяет front после выхода за начало массива вернуться к его концу
        front = Index(front - 1);
        // Добавить num в голову очереди
        nums[front] = num;
        queSize++;
    }

    /* Поместить в хвост очереди */
    public void PushLast(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("двусторонняя очередьзаполнен");
            return;
        }
        // Вычислить указатель хвоста, указывающий на индекс за последним элементом
        int rear = Index(front + queSize);
        // Добавить num в конец очереди
        nums[rear] = num;
        queSize++;
    }

    /* Извлечь из головы очереди */
    public int PopFirst() {
        int num = PeekFirst();
        // Указатель головы очереди сдвигается на одну позицию вперед
        front = Index(front + 1);
        queSize--;
        return num;
    }

    /* Извлечь из хвоста очереди */
    public int PopLast() {
        int num = PeekLast();
        queSize--;
        return num;
    }

    /* Получить элемент в начале очереди */
    public int PeekFirst() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        return nums[front];
    }

    /* Обратиться к элементу в хвосте очереди */
    public int PeekLast() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        // Вычислить индекс хвостового элемента
        int last = Index(front + queSize - 1);
        return nums[last];
    }

    /* Вернуть массив для печати */
    public int[] ToArray() {
        // Преобразовать только элементы списка в пределах действительной длины
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
        /* Инициализировать двустороннюю очередь */
        ArrayDeque deque = new(10);
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("двусторонняя очередь deque =" + string.Join(" ", deque.ToArray()));

        /* Получить доступ к элементу */
        int peekFirst = deque.PeekFirst();
        Console.WriteLine("элемент в голове очереди peekFirst =" + peekFirst);
        int peekLast = deque.PeekLast();
        Console.WriteLine("элемент в хвосте очереди peekLast =" + peekLast);

        /* Поместить элемент в очередь */
        deque.PushLast(4);
        Console.WriteLine("После помещения элемента 4 в хвост очереди deque =" + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("После помещения элемента 1 в голову очереди deque =" + string.Join(" ", deque.ToArray()));

        /* Извлечь элемент из очереди */
        int popLast = deque.PopLast();
        Console.WriteLine("Элемент, извлеченный из хвоста очереди, =" + popLast + ", deque после извлечения из хвоста =" + string.Join(" ", deque.ToArray()));
        int popFirst = deque.PopFirst();
        Console.WriteLine("Элемент, извлеченный из головы очереди, =" + popFirst + ", deque после извлечения из головы =" + string.Join(" ", deque.ToArray()));

        /* Получить длину двусторонней очереди */
        int size = deque.Size();
        Console.WriteLine("Длина двусторонней очереди size =" + size);

        /* Проверить, пуста ли двусторонняя очередь */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("двусторонняя Очередь пуста:" + isEmpty);
    }
}
