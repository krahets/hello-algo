/**
 * File: array_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 以陣列實作堆疊 */
class ArrayStack {
    List<int> stack;
    public ArrayStack() {
        // 初始化串列（動態陣列）
        stack = [];
    }

    /* 取得堆疊長度 */
    public int Size() {
        return stack.Count;
    }

    /* 判斷堆疊是否為空 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 推入堆疊 */
    public void Push(int num) {
        stack.Add(num);
    }

    /* 彈出堆疊頂端的元素 */
    public int Pop() {
        if (IsEmpty())
            throw new Exception();
        var val = Peek();
        stack.RemoveAt(Size() - 1);
        return val;
    }

    /* 讀取堆疊頂端的元素 */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stack[Size() - 1];
    }

    /* 將串列轉成陣列並回傳 */
    public int[] ToArray() {
        return [.. stack];
    }
}

public class array_stack {
    [Test]
    public void Test() {
        /* 初始化堆疊 */
        ArrayStack stack = new();

        /* 將元素推入堆疊 */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        Console.WriteLine("堆疊 stack = " + string.Join(",", stack.ToArray()));

        /* 讀取堆疊頂端的元素 */
        int peek = stack.Peek();
        Console.WriteLine("堆疊頂端元素 peek = " + peek);

        /* 從堆疊彈出元素 */
        int pop = stack.Pop();
        Console.WriteLine("彈出的元素 pop = " + pop + "，彈出後 stack = " + string.Join(",", stack.ToArray()));

        /* 取得堆疊長度 */
        int size = stack.Size();
        Console.WriteLine("堆疊長度 size = " + size);

        /* 判斷堆疊是否為空 */
        bool isEmpty = stack.IsEmpty();
        Console.WriteLine("堆疊是否為空 = " + isEmpty);
    }
}
