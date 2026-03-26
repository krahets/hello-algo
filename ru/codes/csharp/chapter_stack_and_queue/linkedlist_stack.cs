/**
 * File: linkedlist_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Стек на основе связного списка */
class LinkedListStack {
    ListNode? stackPeek;  // Считать головной узел вершиной стека
    int stkSize = 0;   // Длина стека

    public LinkedListStack() {
        stackPeek = null;
    }

    /* Получить длину стека */
    public int Size() {
        return stkSize;
    }

    /* Проверить, пуст ли стек */
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

    /* Получить верхний элемент стека */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stackPeek!.val;
    }

    /* Преобразовать List в Array и вернуть его */
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
        /* Инициализировать стек */
        LinkedListStack stack = new();

        /* Поместить элемент в стек */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        Console.WriteLine("стек stack =" + string.Join(",", stack.ToArray()));

        /* Получить верхний элемент стека */
        int peek = stack.Peek();
        Console.WriteLine("вершина стекаэлемент peek =" + peek);

        /* Извлечь элемент из стека */
        int pop = stack.Pop();
        Console.WriteLine("извлечение из стекаэлемент pop =" + pop + ", извлечение из стекапосле stack =" + string.Join(",", stack.ToArray()));

        /* Получить длину стека */
        int size = stack.Size();
        Console.WriteLine("Длина стека size =" + size);

        /* Проверить, пуста ли структура */
        bool isEmpty = stack.IsEmpty();
        Console.WriteLine("Стек пуст:" + isEmpty);
    }
}
