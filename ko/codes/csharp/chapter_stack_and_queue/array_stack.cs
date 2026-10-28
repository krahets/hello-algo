/**
 * File: array_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 배열로 구현한 스택 */
class ArrayStack {
    List<int> stack;
    public ArrayStack() {
        // 리스트(동적 배열)를 초기화한다
        stack = [];
    }

    /* 스택의 길이 반환 */
    public int Size() {
        return stack.Count;
    }

    /* 스택이 비어 있는지 판단 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 스택에 삽입 */
    public void Push(int num) {
        stack.Add(num);
    }

    /* 스택에서 꺼내기 */
    public int Pop() {
        if (IsEmpty())
            throw new Exception();
        var val = Peek();
        stack.RemoveAt(Size() - 1);
        return val;
    }

    /* 스택 맨 위 원소 접근 */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stack[Size() - 1];
    }

    /* List를 Array로 변환하여 반환 */
    public int[] ToArray() {
        return [.. stack];
    }
}

public class array_stack {
    [Test]
    public void Test() {
        /* 스택 초기화 */
        ArrayStack stack = new();

        /* 스택에 원소 삽입 */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        Console.WriteLine("스택 stack = " + string.Join(",", stack.ToArray()));

        /* 스택 맨 위 원소 접근 */
        int peek = stack.Peek();
        Console.WriteLine("스택 맨 위 원소 peek = " + peek);

        /* 스택에서 원소 꺼내기 */
        int pop = stack.Pop();
        Console.WriteLine("스택에서 꺼낸 원소 pop = " + pop + ", 스택에서 꺼낸 후 stack = " + string.Join(",", stack.ToArray()));

        /* 스택의 길이 반환 */
        int size = stack.Size();
        Console.WriteLine("스택의 길이 size = " + size);

        /* 비어 있는지 판단 */
        bool isEmpty = stack.IsEmpty();
        Console.WriteLine("스택이 비어 있는가 = " + isEmpty);
    }
}
