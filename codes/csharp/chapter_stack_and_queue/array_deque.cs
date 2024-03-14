/**
 * File: array_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 基于环形数组实现的双向队列 */
public class ArrayDeque {
    int[] nums;  // 用于存储双向队列元素的数组
    int front;   // 队首指针，指向队首元素
    int queSize; // 双向队列长度

    /* 构造方法 */
    public ArrayDeque(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* 获取双向队列的容量 */
    int Capacity() {
        return nums.Length;
    }

    /* 获取双向队列的长度 */
    public int Size() {
        return queSize;
    }

    /* 判断双向队列是否为空 */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* 计算环形数组索引 */
    int Index(int i) {
        // 通过取余操作实现数组首尾相连
        // 当 i 越过数组尾部后，回到头部
        // 当 i 越过数组头部后，回到尾部
        return (i + Capacity()) % Capacity();
    }

    /* 队首入队 */
    public void PushFirst(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("双向队列已满");
            return;
        }
        // 队首指针向左移动一位
        // 通过取余操作实现 front 越过数组头部后回到尾部
        front = Index(front - 1);
        // 将 num 添加至队首
        nums[front] = num;
        queSize++;
    }

    /* 队尾入队 */
    public void PushLast(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("双向队列已满");
            return;
        }
        // 计算队尾指针，指向队尾索引 + 1
        int rear = Index(front + queSize);
        // 将 num 添加至队尾
        nums[rear] = num;
        queSize++;
    }

    /* 队首出队 */
    public int PopFirst() {
        int num = PeekFirst();
        // 队首指针向后移动一位
        front = Index(front + 1);
        queSize--;
        return num;
    }

    /* 队尾出队 */
    public int PopLast() {
        int num = PeekLast();
        queSize--;
        return num;
    }

    /* 访问队首元素 */
    public int PeekFirst() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        return nums[front];
    }

    /* 访问队尾元素 */
    public int PeekLast() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        // 计算尾元素索引
        int last = Index(front + queSize - 1);
        return nums[last];
    }

    /* 返回数组用于打印 */
    public int[] ToArray() {
        // 仅转换有效长度范围内的列表元素
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
        /* 初始化双向队列 */
        ArrayDeque deque = new(10);
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("双向队列 deque = " + string.Join(" ", deque.ToArray()));

        /* 访问元素 */
        int peekFirst = deque.PeekFirst();
        Console.WriteLine("队首元素 peekFirst = " + peekFirst);
        int peekLast = deque.PeekLast();
        Console.WriteLine("队尾元素 peekLast = " + peekLast);

        /* 元素入队 */
        deque.PushLast(4);
        Console.WriteLine("元素 4 队尾入队后 deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("元素 1 队首入队后 deque = " + string.Join(" ", deque.ToArray()));

        /* 元素出队 */
        int popLast = deque.PopLast();
        Console.WriteLine("队尾出队元素 = " + popLast + "，队尾出队后 deque = " + string.Join(" ", deque.ToArray()));
        int popFirst = deque.PopFirst();
        Console.WriteLine("队首出队元素 = " + popFirst + "，队首出队后 deque = " + string.Join(" ", deque.ToArray()));

        /* 获取双向队列的长度 */
        int size = deque.Size();
        Console.WriteLine("双向队列长度 size = " + size);

        /* 判断双向队列是否为空 */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("双向队列是否为空 = " + isEmpty);
    }
}
