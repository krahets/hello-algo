/**
 * File: deque.cs
 * Created Time: 2022-12-30
 * Author: moonache (microin1301@outlook.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class deque {
    [Test]
    public void Test() {
        // [region]{init_deque}
        /* 初始化雙向佇列 */
        // 在 C# 中，將鏈結串列 LinkedList 當作雙向佇列來使用
        LinkedList<int> deque = new();
        // [endregion]{init_deque}

        // [region]{push}
        /* 元素入列 */
        deque.AddLast(2);   // 新增至佇列尾
        deque.AddLast(5);
        deque.AddLast(4);
        deque.AddFirst(3);  // 新增至佇列首
        deque.AddFirst(1);
        // [endregion]{push}
        Console.WriteLine("雙向佇列 deque = " + string.Join(",", deque));

        // [region]{peek_first}
        /* 訪問元素 */
        int? peekFirst = deque.First?.Value;  // 佇列首元素
        // [endregion]{peek_first}
        Console.WriteLine("佇列首元素 peekFirst = " + peekFirst);
        // [region]{peek_last}
        int? peekLast = deque.Last?.Value;    // 佇列尾元素
        // [endregion]{peek_last}
        Console.WriteLine("佇列尾元素 peekLast = " + peekLast);

        // [region]{pop_first}
        /* 元素出列 */
        deque.RemoveFirst();  // 佇列首元素出列
        // [endregion]{pop_first}
        Console.WriteLine("佇列首元素出列後 deque = " + string.Join(",", deque));
        // [region]{pop_last}
        deque.RemoveLast();   // 佇列尾元素出列
        // [endregion]{pop_last}
        Console.WriteLine("佇列尾元素出列後 deque = " + string.Join(",", deque));

        // [region]{size}
        /* 獲取雙向佇列的長度 */
        int size = deque.Count;
        // [endregion]{size}
        Console.WriteLine("雙向佇列長度 size = " + size);

        // [region]{is_empty}
        /* 判斷雙向佇列是否為空 */
        bool isEmpty = deque.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine("雙向佇列是否為空 = " + isEmpty);
    }
}
