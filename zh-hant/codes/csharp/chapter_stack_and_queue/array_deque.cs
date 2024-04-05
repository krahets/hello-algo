/**
 * File: array_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 基於環形陣列實現的雙向佇列 */
public class ArrayDeque {
    int[] nums;  // 用於儲存雙向佇列元素的陣列
    int front;   // 佇列首指標，指向佇列首元素
    int queSize; // 雙向佇列長度

    /* 建構子 */
    public ArrayDeque(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* 獲取雙向佇列的容量 */
    int Capacity() {
        return nums.Length;
    }

    /* 獲取雙向佇列的長度 */
    public int Size() {
        return queSize;
    }

    /* 判斷雙向佇列是否為空 */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* 計算環形陣列索引 */
    int Index(int i) {
        // 透過取餘操作實現陣列首尾相連
        // 當 i 越過陣列尾部後，回到頭部
        // 當 i 越過陣列頭部後，回到尾部
        return (i + Capacity()) % Capacity();
    }

    /* 佇列首入列 */
    public void PushFirst(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("雙向佇列已滿");
            return;
        }
        // 佇列首指標向左移動一位
        // 透過取餘操作實現 front 越過陣列頭部後回到尾部
        front = Index(front - 1);
        // 將 num 新增至佇列首
        nums[front] = num;
        queSize++;
    }

    /* 佇列尾入列 */
    public void PushLast(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("雙向佇列已滿");
            return;
        }
        // 計算佇列尾指標，指向佇列尾索引 + 1
        int rear = Index(front + queSize);
        // 將 num 新增至佇列尾
        nums[rear] = num;
        queSize++;
    }

    /* 佇列首出列 */
    public int PopFirst() {
        int num = PeekFirst();
        // 佇列首指標向後移動一位
        front = Index(front + 1);
        queSize--;
        return num;
    }

    /* 佇列尾出列 */
    public int PopLast() {
        int num = PeekLast();
        queSize--;
        return num;
    }

    /* 訪問佇列首元素 */
    public int PeekFirst() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        return nums[front];
    }

    /* 訪問佇列尾元素 */
    public int PeekLast() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        // 計算尾元素索引
        int last = Index(front + queSize - 1);
        return nums[last];
    }

    /* 返回陣列用於列印 */
    public int[] ToArray() {
        // 僅轉換有效長度範圍內的串列元素
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
        /* 初始化雙向佇列 */
        ArrayDeque deque = new(10);
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("雙向佇列 deque = " + string.Join(" ", deque.ToArray()));

        /* 訪問元素 */
        int peekFirst = deque.PeekFirst();
        Console.WriteLine("佇列首元素 peekFirst = " + peekFirst);
        int peekLast = deque.PeekLast();
        Console.WriteLine("佇列尾元素 peekLast = " + peekLast);

        /* 元素入列 */
        deque.PushLast(4);
        Console.WriteLine("元素 4 佇列尾入列後 deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("元素 1 佇列首入列後 deque = " + string.Join(" ", deque.ToArray()));

        /* 元素出列 */
        int popLast = deque.PopLast();
        Console.WriteLine("佇列尾出列元素 = " + popLast + "，佇列尾出列後 deque = " + string.Join(" ", deque.ToArray()));
        int popFirst = deque.PopFirst();
        Console.WriteLine("佇列首出列元素 = " + popFirst + "，佇列首出列後 deque = " + string.Join(" ", deque.ToArray()));

        /* 獲取雙向佇列的長度 */
        int size = deque.Size();
        Console.WriteLine("雙向佇列長度 size = " + size);

        /* 判斷雙向佇列是否為空 */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("雙向佇列是否為空 = " + isEmpty);
    }
}
