/**
 * File: array_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 基于环形数组实现的队列 */
class ArrayQueue {
    private int[] nums;  // 用于存储队列元素的数组
    private int front;   // 队首指针，指向队首元素
    private int queSize; // 队列长度

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* 获取队列的容量 */
    public int capacity() {
        return nums.Length;
    }

    /* 获取队列的长度 */
    public int size() {
        return queSize;
    }

    /* 判断队列是否为空 */
    public bool isEmpty() {
        return queSize == 0;
    }

    /* 入队 */
    public void push(int num) {
        if (queSize == capacity()) {
            Console.WriteLine("队列已满");
            return;
        }
        // 计算尾指针，指向队尾索引 + 1
        // 通过取余操作，实现 rear 越过数组尾部后回到头部
        int rear = (front + queSize) % capacity();
        // 将 num 添加至队尾
        nums[rear] = num;
        queSize++;
    }

    /* 出队 */
    public int pop() {
        int num = peek();
        // 队首指针向后移动一位，若越过尾部则返回到数组头部
        front = (front + 1) % capacity();
        queSize--;
        return num;
    }

    /* 访问队首元素 */
    public int peek() {
        if (isEmpty())
            throw new Exception();
        return nums[front];
    }

    /* 返回数组 */
    public int[] toArray() {
        // 仅转换有效长度范围内的列表元素
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[j % this.capacity()];
        }
        return res;
    }
}

public class array_queue {
    [Test]
    public void Test() {
        /* 初始化队列 */
        int capacity = 10;
        ArrayQueue queue = new ArrayQueue(capacity);

        /* 元素入队 */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        Console.WriteLine("队列 queue = " + string.Join(",", queue.toArray()));

        /* 访问队首元素 */
        int peek = queue.peek();
        Console.WriteLine("队首元素 peek = " + peek);

        /* 元素出队 */
        int pop = queue.pop();
        Console.WriteLine("出队元素 pop = " + pop + "，出队后 queue = " + string.Join(",", queue.toArray()));

        /* 获取队列的长度 */
        int size = queue.size();
        Console.WriteLine("队列长度 size = " + size);

        /* 判断队列是否为空 */
        bool isEmpty = queue.isEmpty();
        Console.WriteLine("队列是否为空 = " + isEmpty);

        /* 测试环形数组 */
        for (int i = 0; i < 10; i++) {
            queue.push(i);
            queue.pop();
            Console.WriteLine("第 " + i + " 轮入队 + 出队后 queue = " + string.Join(",", queue.toArray()));
        }
    }
}
