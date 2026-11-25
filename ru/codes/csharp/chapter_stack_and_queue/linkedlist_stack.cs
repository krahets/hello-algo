/**
 * File: linkedlist_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Стек на основе связного списка */
class LinkedListStack {
    ListNode? stackPeek;  // Первый узел списка служит вершиной стека
    int stkSize = 0;   // Размер стека

    public LinkedListStack() {
        stackPeek = null;
    }

    /* Получить размер стека */
    public int Size() {
        return stkSize;
    }

    /* Проверить, пуст ли стек */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Поместить элемент в стек */
    public void Push(int num) {
        ListNode node = new(num) {
            next = stackPeek
        };
        stackPeek = node;
        stkSize++;
    }

    /* Снять элемент со стека */
    public int Pop() {
        int num = Peek();
        stackPeek = stackPeek!.next;
        stkSize--;
        return num;
    }

    /* Посмотреть элемент на вершине стека */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stackPeek!.val;
    }

    /* Преобразовать связный список в массив и вернуть его */
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

        /* Поместить элементы в стек */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        Console.WriteLine("Стек stack = " + string.Join(",", stack.ToArray()));

        /* Посмотреть элемент на вершине стека */
        int peek = stack.Peek();
        Console.WriteLine("Элемент на вершине стека peek = " + peek);

        /* Снять элемент со стека */
        int pop = stack.Pop();
        Console.WriteLine("Снятый элемент pop = " + pop + ", после снятия stack = " + string.Join(",", stack.ToArray()));

        /* Получить размер стека */
        int size = stack.Size();
        Console.WriteLine("Размер стека size = " + size);

        /* Проверить, пуст ли стек */
        bool isEmpty = stack.IsEmpty();
        Console.WriteLine("Стек пуст = " + isEmpty);
    }
}
