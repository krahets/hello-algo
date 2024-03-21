/**
 * File: deque.cs
 * Created Time: 2022-12-30
 * Author: moonache (microin1301@outlook.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class deque {
    [Test]
    public void Test() {
        /* 初始化双向队列 */
        // 在 C# 中，将链表 LinkedList 看作双向队列来使用
        LinkedList<int> deque = new();

        /* 元素入队 */
        deque.AddLast(2);   // 添加至队尾
        deque.AddLast(5);
        deque.AddLast(4);
        deque.AddFirst(3);  // 添加至队首
        deque.AddFirst(1);
        Console.WriteLine("双向队列 deque = " + string.Join(",", deque));

        /* 访问元素 */
        int? peekFirst = deque.First?.Value;  // 队首元素
        Console.WriteLine("队首元素 peekFirst = " + peekFirst);
        int? peekLast = deque.Last?.Value;    // 队尾元素
        Console.WriteLine("队尾元素 peekLast = " + peekLast);

        /* 元素出队 */
        deque.RemoveFirst();  // 队首元素出队
        Console.WriteLine("队首元素出队后 deque = " + string.Join(",", deque));
        deque.RemoveLast();   // 队尾元素出队
        Console.WriteLine("队尾元素出队后 deque = " + string.Join(",", deque));

        /* 获取双向队列的长度 */
        int size = deque.Count;
        Console.WriteLine("双向队列长度 size = " + size);

        /* 判断双向队列是否为空 */
        bool isEmpty = deque.Count == 0;
        Console.WriteLine("双向队列是否为空 = " + isEmpty);
    }
}
