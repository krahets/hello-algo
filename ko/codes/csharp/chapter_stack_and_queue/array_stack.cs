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
        // 리스트(동적 배열) 초기화
        stack = [];
    }

    /* 스택의 길이 조회 */
    public int Size() {
        return stack.Count;
    }

    /* 스택이 비어 있는지 확인 */
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

    /* 스택 맨 위의 원소 조회 */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stack[Size() - 1];
    }

    /* 리스트를 배열로 변환해 반환한다 */
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

        /* 스택 맨 위의 원소 조회 */
        int peek = stack.Peek();
        Console.WriteLine("맨 위 원소 peek = " + peek);

        /* 스택에서 원소 꺼내기 */
        int pop = stack.Pop();
        Console.WriteLine("꺼낸 원소 pop = " + pop + ", 꺼낸 후 stack = " + string.Join(",", stack.ToArray()));

        /* 스택의 길이 조회 */
        int size = stack.Size();
        Console.WriteLine("스택의 길이 size = " + size);

        /* 비어 있는지 확인 */
        bool isEmpty = stack.IsEmpty();
        Console.WriteLine("스택이 비어 있는가 = " + isEmpty);
    }
}
