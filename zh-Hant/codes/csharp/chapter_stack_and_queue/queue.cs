/**
 * File: queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class queue {
    [Test]
    public void Test() {
        /* 初始化队列 */
        Queue<int> queue = new();

        /* 元素入队 */
        queue.Enqueue(1);
        queue.Enqueue(3);
        queue.Enqueue(2);
        queue.Enqueue(5);
        queue.Enqueue(4);
        Console.WriteLine("队列 queue = " + string.Join(",", queue));

        /* 访问队首元素 */
        int peek = queue.Peek();
        Console.WriteLine("队首元素 peek = " + peek);

        /* 元素出队 */
        int pop = queue.Dequeue();
        Console.WriteLine("出队元素 pop = " + pop + "，出队后 queue = " + string.Join(",", queue));

        /* 获取队列的长度 */
        int size = queue.Count;
        Console.WriteLine("队列长度 size = " + size);

        /* 判断队列是否为空 */
        bool isEmpty = queue.Count == 0;
        Console.WriteLine("队列是否为空 = " + isEmpty);
    }
}
