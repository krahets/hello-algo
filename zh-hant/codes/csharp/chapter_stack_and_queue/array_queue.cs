/**
 * File: array_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 以環狀陣列實作佇列 */
class ArrayQueue {
    int[] nums;  // 存放佇列元素的陣列
    int front;   // 隊首索引，記錄隊首元素在陣列中的位置
    int queSize; // 佇列長度

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* 取得佇列容量 */
    int Capacity() {
        return nums.Length;
    }

    /* 取得佇列長度 */
    public int Size() {
        return queSize;
    }

    /* 判斷佇列是否為空 */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* 入隊 */
    public void Push(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("佇列已滿");
            return;
        }
        // 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
        // 取餘數，讓 rear 超過陣列末端時繞回開頭
        int rear = (front + queSize) % Capacity();
        // 將 num 加到隊尾
        nums[rear] = num;
        queSize++;
    }

    /* 出隊 */
    public int Pop() {
        int num = Peek();
        // 將隊首索引往後移一格，若超過陣列末端就繞回開頭
        front = (front + 1) % Capacity();
        queSize--;
        return num;
    }

    /* 讀取隊首元素 */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return nums[front];
    }

    /* 回傳陣列 */
    public int[] ToArray() {
        // 只轉換佇列中實際存放的元素
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

        /* 將元素加入佇列 */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("佇列 queue = " + string.Join(",", queue.ToArray()));

        /* 讀取隊首元素 */
        int peek = queue.Peek();
        Console.WriteLine("隊首元素 peek = " + peek);

        /* 從佇列取出元素 */
        int pop = queue.Pop();
        Console.WriteLine("出隊元素 pop = " + pop + "，出隊後 queue = " + string.Join(",", queue.ToArray()));

        /* 取得佇列長度 */
        int size = queue.Size();
        Console.WriteLine("佇列長度 size = " + size);

        /* 判斷佇列是否為空 */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("佇列是否為空 = " + isEmpty);

        /* 測試環狀陣列 */
        for (int i = 0; i < 10; i++) {
            queue.Push(i);
            queue.Pop();
            Console.WriteLine("第 " + i + " 輪入隊 + 出隊後 queue = " + string.Join(",", queue.ToArray()));
        }
    }
}
