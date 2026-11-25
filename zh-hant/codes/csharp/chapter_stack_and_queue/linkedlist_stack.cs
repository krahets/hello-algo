/**
 * File: linkedlist_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 以鏈結串列實作堆疊 */
class LinkedListStack {
    ListNode? stackPeek;  // 以首節點作為堆疊頂端
    int stkSize = 0;   // 堆疊長度

    public LinkedListStack() {
        stackPeek = null;
    }

    /* 取得堆疊長度 */
    public int Size() {
        return stkSize;
    }

    /* 判斷堆疊是否為空 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 推入堆疊 */
    public void Push(int num) {
        ListNode node = new(num) {
            next = stackPeek
        };
        stackPeek = node;
        stkSize++;
    }

    /* 彈出堆疊頂端的元素 */
    public int Pop() {
        int num = Peek();
        stackPeek = stackPeek!.next;
        stkSize--;
        return num;
    }

    /* 讀取堆疊頂端的元素 */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stackPeek!.val;
    }

    /* 將鏈結串列轉成陣列並回傳 */
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
