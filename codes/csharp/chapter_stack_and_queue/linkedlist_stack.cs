/**
 * File: linkedlist_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 基于链表实现的栈 */
class LinkedListStack {
    private ListNode? stackPeek;  // 将头节点作为栈顶
    private int stkSize = 0;   // 栈的长度

    public LinkedListStack() {
        stackPeek = null;
    }

    /* 获取栈的长度 */
    public int size() {
        return stkSize;
    }

    /* 判断栈是否为空 */
    public bool isEmpty() {
        return size() == 0;
    }

    /* 入栈 */
    public void push(int num) {
        ListNode node = new ListNode(num);
        node.next = stackPeek;
        stackPeek = node;
        stkSize++;
    }

    /* 出栈 */
    public int pop() {
        if (stackPeek == null)
            throw new Exception();

        int num = peek();
        stackPeek = stackPeek.next;
        stkSize--;
        return num;
    }

    /* 访问栈顶元素 */
    public int peek() {
        if (size() == 0 || stackPeek == null)
            throw new Exception();
        return stackPeek.val;
    }

    /* 将 List 转化为 Array 并返回 */
    public int[] toArray() {
        if (stackPeek == null)
            return Array.Empty<int>();

        ListNode node = stackPeek;
        int[] res = new int[size()];
        for (int i = res.Length - 1; i >= 0; i--) {
            res[i] = node.val;
            node = node.next;
        }
        return res;
    }
}

public class linkedlist_stack {
    [Test]
    public void Test() {
        /* 初始化栈 */
        LinkedListStack stack = new LinkedListStack();

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
