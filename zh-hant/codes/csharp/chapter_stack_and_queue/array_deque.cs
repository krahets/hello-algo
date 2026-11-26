/**
 * File: array_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 以環狀陣列實作雙端佇列 */
public class ArrayDeque {
    int[] nums;  // 存放雙端佇列元素的陣列
    int front;   // 隊首索引，記錄隊首元素在陣列中的位置
    int queSize; // 雙端佇列長度

    /* 建構子 */
    public ArrayDeque(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* 取得雙端佇列容量 */
    int Capacity() {
        return nums.Length;
    }

    /* 取得雙端佇列長度 */
    public int Size() {
        return queSize;
    }

    /* 判斷雙端佇列是否為空 */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* 計算環狀陣列的索引 */
    int Index(int i) {
        // 取餘數，讓陣列的首尾相接
        // 當 i 超過陣列末端時，繞回開頭
        // 當 i 越過陣列開頭時，繞回末端
        return (i + Capacity()) % Capacity();
    }

    /* 從隊首加入元素 */
    public void PushFirst(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("雙端佇列已滿");
            return;
        }
        // 將隊首索引往左移一格
        // 取餘數，讓 front 越過陣列開頭時繞回末端
        front = Index(front - 1);
        // 將 num 加到隊首
        nums[front] = num;
        queSize++;
    }

    /* 從隊尾加入元素 */
    public void PushLast(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("雙端佇列已滿");
            return;
        }
        // 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
        int rear = Index(front + queSize);
        // 將 num 加到隊尾
        nums[rear] = num;
        queSize++;
    }

    /* 從隊首取出元素 */
    public int PopFirst() {
        int num = PeekFirst();
        // 將隊首索引往後移一格
        front = Index(front + 1);
        queSize--;
        return num;
    }

    /* 從隊尾取出元素 */
    public int PopLast() {
        int num = PeekLast();
        queSize--;
        return num;
    }

    /* 讀取隊首元素 */
    public int PeekFirst() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        return nums[front];
    }

    /* 讀取隊尾元素 */
    public int PeekLast() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        // 計算隊尾元素的索引
        int last = Index(front + queSize - 1);
        return nums[last];
    }

    /* 回傳陣列以便輸出 */
    public int[] ToArray() {
        // 只轉換雙端佇列中實際存放的元素
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[Index(j)];
        }
        return res;
    }
}

public class array_deque {
    [Test]
    public void Test() {
        /* 初始化雙端佇列 */
        ArrayDeque deque = new(10);
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("雙端佇列 deque = " + string.Join(" ", deque.ToArray()));

        /* 讀取隊首與隊尾元素 */
        int peekFirst = deque.PeekFirst();
        Console.WriteLine("隊首元素 peekFirst = " + peekFirst);
        int peekLast = deque.PeekLast();
        Console.WriteLine("隊尾元素 peekLast = " + peekLast);

        /* 將元素加入雙端佇列 */
        deque.PushLast(4);
        Console.WriteLine("將元素 4 加到隊尾後 deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("將元素 1 加到隊首後 deque = " + string.Join(" ", deque.ToArray()));

        /* 從雙端佇列取出元素 */
        int popLast = deque.PopLast();
        Console.WriteLine("從隊尾取出的元素 = " + popLast + "，從隊尾取出後 deque = " + string.Join(" ", deque.ToArray()));
        int popFirst = deque.PopFirst();
        Console.WriteLine("從隊首取出的元素 = " + popFirst + "，從隊首取出後 deque = " + string.Join(" ", deque.ToArray()));

        /* 取得雙端佇列長度 */
        int size = deque.Size();
        Console.WriteLine("雙端佇列長度 size = " + size);

        /* 判斷雙端佇列是否為空 */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("雙端佇列是否為空 = " + isEmpty);
    }
}
