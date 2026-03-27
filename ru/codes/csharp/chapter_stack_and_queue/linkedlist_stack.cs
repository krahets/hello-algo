/**
 * File: linkedlist_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Стек на основе связного списка */
class LinkedListStack {
    ListNode? stackPeek;  // Использовать головной узел как вершину стека
    int stkSize = 0;   // Длина стека

    public LinkedListStack() {
        stackPeek = null;
    }

    /* Получение длины стека */
    public int Size() {
        return stkSize;
    }

    /* Проверка, пуст ли стек */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Поместить в стек */
    public void Push(int num) {
        ListNode node = new(num) {
            next = stackPeek
        };
        stackPeek = node;
        stkSize++;
    }

    /* Извлечь из стека */
    public int Pop() {
        int num = Peek();
        stackPeek = stackPeek!.next;
        stkSize--;
        return num;
    }

    /* Доступ к верхнему элементу стека */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stackPeek!.val;
    }

    /* Преобразовать List в Array и вернуть */
    public int[] ToArray() {
        if (stackPeek == null)
            return [];

        ListNode? node = stackPeek;
        int[] res = new int[Size()];
        for (int i = res.Length - 1; i >= 0; i--) {
            res[i] = node!.val;
            node = node.next;
        }
        return res;
    }
}

public class linkedlist_stack {
    [Test]
    public void Test() {
        /* Инициализация стека */
        LinkedListStack stack = new();

        /* Помещение элемента в стек */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        Console.WriteLine("Стек stack = " + string.Join(",", stack.ToArray()));

        /* Доступ к верхнему элементу стека */
        int peek = stack.Peek();
        Console.WriteLine("Верхний элемент peek = " + peek);

        /* Извлечение элемента из стека */
        int pop = stack.Pop();
        Console.WriteLine("Извлеченный элемент pop = " + pop + ", stack после извлечения = " + string.Join(",", stack.ToArray()));

        /* Получение длины стека */
        int size = stack.Size();
        Console.WriteLine("Длина стека size = " + size);

        /* Проверка на пустоту */
        bool isEmpty = stack.IsEmpty();
        Console.WriteLine("Пуст ли стек = " + isEmpty);
    }
}
