/**
 * File: linkedlist_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Узел двусвязного списка */
public class ListNode(int val) {
    public int val = val;       // Значение узла
    public ListNode? next = null; // Ссылка на следующий узел
    public ListNode? prev = null; // Ссылка на предыдущий узел
}

/* Двусторонняя очередь на основе двусвязного списка */
public class LinkedListDeque {
    ListNode? front, rear; // головной узел front, хвостовой узел rear
    int queSize = 0;      // Длина двусторонней очереди

    public LinkedListDeque() {
        front = null;
        rear = null;
    }

    /* Получить длину двусторонней очереди */
    public int Size() {
        return queSize;
    }

    /* Проверить, пуста ли двусторонняя очередь */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Операция помещения в очередь */
    void Push(int num, bool isFront) {
        ListNode node = new(num);
        // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
        if (IsEmpty()) {
            front = node;
            rear = node;
        }
        // Операция помещения в голову очереди
        else if (isFront) {
            // Добавить node в голову связного списка
            front!.prev = node;
            node.next = front;
            front = node; // Обновить головной узел
        }
        // Операция помещения в хвост очереди
        else {
            // Добавить node в хвост связного списка
            rear!.next = node;
            node.prev = rear;
            rear = node;  // Обновить хвостовой узел
        }

        queSize++; // ОбновитьДлина очереди
    }

    /* Поместить в голову очереди */
    public void PushFirst(int num) {
        Push(num, true);
    }

    /* Поместить в хвост очереди */
    public void PushLast(int num) {
        Push(num, false);
    }

    /* Операция извлечения из очереди */
    int? Pop(bool isFront) {
        if (IsEmpty())
            throw new Exception();
        int? val;
        // Операция извлечения из головы очереди
        if (isFront) {
            val = front?.val; // Временно сохранить значение головного узла
            // Удалить головной узел
            ListNode? fNext = front?.next;
            if (fNext != null) {
                fNext.prev = null;
                front!.next = null;
            }
            front = fNext;   // Обновить головной узел
        }
        // Операция извлечения из хвоста очереди
        else {
            val = rear?.val;  // Временно сохранить значение хвостового узла
            // Удалить хвостовой узел
            ListNode? rPrev = rear?.prev;
            if (rPrev != null) {
                rPrev.next = null;
                rear!.prev = null;
            }
            rear = rPrev;    // Обновить хвостовой узел
        }

        queSize--; // ОбновитьДлина очереди
        return val;
    }

    /* Извлечь из головы очереди */
    public int? PopFirst() {
        return Pop(true);
    }

    /* Извлечь из хвоста очереди */
    public int? PopLast() {
        return Pop(false);
    }

    /* Получить элемент в начале очереди */
    public int? PeekFirst() {
        if (IsEmpty())
            throw new Exception();
        return front?.val;
    }

    /* Обратиться к элементу в хвосте очереди */
    public int? PeekLast() {
        if (IsEmpty())
            throw new Exception();
        return rear?.val;
    }

    /* Вернуть массив для печати */
    public int?[] ToArray() {
        ListNode? node = front;
        int?[] res = new int?[Size()];
        for (int i = 0; i < res.Length; i++) {
            res[i] = node?.val;
            node = node?.next;
        }

        return res;
    }
}

public class linkedlist_deque {
    [Test]
    public void Test() {
        /* Инициализировать двустороннюю очередь */
        LinkedListDeque deque = new();
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("Двусторонняя очередь deque = " + string.Join(" ", deque.ToArray()));

        /* Получить доступ к элементу */
        int? peekFirst = deque.PeekFirst();
        Console.WriteLine("голова очередиэлемент peekFirst =" + peekFirst);
        int? peekLast = deque.PeekLast();
        Console.WriteLine("хвост очередиэлемент peekLast =" + peekLast);

        /* Поместить элемент в очередь */
        deque.PushLast(4);
        Console.WriteLine("После помещения элемента 4 в хвост очереди deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("После помещения элемента 1 в голову очереди deque = " + string.Join(" ", deque.ToArray()));

        /* Извлечь элемент из очереди */
        int? popLast = deque.PopLast();
        Console.WriteLine("Элемент, извлеченный из хвоста очереди = " + popLast + ", deque после извлечения из хвоста = " + string.Join(" ", deque.ToArray()));
        int? popFirst = deque.PopFirst();
        Console.WriteLine("Элемент, извлеченный из головы очереди = " + popFirst + ", deque после извлечения из головы = " + string.Join(" ", deque.ToArray()));

        /* Получить длину двусторонней очереди */
        int size = deque.Size();
        Console.WriteLine("Длина двусторонней очереди size = " + size);

        /* Проверить, пуста ли двусторонняя очередь */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("Двусторонняя очередь пуста: " + isEmpty);
    }
}
