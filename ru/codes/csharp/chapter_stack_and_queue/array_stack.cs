/**
 * File: array_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Стек на основе массива */
class ArrayStack {
    List<int> stack;
    public ArrayStack() {
        // Инициализировать список (динамический массив)
        stack = [];
    }

    /* Получить размер стека */
    public int Size() {
        return stack.Count;
    }

    /* Проверить, пуст ли стек */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Поместить элемент в стек */
    public void Push(int num) {
        stack.Add(num);
    }

    /* Снять элемент со стека */
    public int Pop() {
        if (IsEmpty())
            throw new Exception();
        var val = Peek();
        stack.RemoveAt(Size() - 1);
        return val;
    }

    /* Посмотреть элемент на вершине стека */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stack[Size() - 1];
    }

    /* Преобразовать список в массив и вернуть его */
    public int[] ToArray() {
        return [.. stack];
    }
}

public class array_stack {
    [Test]
    public void Test() {
        /* Инициализировать стек */
        ArrayStack stack = new();

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
