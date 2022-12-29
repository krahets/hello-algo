/**
 * File: array_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

using NUnit.Framework;

namespace hello_algo.chapter_stack_and_queue
{

    /* 基于环形数组实现的队列 */
    class ArrayQueue
    {
        private int[] nums;     // 用于存储队列元素的数组
        private int front = 0;  // 头指针，指向队首
        private int rear = 0;   // 尾指针，指向队尾 + 1

        public ArrayQueue(int capacity)
        {
            // 初始化数组
            nums = new int[capacity];
        }

        /* 获取队列的容量 */
        public int capacity()
        {
            return nums.Length;
        }

        /* 获取队列的长度 */
        public int size()
        {
            int capacity = this.capacity();
            // 由于将数组看作为环形，可能 rear < front ，因此需要取余数
            return (capacity + rear - front) % capacity;
        }

        /* 判断队列是否为空 */
        public bool isEmpty()
        {
            return rear - front == 0;
        }

        /* 入队 */
        public void offer(int num)
        {
            if (size() == capacity())
            {
                Console.WriteLine("队列已满");
                return;
            }
            // 尾结点后添加 num
            nums[rear] = num;
            // 尾指针向后移动一位，越过尾部后返回到数组头部
            rear = (rear + 1) % capacity();
        }

        /* 出队 */
        public int poll()
        {
            int num = peek();
            // 队头指针向后移动一位，若越过尾部则返回到数组头部
            front = (front + 1) % capacity();
            return num;
        }

        /* 访问队首元素 */
        public int peek()
        {
            if (isEmpty())
                throw new Exception();
            return nums[front];
        }

        /* 返回数组 */
        public int[] toArray()
        {
            int size = this.size();
            int capacity = this.capacity();
            // 仅转换有效长度范围内的列表元素
            int[] res = new int[size];
            for (int i = 0, j = front; i < size; i++, j++)
            {
                res[i] = nums[j % capacity];
            }
            return res;
        }
    }

    public class array_queue
    {
        [Test]
        public void Test()
        {
            /* 初始化队列 */
            int capacity = 10;
            ArrayQueue queue = new ArrayQueue(capacity);

            /* 元素入队 */
            queue.offer(1);
            queue.offer(3);
            queue.offer(2);
            queue.offer(5);
            queue.offer(4);
            Console.WriteLine("队列 queue = " + string.Join(",", queue.toArray()));

            /* 访问队首元素 */
            int peek = queue.peek();
            Console.WriteLine("队首元素 peek = " + peek);

            /* 元素出队 */
            int poll = queue.poll();
            Console.WriteLine("出队元素 poll = " + poll + "，出队后 queue = " + string.Join(",", queue.toArray()));

            /* 获取队列的长度 */
            int size = queue.size();
            Console.WriteLine("队列长度 size = " + size);

            /* 判断队列是否为空 */
            bool isEmpty = queue.isEmpty();
            Console.WriteLine("队列是否为空 = " + isEmpty);

            /* 测试环形数组 */
            for (int i = 0; i < 10; i++)
            {
                queue.offer(i);
                queue.poll();
                Console.WriteLine("第 " + i + " 轮入队 + 出队后 queue = " + string.Join(",", queue.toArray()));
            }
        }
    }
}