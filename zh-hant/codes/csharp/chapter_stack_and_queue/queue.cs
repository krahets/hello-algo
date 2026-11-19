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
        /* 初始化佇列 */
        Queue<int> queue = new();
        // [endregion]{init_queue}

        // [region]{push}
        /* 元素入列 */
        queue.Enqueue(1);
        queue.Enqueue(3);
        queue.Enqueue(2);
        queue.Enqueue(5);
        queue.Enqueue(4);
        // [endregion]{push}
        Console.WriteLine("佇列 queue = " + string.Join(",", queue));

        // [region]{peek}
        /* 訪問佇列首元素 */
        int peek = queue.Peek();
        // [endregion]{peek}
        Console.WriteLine("佇列首元素 peek = " + peek);

        // [region]{pop}
        /* 元素出列 */
        int pop = queue.Dequeue();
        // [endregion]{pop}
        Console.WriteLine("出列元素 pop = " + pop + "，出列後 queue = " + string.Join(",", queue));

        // [region]{size}
        /* 獲取佇列的長度 */
        int size = queue.Count;
        // [endregion]{size}
        Console.WriteLine("佇列長度 size = " + size);

        // [region]{is_empty}
        /* 判斷佇列是否為空 */
        bool isEmpty = queue.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine("佇列是否為空 = " + isEmpty);
    }
}
