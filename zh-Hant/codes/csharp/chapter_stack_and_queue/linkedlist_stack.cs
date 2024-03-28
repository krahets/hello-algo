/**
 * File: linkedlist_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 基於鏈結串列實現的堆疊 */
class LinkedListStack {
    ListNode? stackPeek;  // 將頭節點作為堆疊頂
    int stkSize = 0;   // 堆疊的長度

    public LinkedListStack() {
        stackPeek = null;
    }

    /* 獲取堆疊的長度 */
    public int Size() {
        return stkSize;
    }

    /* 判斷堆疊是否為空 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 入堆疊 */
    public void Push(int num) {
        ListNode node = new(num) {
            next = stackPeek
        };
        stackPeek = node;
        stkSize++;
    }

    /* 出堆疊 */
    public int Pop() {
        int num = Peek();
        stackPeek = stackPeek!.next;
        stkSize--;
        return num;
    }

    /* 訪問堆疊頂元素 */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stackPeek!.val;
    }

    /* 將 List 轉化為 Array 並返回 */
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
        /* 初始化堆疊 */
        LinkedListStack stack = new();

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
