/**
 * File: deque.cs
 * Created Time: 2022-12-30
 * Author: moonache (microin1301@outlook.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class deque {
    [Test]
    public void Test() {
        /* 初始化雙向佇列 */
        // 在 C# 中，將鏈結串列 LinkedList 看作雙向佇列來使用
        LinkedList<int> deque = new();

        /* 元素入列 */
        deque.AddLast(2);   // 新增至佇列尾
        deque.AddLast(5);
        deque.AddLast(4);
        deque.AddFirst(3);  // 新增至佇列首
        deque.AddFirst(1);
        Console.WriteLine("雙向佇列 deque = " + string.Join(",", deque));

        /* 訪問元素 */
        int? peekFirst = deque.First?.Value;  // 佇列首元素
        Console.WriteLine("佇列首元素 peekFirst = " + peekFirst);
        int? peekLast = deque.Last?.Value;    // 佇列尾元素
        Console.WriteLine("佇列尾元素 peekLast = " + peekLast);

        /* 元素出列 */
        deque.RemoveFirst();  // 佇列首元素出列
        Console.WriteLine("佇列首元素出列後 deque = " + string.Join(",", deque));
        deque.RemoveLast();   // 佇列尾元素出列
        Console.WriteLine("佇列尾元素出列後 deque = " + string.Join(",", deque));

        /* 獲取雙向佇列的長度 */
        int size = deque.Count;
        Console.WriteLine("雙向佇列長度 size = " + size);

        /* 判斷雙向佇列是否為空 */
        bool isEmpty = deque.Count == 0;
        Console.WriteLine("雙向佇列是否為空 = " + isEmpty);
    }
}
