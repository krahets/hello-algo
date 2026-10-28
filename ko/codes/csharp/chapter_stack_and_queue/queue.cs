/**
 * File: queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class queue {
    [Test]
    public void Test() {
        /* 큐 초기화 */
        Queue<int> queue = new();

        /* 큐에 원소 삽입 */
        queue.Enqueue(1);
        queue.Enqueue(3);
        queue.Enqueue(2);
        queue.Enqueue(5);
        queue.Enqueue(4);
        Console.WriteLine("큐 queue = " + string.Join(",", queue));

        /* 맨 앞 원소 접근 */
        int peek = queue.Peek();
        Console.WriteLine("맨 앞 원소 peek = " + peek);

        /* 큐에서 원소 꺼내기 */
        int pop = queue.Dequeue();
        Console.WriteLine("큐에서 꺼낸 원소 pop = " + pop + ", 큐에서 꺼낸 후 queue = " + string.Join(",", queue));

        /* 큐의 길이 반환 */
        int size = queue.Count;
        Console.WriteLine("큐 길이 size = " + size);

        /* 큐가 비어 있는지 판단 */
        bool isEmpty = queue.Count == 0;
        Console.WriteLine("큐가 비어 있는가 = " + isEmpty);
    }
}
