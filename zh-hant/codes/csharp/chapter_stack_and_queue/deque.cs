/**
 * File: deque.cs
 * Created Time: 2022-12-30
 * Author: moonache (microin1301@outlook.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class deque {
    [Test]
    public void Test() {
        /* 初始化雙端佇列 */
        // 在 C# 中，可用鏈結串列 LinkedList 當作雙端佇列
        LinkedList<int> deque = new();

        /* 將元素加入雙端佇列 */
        deque.AddLast(2);   // 加到隊尾
        deque.AddLast(5);
        deque.AddLast(4);
        deque.AddFirst(3);  // 加到隊首
        deque.AddFirst(1);
        Console.WriteLine("雙端佇列 deque = " + string.Join(",", deque));

        /* 讀取隊首與隊尾元素 */
        int? peekFirst = deque.First?.Value;  // 隊首元素
        Console.WriteLine("隊首元素 peekFirst = " + peekFirst);
        int? peekLast = deque.Last?.Value;    // 隊尾元素
        Console.WriteLine("隊尾元素 peekLast = " + peekLast);

        /* 從雙端佇列取出元素 */
        deque.RemoveFirst();  // 移除隊首元素
        Console.WriteLine("從隊首移除元素後 deque = " + string.Join(",", deque));
        deque.RemoveLast();   // 移除隊尾元素
        Console.WriteLine("從隊尾移除元素後 deque = " + string.Join(",", deque));

        /* 取得雙端佇列長度 */
        int size = deque.Count;
        Console.WriteLine("雙端佇列長度 size = " + size);

        /* 判斷雙端佇列是否為空 */
        bool isEmpty = deque.Count == 0;
        Console.WriteLine("雙端佇列是否為空 = " + isEmpty);
    }
}
