/**
 * File: array_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 基於陣列實現的堆疊 */
class ArrayStack {
    List<int> stack;
    public ArrayStack() {
        // 初始化串列（動態陣列）
        stack = [];
    }

    /* 獲取堆疊的長度 */
    public int Size() {
        return stack.Count;
    }

    /* 判斷堆疊是否為空 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 入堆疊 */
    public void Push(int num) {
        stack.Add(num);
    }

    /* 出堆疊 */
    public int Pop() {
        if (IsEmpty())
            throw new Exception();
        var val = Peek();
        stack.RemoveAt(Size() - 1);
        return val;
    }

    /* 訪問堆疊頂元素 */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stack[Size() - 1];
    }

    /* 將 List 轉化為 Array 並返回 */
    public int[] ToArray() {
        return [.. stack];
    }
}

public class array_stack {
    [Test]
    public void Test() {
        /* 初始化堆疊 */
        ArrayStack stack = new();

        /* 元素入堆疊 */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        Console.WriteLine("堆疊 stack = " + string.Join(",", stack.ToArray()));

        /* 訪問堆疊頂元素 */
        int peek = stack.Peek();
        Console.WriteLine("堆疊頂元素 peek = " + peek);

        /* 元素出堆疊 */
        int pop = stack.Pop();
        Console.WriteLine("出堆疊元素 pop = " + pop + "，出堆疊後 stack = " + string.Join(",", stack.ToArray()));

        /* 獲取堆疊的長度 */
        int size = stack.Size();
        Console.WriteLine("堆疊的長度 size = " + size);

        /* 判斷是否為空 */
        bool isEmpty = stack.IsEmpty();
        Console.WriteLine("堆疊是否為空 = " + isEmpty);
    }
}
