/**
 * File: array_queue.java
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 基于环形数组实现的队列 */
class ArrayQueue {
    private int[] nums;     // 用于存储队列元素的数组
    private int front = 0;  // 头指针，指向队首
    private int rear = 0;   // 尾指针，指向队尾 + 1

    public ArrayQueue(int capacity) {
        // 初始化数组
        nums = new int[capacity];
    }

    /* 获取队列的容量 */
    public int capacity() {
        return nums.length;
    }

    /* 获取队列的长度 */
    public int size() {
        int capacity = capacity();
        // 由于将数组看作为环形，可能 rear < front ，因此需要取余数
        return (capacity + rear - front) % capacity;
    }

    /* 判断队列是否为空 */
    public boolean isEmpty() {
        return rear - front == 0;
    }

    /* 入队 */
    public void offer(int num) {
        if (size() == capacity()) {
            System.out.println("队列已满");
            return;
        }
        // 尾结点后添加 num
        nums[rear] = num;
        // 尾指针向后移动一位，越过尾部后返回到数组头部
        rear = (rear + 1) % capacity();
    }

    /* 出队 */
    public int poll() {
        int num = peek();
        // 队头指针向后移动一位，若越过尾部则返回到数组头部
        front = (front + 1) % capacity();
        return num;
    }

    /* 访问队首元素 */
    public int peek() {
        if (isEmpty())
            throw new EmptyStackException();
        return nums[front];
    }

    /* 返回数组 */
    public int[] toArray() {
        int size = size();
        int capacity = capacity();
        // 仅转换有效长度范围内的列表元素
        int[] res = new int[size];
        for (int i = 0, j = front; i < size; i++, j++) {
            res[i] = nums[j % capacity];
        }
        return res;
    }
}

public class array_queue {
    public static void main(String[] args) {
        /* 初始化队列 */
        int capacity = 10;
        ArrayQueue queue = new ArrayQueue(capacity);

        /* 元素入队 */
        queue.offer(1);
        queue.offer(3);
        queue.offer(2);
        queue.offer(5);
        queue.offer(4);
        System.out.println("队列 queue = " + Arrays.toString(queue.toArray()));

        /* 访问队首元素 */
        int peek = queue.peek();
        System.out.println("队首元素 peek = " + peek);

        /* 元素出队 */
        int poll = queue.poll();
        System.out.println("出队元素 poll = " + poll + "，出队后 queue = " + Arrays.toString(queue.toArray()));

        /* 获取队列的长度 */
        int size = queue.size();
        System.out.println("队列长度 size = " + size);

        /* 判断队列是否为空 */
        boolean isEmpty = queue.isEmpty();
        System.out.println("队列是否为空 = " + isEmpty);

        /* 测试环形数组 */
        for (int i = 0; i < 10; i++) {
            queue.offer(i);
            queue.poll();
            System.out.println("第 " + i + " 轮入队 + 出队后 queue = " + Arrays.toString(queue.toArray()));
        }
    }
}
