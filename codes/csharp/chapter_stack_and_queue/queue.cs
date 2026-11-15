/**
 * File: queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class queue {
    [Test]
    public void Test() {
        // [region]{init_queue}
        /* 初始化队列 */
        Queue<int> queue = new();
        // [endregion]{init_queue}

        // [region]{push}
        /* 元素入队 */
        queue.Enqueue(1);
        queue.Enqueue(3);
        queue.Enqueue(2);
        queue.Enqueue(5);
        queue.Enqueue(4);
        // [endregion]{push}
        Console.WriteLine("队列 queue = " + string.Join(",", queue));

        // [region]{peek}
        /* 访问队首元素 */
        int peek = queue.Peek();
        // [endregion]{peek}
        Console.WriteLine("队首元素 peek = " + peek);

        // [region]{pop}
        /* 元素出队 */
        int pop = queue.Dequeue();
        // [endregion]{pop}
        Console.WriteLine("出队元素 pop = " + pop + "，出队后 queue = " + string.Join(",", queue));

        // [region]{size}
        /* 获取队列的长度 */
        int size = queue.Count;
        // [endregion]{size}
        Console.WriteLine("队列长度 size = " + size);

        // [region]{is_empty}
        /* 判断队列是否为空 */
        bool isEmpty = queue.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine("队列是否为空 = " + isEmpty);
    }
}
