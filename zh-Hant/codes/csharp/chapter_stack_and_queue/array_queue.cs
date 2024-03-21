/**
 * File: array_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 基於環形陣列實現的佇列 */
class ArrayQueue {
    int[] nums;  // 用於儲存佇列元素的陣列
    int front;   // 佇列首指標，指向佇列首元素
    int queSize; // 佇列長度

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* 獲取佇列的容量 */
    int Capacity() {
        return nums.Length;
    }

    /* 獲取佇列的長度 */
    public int Size() {
        return queSize;
    }

    /* 判斷佇列是否為空 */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* 入列 */
    public void Push(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("佇列已滿");
            return;
        }
        // 計算佇列尾指標，指向佇列尾索引 + 1
        // 透過取餘操作實現 rear 越過陣列尾部後回到頭部
        int rear = (front + queSize) % Capacity();
        // 將 num 新增至佇列尾
        nums[rear] = num;
        queSize++;
    }

    /* 出列 */
    public int Pop() {
        int num = Peek();
        // 佇列首指標向後移動一位，若越過尾部，則返回到陣列頭部
        front = (front + 1) % Capacity();
        queSize--;
        return num;
    }

    /* 訪問佇列首元素 */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return nums[front];
    }

    /* 返回陣列 */
    public int[] ToArray() {
        // 僅轉換有效長度範圍內的串列元素
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[j % this.Capacity()];
        }
        return res;
    }
}

public class array_queue {
    [Test]
    public void Test() {
        /* 初始化佇列 */
        int capacity = 10;
        ArrayQueue queue = new(capacity);

        /* 元素入列 */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("佇列 queue = " + string.Join(",", queue.ToArray()));

        /* 訪問佇列首元素 */
        int peek = queue.Peek();
        Console.WriteLine("佇列首元素 peek = " + peek);

        /* 元素出列 */
        int pop = queue.Pop();
        Console.WriteLine("出列元素 pop = " + pop + "，出列後 queue = " + string.Join(",", queue.ToArray()));

        /* 獲取佇列的長度 */
        int size = queue.Size();
        Console.WriteLine("佇列長度 size = " + size);

        /* 判斷佇列是否為空 */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("佇列是否為空 = " + isEmpty);

        /* 測試環形陣列 */
        for (int i = 0; i < 10; i++) {
            queue.Push(i);
            queue.Pop();
            Console.WriteLine("第 " + i + " 輪入列 + 出列後 queue = " + string.Join(",", queue.ToArray()));
        }
    }
}
