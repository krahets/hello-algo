/**
 * File: array_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 基于数组实现的栈 */
class ArrayStack {
    private List<int> stack;
    public ArrayStack() {
        // 初始化列表（动态数组）
        stack = new();
    }

    /* 获取栈的长度 */
    public int size() {
        return stack.Count();
    }

    /* 判断栈是否为空 */
    public bool isEmpty() {
        return size() == 0;
    }

    /* 入栈 */
    public void push(int num) {
        stack.Add(num);
    }

    /* 出栈 */
    public int pop() {
        if (isEmpty())
            throw new Exception();
        var val = peek();
        stack.RemoveAt(size() - 1);
        return val;
    }

    /* 访问栈顶元素 */
    public int peek() {
        if (isEmpty())
            throw new Exception();
        return stack[size() - 1];
    }

    /* 将 List 转化为 Array 并返回 */
    public int[] toArray() {
        return stack.ToArray();
    }
}

public class array_stack {
    [Test]
    public void Test() {
        /* 初始化栈 */
        ArrayStack stack = new ArrayStack();

        /* 元素入栈 */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        Console.WriteLine("栈 stack = " + string.Join(",", stack.toArray()));

        /* 访问栈顶元素 */
        int peek = stack.peek();
        Console.WriteLine("栈顶元素 peek = " + peek);

        /* 元素出栈 */
        int pop = stack.pop();
        Console.WriteLine("出栈元素 pop = " + pop + "，出栈后 stack = " + string.Join(",", stack.toArray()));

        /* 获取栈的长度 */
        int size = stack.size();
        Console.WriteLine("栈的长度 size = " + size);

        /* 判断是否为空 */
        bool isEmpty = stack.isEmpty();
        Console.WriteLine("栈是否为空 = " + isEmpty);
    }
}
