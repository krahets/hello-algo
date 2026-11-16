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
        /* 큐 초기화 */
        Queue<int> queue = new();
        // [endregion]{init_queue}

        // [region]{push}
        /* 원소 삽입 */
        queue.Enqueue(1);
        queue.Enqueue(3);
        queue.Enqueue(2);
        queue.Enqueue(5);
        queue.Enqueue(4);
        // [endregion]{push}
        Console.WriteLine("큐 queue = " + string.Join(",", queue));

        // [region]{peek}
        /* 맨 앞 원소 접근 */
        int peek = queue.Peek();
        // [endregion]{peek}
        Console.WriteLine("맨 앞 원소 peek = " + peek);

        // [region]{pop}
        /* 원소 꺼내기 */
        int pop = queue.Dequeue();
        // [endregion]{pop}
        Console.WriteLine("큐에서 꺼낸 원소 pop = " + pop + ", 큐에서 꺼낸 후 queue = " + string.Join(",", queue));

        // [region]{size}
        /* 큐의 길이 반환 */
        int size = queue.Count;
        // [endregion]{size}
        Console.WriteLine("큐 길이 size = " + size);

        // [region]{is_empty}
        /* 큐가 비어 있는지 판단 */
        bool isEmpty = queue.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine("큐가 비어 있는가 = " + isEmpty);
    }
}
