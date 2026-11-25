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

/* Двусторонняя очередь (дек) на основе двусвязного списка */
public class LinkedListDeque {
    ListNode? front, rear; // front — первый узел, rear — последний
    int queSize = 0;      // Длина дека

    public LinkedListDeque() {
        front = null;
        rear = null;
    }

    /* Получить длину дека */
    public int Size() {
        return queSize;
    }

    /* Проверить, пуст ли дек */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Добавить элемент в дек */
    void Push(int num, bool isFront) {
        ListNode node = new(num);
        // Если связный список пуст, установить front и rear так, чтобы они указывали на node
        if (IsEmpty()) {
            front = node;
            rear = node;
        }
        // Добавить элемент в начало дека
        else if (isFront) {
            // Добавить node в начало связного списка
            front!.prev = node;
            node.next = front;
            front = node; // Обновить ссылку на первый узел                           
        }
        // Добавить элемент в конец дека
        else {
            // Добавить node в конец связного списка
            rear!.next = node;
            node.prev = rear;
            rear = node;  // Обновить ссылку на последний узел
        }

        queSize++; // Обновить длину дека
    }

    /* Добавить элемент в начало дека */
    public void PushFirst(int num) {
        Push(num, true);
    }

    /* Добавить элемент в конец дека */
    public void PushLast(int num) {
        Push(num, false);
    }

    /* Извлечь элемент из дека */
    int? Pop(bool isFront) {
        if (IsEmpty())
            throw new Exception();
        int? val;
        // Если длина дека равна 1, ссылки на первый и последний узлы указывают на один и тот же узел
        if (queSize == 1) {
            val = front!.val;
            front = null;
            rear = null;
        }
        // Извлечь элемент из начала дека
        else if (isFront) {
            val = front!.val; // Временно сохранить значение первого узла
            // Удалить первый узел
            ListNode? fNext = front?.next;
            fNext!.prev = null;
            front.next = null;
            front = fNext;   // Обновить ссылку на первый узел
        }
        // Извлечь элемент из конца дека
        else {
            val = rear!.val;  // Временно сохранить значение последнего узла
            // Удалить последний узел
            ListNode? rPrev = rear?.prev;
            rPrev!.next = null;
            rear.prev = null;
            rear = rPrev;    // Обновить ссылку на последний узел
        }

        queSize--; // Обновить длину дека
        return val;
    }

    /* Извлечь элемент из начала дека */
    public int? PopFirst() {
        return Pop(true);
    }

    /* Извлечь элемент из конца дека */
    public int? PopLast() {
        return Pop(false);
    }

    /* Посмотреть первый элемент дека */
    public int? PeekFirst() {
        if (IsEmpty())
            throw new Exception();
        return front?.val;
    }

    /* Посмотреть последний элемент дека */
    public int? PeekLast() {
        if (IsEmpty())
            throw new Exception();
        return rear?.val;
    }

    /* Вернуть массив для вывода */
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
        /* Инициализировать дек */
        LinkedListDeque deque = new();
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("Дек deque = " + string.Join(" ", deque.ToArray()));

        /* Посмотреть первый и последний элементы */
        int? peekFirst = deque.PeekFirst();
        Console.WriteLine("Первый элемент дека peekFirst = " + peekFirst);
        int? peekLast = deque.PeekLast();
        Console.WriteLine("Последний элемент дека peekLast = " + peekLast);

        /* Добавить элементы в дек */
        deque.PushLast(4);
        Console.WriteLine("После добавления 4 в конец дека deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("После добавления 1 в начало дека deque = " + string.Join(" ", deque.ToArray()));

        /* Извлечь элементы из дека */
        int? popLast = deque.PopLast();
        Console.WriteLine("Извлечённый последний элемент = " + popLast + ", после извлечения из конца deque = " + string.Join(" ", deque.ToArray()));
        int? popFirst = deque.PopFirst();
        Console.WriteLine("Извлечённый первый элемент = " + popFirst + ", после извлечения из начала deque = " + string.Join(" ", deque.ToArray()));

        /* Получить длину дека */
        int size = deque.Size();
        Console.WriteLine("Длина дека size = " + size);

        /* Проверить, пуст ли дек */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("Дек пуст = " + isEmpty);
    }
}
