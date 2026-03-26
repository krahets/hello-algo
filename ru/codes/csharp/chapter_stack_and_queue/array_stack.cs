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

    /* Получить длину стека */
    public int Size() {
        return stack.Count;
    }

    /* Проверить, пуст ли стек */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Поместить в стек */
    public void Push(int num) {
        stack.Add(num);
    }

    /* Извлечь из стека */
    public int Pop() {
        if (IsEmpty())
            throw new Exception();
        var val = Peek();
        stack.RemoveAt(Size() - 1);
        return val;
    }

    /* Получить верхний элемент стека */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stack[Size() - 1];
    }

    /* Преобразовать List в Array и вернуть его */
    public int[] ToArray() {
        return [.. stack];
    }
}

public class array_stack {
    [Test]
    public void Test() {
        /* Инициализировать стек */
        ArrayStack stack = new();

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
        Console.WriteLine("стекпуст ли =" + isEmpty);
    }
}
