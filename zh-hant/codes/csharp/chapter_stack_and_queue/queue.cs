/**
 * File: queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class queue {
    [Test]
    public void Test() {
        /* 初始化佇列 */
        Queue<int> queue = new();

        /* 將元素加入佇列 */
        queue.Enqueue(1);
        queue.Enqueue(3);
        queue.Enqueue(2);
        queue.Enqueue(5);
        queue.Enqueue(4);
        Console.WriteLine("佇列 queue = " + string.Join(",", queue));

        /* 讀取隊首元素 */
        int peek = queue.Peek();
        Console.WriteLine("隊首元素 peek = " + peek);

        /* 從佇列取出元素 */
        int pop = queue.Dequeue();
        Console.WriteLine("出隊元素 pop = " + pop + "，出隊後 queue = " + string.Join(",", queue));

        /* 取得佇列長度 */
        int size = queue.Count;
        Console.WriteLine("佇列長度 size = " + size);

        /* 判斷佇列是否為空 */
        bool isEmpty = queue.Count == 0;
        Console.WriteLine("佇列是否為空 = " + isEmpty);
    }
}
