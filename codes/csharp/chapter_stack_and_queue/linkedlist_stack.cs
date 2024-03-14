/**
 * File: linkedlist_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 基于链表实现的栈 */
class LinkedListStack {
    ListNode? stackPeek;  // 将头节点作为栈顶
    int stkSize = 0;   // 栈的长度

    public LinkedListStack() {
        stackPeek = null;
    }

    /* 获取栈的长度 */
    public int Size() {
        return stkSize;
    }

    /* 判断栈是否为空 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 入栈 */
    public void Push(int num) {
        ListNode node = new(num) {
            next = stackPeek
        };
        stackPeek = node;
        stkSize++;
    }

    /* 出栈 */
    public int Pop() {
        int num = Peek();
        stackPeek = stackPeek!.next;
        stkSize--;
        return num;
    }

    /* 访问栈顶元素 */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stackPeek!.val;
    }

    /* 将 List 转化为 Array 并返回 */
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
        /* 初始化栈 */
        LinkedListStack stack = new();

        /* 元素入栈 */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        Console.WriteLine("栈 stack = " + string.Join(",", stack.ToArray()));

        /* 访问栈顶元素 */
        int peek = stack.Peek();
        Console.WriteLine("栈顶元素 peek = " + peek);

        /* 元素出栈 */
        int pop = stack.Pop();
        Console.WriteLine("出栈元素 pop = " + pop + "，出栈后 stack = " + string.Join(",", stack.ToArray()));

        /* 获取栈的长度 */
        int size = stack.Size();
        Console.WriteLine("栈的长度 size = " + size);

        /* 判断是否为空 */
        bool isEmpty = stack.IsEmpty();
        Console.WriteLine("栈是否为空 = " + isEmpty);
    }
}
